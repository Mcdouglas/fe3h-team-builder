module HttpCommands exposing (..)

import Http
import Job exposing (..)
import JobCategory exposing (JobCategory)
import Json.Decode exposing (list)
import JsonDecoders exposing (..)


type Msg
    = SendHttpRequest
    | JobCategoriesReceived (Result Http.Error (List JobCategory))
    | JobsReceived (Result Http.Error (List Job))


getJobCategories : Cmd Msg
getJobCategories =
    Http.get
        { url = "../../resources/job-categories.json"
        , expect = Http.expectJson JobCategoriesReceived (list jobCategoriesDecoder)
        }


getJobs : Cmd Msg
getJobs =
    Http.get
        { url = "../../resources/Jobs.json"
        , expect = Http.expectJson JobsReceived (list jobsDecoder)
        }
