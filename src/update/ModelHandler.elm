module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)
import MasterySkill exposing (..)
import Maybe.Extra exposing (..)
import StandardSkill exposing (..)


initBuilder : BuilderModel
initBuilder =
    BuilderModel mockCharacterBuilds



-- TEST


mockCharacterBuilds : List (Maybe CharacterBuild)
mockCharacterBuilds =
    [ Just (CharacterBuild 0 [ 13, 14, 20 ] [ 17, 12, 13 ] 0)
    , Just (CharacterBuild 1 [] [] 1)
    , Just (CharacterBuild 2 [] [] 42)
    , Just (CharacterBuild 10 [] [] 3)
    , Just (CharacterBuild 18 [] [] 5)
    , Just (CharacterBuild 3 [] [] 6)
    , Just (CharacterBuild 11 [] [] 9)
    , Just (CharacterBuild 19 [] [] 3)
    , Just (CharacterBuild 4 [] [] 15)
    , Nothing
    , Just (CharacterBuild 20 [] [] 2)
    , Just (CharacterBuild 34 [] [] 4)
    ]


getPassiveSkills : CharacterBuild -> List Skill
getPassiveSkills characterBuild =
    let
        listSkills =
            characterBuild.listMasterySkillId
                |> List.map (\id -> getMasterySkill id)
                |> Maybe.Extra.values
                |> List.filter (\e -> e.combatArt == False)
                |> List.map (\e -> Skill e.id e.name e.description e.combatArt)
    in
    characterBuild.listStandardSkillId
        |> List.map (\id -> getStandardSkill id)
        |> Maybe.Extra.values
        |> List.filter (\e -> e.combatArt == False)
        |> List.map (\e -> Skill e.id e.name e.description e.combatArt)
        |> List.append listSkills


getActiveSkills : CharacterBuild -> List Skill
getActiveSkills characterBuild =
    let
        listSkills =
            characterBuild.listMasterySkillId
                |> List.map (\id -> getMasterySkill id)
                |> Maybe.Extra.values
                |> List.filter (\e -> e.combatArt == True)
                |> List.map (\e -> Skill e.id e.name e.description e.combatArt)
    in
    characterBuild.listStandardSkillId
        |> List.map (\id -> getStandardSkill id)
        |> Maybe.Extra.values
        |> List.filter (\e -> e.combatArt == True)
        |> List.map (\e -> Skill e.id e.name e.description e.combatArt)
        |> List.append listSkills
