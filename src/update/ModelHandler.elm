module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)
import MasterySkill exposing (..)
import Maybe.Extra exposing (..)
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


getSkillList : Bool -> DataModel -> List Skill
getSkillList isCombatArt dataModel =
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
