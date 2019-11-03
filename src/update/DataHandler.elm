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


mockBuilds : List ( Int, Build )
mockBuilds =
    [ ( 0, Build 0 [ ( 0, 13, Mastery ), ( 1, 14, Mastery ), ( 2, 20, Mastery ), ( 3, 17, Standard ) ] [ ( 0, 12, Standard ), ( 1, 13, Standard ) ] 0 False )
    , ( 1, Build 1 [] [] 1 True )
    , ( 2, Build 2 [] [] 42 False )
    , ( 3, Build 10 [] [] 3 True )
    , ( 4, Build 18 [] [] 5 False )
    , ( 5, Build 3 [] [] 28 True )
    , ( 6, Build 11 [] [] 9 False )
    , ( 7, Build 19 [] [] 3 True )
    , ( 8, Build 4 [] [] 15 False )
    , ( 10, Build 20 [] [] 2 False )
    , ( 11, Build 34 [] [] 30 True )
    , ( 9, Build 22 [ ( 0, 1, Mastery ), ( 1, 2, Standard ), ( 2, 25, Mastery ) ] [ ( 0, 13, Standard ) ] 5 False )
    ]
