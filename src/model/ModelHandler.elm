module ModelHandler exposing (..)

import CustomTypes exposing (..)
import Job exposing (..)


getJobByJobSkill : JobSkill -> Maybe Job
getJobByJobSkill jobSkill =
    initJobs
        |> List.filter (\e -> List.member e.id jobSkill.jobIdList)
        |> List.head
