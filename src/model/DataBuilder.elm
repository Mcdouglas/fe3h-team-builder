module DataBuilder exposing (..)

import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)
import JobCategory exposing (..)


type Msg
    = InitStaticData


loadAllStaticData : Model
loadAllStaticData =
    Model initJobCategories initJobs Nothing
