module ClassCategoriesJsonLoader exposing (..)

import CustomModel exposing (JsonModel, Msg(..))
import CustomTypes exposing (Category, ClassCategory)
import Http
import Json.Decode exposing (Decoder, int, list, string)
import Json.Decode.Pipeline exposing (optional, optionalAt, required, requiredAt)
import JsonLoader exposing (..)


classCategoriesDecoder : Decoder ClassCategory
classCategoriesDecoder =
    Json.Decode.succeed ClassCategory
        |> required "id" int
        |> required "category" string
        |> optional "experience" int 0
        |> optional "level" int 0


getClassCategories : Cmd Msg
getClassCategories =
    Http.get
        { url = "../../resources/class-categories.json"
        , expect = Http.expectJson ClassCategoriesReceived (list classCategoriesDecoder)
        }
