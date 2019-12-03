module DataHandler exposing (..)

import Character exposing (initCharacters)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (initJobs)
import JobCategory exposing (initJobCategories)
import JobSkill exposing (initJobSkills)
import MasterySkill exposing (initMasterySkills)
import StandardSkill exposing (initStandardSkills)
import Study exposing (initStudies)


initStaticData : DataModel
initStaticData =
    DataModel initStudies initJobCategories initJobs initJobSkills initMasterySkills initStandardSkills initCharacters


initTeam : List ( Int, Build )
initTeam =
    [ ( 0, initBuild 0 ) ]


initBuild : Int -> Build
initBuild idCharacter =
    Build idCharacter [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] -1 True


mockBuilds : List ( Int, Build )
mockBuilds =
    [ ( 0, Build 0 [ ( 0, 13, MasteryType ), ( 1, 14, MasteryType ), ( 2, 20, MasteryType ), ( 3, 17, StandardType ), ( 4, -1, NoType ) ] [ ( 0, 12, StandardType ), ( 1, 13, StandardType ), ( 2, -1, NoType ) ] -1 False )
    , ( 1, Build 1 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] -1 True )
    , ( 2, Build 2 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 42 True )
    , ( 3, Build 10 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 3 True )
    , ( 4, Build 18 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 5 True )
    , ( 5, Build 3 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 28 True )
    , ( 6, Build 11 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 9 True )
    , ( 7, Build 19 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 3 True )
    , ( 8, Build 4 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 15 True )
    , ( 10, Build 20 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 2 True )
    , ( 11, Build 34 [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, -1, NoType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 30 True )
    , ( 9, Build 22 [ ( 0, 1, MasteryType ), ( 1, 2, StandardType ), ( 2, 25, MasteryType ), ( 3, -1, NoType ), ( 4, -1, NoType ) ] [ ( 0, 13, StandardType ), ( 1, -1, NoType ), ( 2, -1, NoType ) ] 5 True )
    ]
