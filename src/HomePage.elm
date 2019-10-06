module HomePage exposing (main)

import Browser
import DebugView exposing (viewJsonFileOrError)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http
import HttpCommands exposing (Msg(..))
import JsonDao exposing (JsonModel, handleHttpResponse, setup)


view model =
    div [ class "jumbotron" ]
        [ h1 [] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , div []
            [ viewJsonFileOrError model ]
        ]


update : Msg -> JsonModel -> ( JsonModel, Cmd Msg )
update msg model =
    handleHttpResponse msg model


init : () -> ( JsonModel, Cmd Msg )
init _ =
    setup


main : Program () JsonModel Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
