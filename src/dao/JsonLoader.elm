module JsonLoader exposing (..)

import CustomModel exposing (JsonModel, Msg(..))
import Html exposing (..)
import Http
import Json.Decode exposing (Decoder, Error(..), decodeString, list, string)


defaultDecoder : Decoder (List String)
defaultDecoder =
    list string


defaultHttpCommand : Cmd Msg
defaultHttpCommand =
    Http.get
        { url = "../../resources/flat.json"
        , expect = Http.expectJson DataReceived defaultDecoder
        }


viewJsonFileOrError : JsonModel -> Html Msg
viewJsonFileOrError model =
    case model.errorMessage of
        Just message ->
            viewError message

        Nothing ->
            viewJsonFile model.elements


viewError : String -> Html Msg
viewError errorMessage =
    let
        errorHeading =
            "Couldn't fetch json file at this time."
    in
    div []
        [ h3 [] [ text errorHeading ]
        , text ("Error: " ++ errorMessage)
        ]


viewJsonFile : List String -> Html Msg
viewJsonFile jsonFile =
    div []
        [ h3 [] [ text "Json file" ]
        , ul [] (List.map viewElement jsonFile)
        ]


viewElement : String -> Html Msg
viewElement element =
    li [] [ text element ]
