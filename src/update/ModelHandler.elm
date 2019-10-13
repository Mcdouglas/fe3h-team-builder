module ModelHandler exposing (..)

import CustomTypes exposing (..)
import Job exposing (..)


getJobsByJobSkill : JobSkill -> List Job
getJobsByJobSkill jobSkill =
    initJobs
        |> List.filter (\e -> List.member e.id jobSkill.jobIdList)
