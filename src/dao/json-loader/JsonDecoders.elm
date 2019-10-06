module JsonDecoders exposing (..)

import CustomTypes exposing (Category, ClassCategory)
import Json.Decode exposing (Decoder, int, list, string)
import Json.Decode.Pipeline exposing (optional, optionalAt, required, requiredAt)


defaultDecoder : Decoder (List String)
defaultDecoder =
    list string


classCategoriesDecoder : Decoder ClassCategory
classCategoriesDecoder =
    Json.Decode.succeed ClassCategory
        |> required "id" int
        |> required "category" string
        |> optional "experience" int 0
        |> optional "level" int 0
