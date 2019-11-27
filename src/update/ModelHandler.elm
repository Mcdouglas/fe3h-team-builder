module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)
import MasterySkill exposing (..)
import Maybe.Extra exposing (..)
import ModelUtils exposing (masterySkillToSkill, standardSkillToSkill)
import StandardSkill exposing (..)


getSkillByType : Int -> SkillType -> Maybe Skill
getSkillByType idSkill skillType =
    case skillType of
        MasteryType ->
            getMasterySkill idSkill
                |> Maybe.andThen (\e -> Just (masterySkillToSkill e))

        StandardType ->
            getStandardSkill idSkill
                |> Maybe.andThen (\e -> Just (standardSkillToSkill e))

        _ ->
            Nothing


getSkillList : Int -> Bool -> DataModel -> List Skill
getSkillList idChar isCombatArt dataModel =
    let
        listSkills =
            dataModel.standardSkills
                |> List.filter (\s -> s.combatArt == isCombatArt)
                |> List.map (\s -> Just (standardSkillToSkill s))
    in
    dataModel.masterySkills
        |> List.filter (\m -> m.combatArt == isCombatArt)
        |> List.map (\m -> Just (masterySkillToSkill m))
        |> List.append listSkills
        |> Maybe.Extra.values
        |> List.filter (\s -> shouldCollectSkill idChar s)


genderIsLegit : GenderUnionType -> Skill -> Bool
genderIsLegit gender skill =
    if List.length skill.jobIdList > 0 then
        (skill.jobIdList
            |> List.map (\id -> getJobById id)
            |> Maybe.Extra.values
            |> List.filter (\j -> (j.gender |> Maybe.withDefault gender) == gender)
            |> List.length
        )
            > 0

    else
        True


characterIsLegit : Int -> Skill -> Bool
characterIsLegit characterId skill =
    if List.length skill.jobIdList > 0 then
        (skill.jobIdList
            |> List.map (\id -> getJobById id)
            |> Maybe.Extra.values
            |> List.filter (\j -> ((j.onlyCharacters |> List.length) == 0) || (j.onlyCharacters |> List.member characterId))
            |> List.length
        )
            > 0

    else
        True


shouldCollectSkill : Int -> Skill -> Bool
shouldCollectSkill idChar skill =
    let
        genderIsOk =
            getCharacterById idChar
                |> Maybe.map (\c -> genderIsLegit c.gender skill)
                |> Maybe.withDefault False

        characterIsOk =
            characterIsLegit idChar skill

        skillIsOk =
            genderIsOk && characterIsOk
    in
    if List.length skill.charactersOnly > 0 then
        if skill.allExcept == True then
            if List.member idChar skill.charactersOnly then
                False

            else
                skillIsOk

        else if List.member idChar skill.charactersOnly then
            skillIsOk

        else
            False

    else
        skillIsOk
