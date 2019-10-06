module HttpCommands exposing (..)

import CustomTypes exposing (ClassCategory)
import Http
import Json.Decode exposing (list)
import JsonDecoders exposing (..)


type Msg
    = SendHttpRequest
    | DataReceived (Result Http.Error (List String))
    | ClassCategoriesReceived (Result Http.Error (List ClassCategory))


defaultHttpCommand : Cmd Msg
defaultHttpCommand =
    Http.get
        { url = "../../resources/flat.json"
        , expect = Http.expectJson DataReceived defaultDecoder
        }


getClassCategories : Cmd Msg
getClassCategories =
    Http.get
        { url = "../../resources/class-categories.json"
        , expect = Http.expectJson ClassCategoriesReceived (list classCategoriesDecoder)
        }
