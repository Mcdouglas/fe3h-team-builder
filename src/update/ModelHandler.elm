module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)
import MasterySkill exposing (..)
import Maybe.Extra exposing (..)
import StandardSkill exposing (..)


mockCharacterBuilds : List (Maybe CharacterBuild)



-- TEST


mockCharacterBuilds =
    [ Just (CharacterBuild 0 [ 13, 14, 20 ] [ 17, 12, 13 ] 0 False)
    , Just (CharacterBuild 1 [] [] 1 True)
    , Just (CharacterBuild 2 [] [] 42 False)
    , Just (CharacterBuild 10 [] [] 3 True)
    , Just (CharacterBuild 18 [] [] 5 False)
    , Just (CharacterBuild 3 [] [] 6 True)
    , Just (CharacterBuild 11 [] [] 9 False)
    , Just (CharacterBuild 19 [] [] 3 True)
    , Just (CharacterBuild 4 [] [] 15 False)
    , Nothing
    , Just (CharacterBuild 20 [] [] 2 False)
    , Just (CharacterBuild 34 [] [] 4 True)
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
