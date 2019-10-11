module DataBuilder exposing (..)

import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (initJobs)
import JobCategory exposing (initJobCategories)
import JobSkill exposing (initJobSkills)
import MasterySkill exposing (initMasterySkills)
import StandardSkill exposing (initStandardSkills)
import Study exposing (initStudies)


type Msg
    = InitStaticData


loadAllStaticData : Model
loadAllStaticData =
    Model initStudies initJobCategories initJobs initJobSkills initMasterySkills initStandardSkills Nothing
