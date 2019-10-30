module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)
import MasterySkill exposing (..)
import Maybe.Extra exposing (..)
import StandardSkill exposing (..)


updateBuild : Model -> ( Int, Character ) -> Model
updateBuild model ( position, character ) =
    let
        initNewBuild ( id, item ) =
            if id == position then
                ( id, CharacterBuild character.id [] [] -1 False )

            else
                ( id, item )

        newTeam =
            model.team
                |> List.map (\e -> initNewBuild e)
    in
    { model | team = newTeam }


getPassiveSkills : CharacterBuild -> List (Maybe Skill)
getPassiveSkills characterBuild =
    let
        listSkills =
            characterBuild.listMasterySkillId
                |> List.map (\id -> getMasterySkill id)
                |> Maybe.Extra.values
                |> List.filter (\e -> e.combatArt == False)
                |> List.map (\e -> Just (Skill e.id e.pictureId e.name e.description e.combatArt True))
    in
    characterBuild.listStandardSkillId
        |> List.map (\id -> getStandardSkill id)
        |> Maybe.Extra.values
        |> List.filter (\e -> e.combatArt == False)
        |> List.map (\e -> Just (Skill e.id e.pictureId e.name e.description e.combatArt False))
        |> List.append listSkills
        |> List.foldr (::) [ Nothing, Nothing, Nothing, Nothing, Nothing ]
        |> List.take 5


getActiveSkills : CharacterBuild -> List (Maybe Skill)
getActiveSkills characterBuild =
    let
        listSkills =
            characterBuild.listMasterySkillId
                |> List.map (\id -> getMasterySkill id)
                |> Maybe.Extra.values
                |> List.filter (\e -> e.combatArt == True)
                |> List.map (\e -> Just (Skill e.id e.pictureId e.name e.description e.combatArt True))
    in
    characterBuild.listStandardSkillId
        |> List.map (\id -> getStandardSkill id)
        |> Maybe.Extra.values
        |> List.filter (\e -> e.combatArt == True)
        |> List.map (\e -> Just (Skill e.id e.pictureId e.name e.description e.combatArt False))
        |> List.append listSkills
        |> List.foldr (::) [ Nothing, Nothing, Nothing ]
        |> List.take 3
