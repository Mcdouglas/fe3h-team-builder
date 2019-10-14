module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)


initBuilder : BuilderModel
initBuilder =
    BuilderModel initCharacterBuilds



-- TEST


initCharacterBuilds : List (Maybe CharacterBuild)
initCharacterBuilds =
    [ Just (CharacterBuild 0 [] [] [] 0)
    , Just (CharacterBuild 1 [] [] [] 0)
    , Just (CharacterBuild 2 [] [] [] 0)
    , Just (CharacterBuild 10 [] [] [] 0)
    , Just (CharacterBuild 18 [] [] [] 0)
    , Just (CharacterBuild 3 [] [] [] 0)
    , Just (CharacterBuild 11 [] [] [] 0)
    , Just (CharacterBuild 19 [] [] [] 0)
    , Just (CharacterBuild 4 [] [] [] 0)
    , Nothing
    , Just (CharacterBuild 20 [] [] [] 0)
    , Just (CharacterBuild 34 [] [] [] 0)
    ]


getJobsByJobSkill : JobSkill -> List Job
getJobsByJobSkill jobSkill =
    initJobs
        |> List.filter (\e -> List.member e.id jobSkill.jobIdList)
