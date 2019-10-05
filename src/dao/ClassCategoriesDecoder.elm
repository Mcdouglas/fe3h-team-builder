module ClassCategoriesDecoder exposing (..)

import Json.Decode exposing (Decoder, list, string)


classCategoriesDecoder : Decoder (List String)
classCategoriesDecoder =
    list string
