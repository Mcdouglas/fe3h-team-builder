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


resourcesDirLocation =
    "../../resources/"


getJobCategories : Cmd Msg
getJobCategories =
    Http.get
        { url = resourcesDirLocation ++ "job-categories.json"
        , expect = Http.expectJson JobCategoriesReceived (list jobCategoriesDecoder)
        }


getJobs : Cmd Msg
getJobs =
    Http.get
        { url = resourcesDirLocation ++ "jobs.json"
        , expect = Http.expectJson JobsReceived (list jobsDecoder)
        }
