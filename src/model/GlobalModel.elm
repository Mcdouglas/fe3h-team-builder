module GlobalModel exposing (..)

import CustomTypes exposing (..)


type alias Model =
    { jobCategories : List JobCategory
    , jobs : List Job
    , errorMessage : Maybe String
    }
