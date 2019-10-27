module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)
import MasterySkill exposing (..)
import Maybe.Extra exposing (..)
import StandardSkill exposing (..)


mockCharacterBuilds : List ( Int, Maybe CharacterBuild )
mockCharacterBuilds =
    [ ( 0, Just (CharacterBuild 0 [ 13, 14, 20 ] [ 17, 12, 13 ] 0 False) )
    , ( 1, Just (CharacterBuild 1 [] [] 1 True) )
    , ( 2, Just (CharacterBuild 2 [] [] 42 False) )
    , ( 3, Just (CharacterBuild 10 [] [] 3 True) )
    , ( 4, Just (CharacterBuild 18 [] [] 5 False) )
    , ( 5, Just (CharacterBuild 3 [] [] 28 True) )
    , ( 6, Just (CharacterBuild 11 [] [] 9 False) )
    , ( 7, Just (CharacterBuild 19 [] [] 3 True) )
    , ( 8, Just (CharacterBuild 4 [] [] 15 False) )
    , ( 9, Nothing )
    , ( 10, Just (CharacterBuild 20 [] [] 2 False) )
    , ( 11, Just (CharacterBuild 34 [] [] 30 True) )
    ]


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
