module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)


initBuilder : BuilderModel
initBuilder =
    BuilderModel initCharacterBuilds



-- TEST


initCharacterBuilds : List CharacterBuild
initCharacterBuilds =
    [ CharacterBuild 0 [] [] [] 0
    , CharacterBuild 1 [] [] [] 0
    , CharacterBuild 2 [] [] [] 0
    , CharacterBuild 10 [] [] [] 0
    , CharacterBuild 18 [] [] [] 0
    , CharacterBuild 3 [] [] [] 0
    , CharacterBuild 11 [] [] [] 0
    , CharacterBuild 19 [] [] [] 0
    , CharacterBuild 4 [] [] [] 0
    , CharacterBuild 12 [] [] [] 0
    , CharacterBuild 20 [] [] [] 0
    , CharacterBuild 34 [] [] [] 0
    ]


getJobsByJobSkill : JobSkill -> List Job
getJobsByJobSkill jobSkill =
    initJobs
        |> List.filter (\e -> List.member e.id jobSkill.jobIdList)
