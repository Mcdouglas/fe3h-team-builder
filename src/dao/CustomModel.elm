module CustomModel exposing (..)

import CustomTypes exposing (..)
import Http


type alias JsonModel =
    { elements : List String
    , classCategories : List ClassCategory
    , errorMessage : Maybe String
    }


type Msg
    = SendHttpRequest
    | DataReceived (Result Http.Error (List String))
    | ClassCategoriesReceived (Result Http.Error (List ClassCategory))
