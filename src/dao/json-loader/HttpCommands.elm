module HttpCommands exposing (..)

import CustomTypes exposing (Job, JobCategory)
import Http
import Json.Decode exposing (list)
import JsonDecoders exposing (..)


type Msg
    = SendHttpRequest
    | DataReceived (Result Http.Error (List String))
    | JobCategoriesReceived (Result Http.Error (List JobCategory))
    | JobsReceived (Result Http.Error (List Job))


defaultHttpCommand : Cmd Msg
defaultHttpCommand =
    Http.get
        { url = "../../resources/flat.json"
        , expect = Http.expectJson DataReceived defaultDecoder
        }


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
