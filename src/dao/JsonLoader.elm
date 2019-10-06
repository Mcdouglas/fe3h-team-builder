module JsonLoader exposing (..)

import CustomModel exposing (Msg(..))
import Http
import Json.Decode exposing (Decoder, list, string)


defaultDecoder : Decoder (List String)
defaultDecoder =
    list string


defaultHttpCommand : Cmd Msg
defaultHttpCommand =
    Http.get
        { url = "../../resources/flat.json"
        , expect = Http.expectJson DataReceived defaultDecoder
        }
