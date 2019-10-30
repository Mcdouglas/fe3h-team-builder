module DataBuilder exposing (..)

import Character exposing (initCharacters)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (initJobs)
import JobCategory exposing (initJobCategories)
import JobSkill exposing (initJobSkills)
import MasterySkill exposing (initMasterySkills)
import StandardSkill exposing (initStandardSkills)
import Study exposing (initStudies)


loadAllStaticData : DataModel
loadAllStaticData =
    DataModel initStudies initJobCategories initJobs initJobSkills initMasterySkills initStandardSkills initCharacters


mockCharacterBuilds : List ( Int, CharacterBuild )
mockCharacterBuilds =
    [ ( 0, CharacterBuild 0 [ 13, 14, 20 ] [ 12, 13, 17 ] 0 False )
    , ( 1, CharacterBuild 1 [] [] 1 True )
    , ( 2, CharacterBuild 2 [] [] 42 False )
    , ( 3, CharacterBuild 10 [] [] 3 True )
    , ( 4, CharacterBuild 18 [] [] 5 False )
    , ( 5, CharacterBuild 3 [] [] 28 True )
    , ( 6, CharacterBuild 11 [] [] 9 False )
    , ( 7, CharacterBuild 19 [] [] 3 True )
    , ( 8, CharacterBuild 4 [] [] 15 False )
    , ( 10, CharacterBuild 20 [] [] 2 False )
    , ( 11, CharacterBuild 34 [] [] 30 True )
    , ( 9, CharacterBuild 22 [ 1, 2, 5 ] [ 13 ] 5 False )
    ]
