module Main exposing (main)

import Browser exposing (sandbox)
import DataBuilder exposing (Msg(..), loadAllStaticData)
import DebugView exposing (..)
import GlobalModel exposing (Model)
import Html exposing (..)
import ModelHandler exposing (..)


init : Model
init =
    Model initBuilder loadAllStaticData Nothing


view model =
    div []
        [ viewModelOrError model ]


update : Msg -> Model -> Model
update msg model =
    model


main : Program () Model Msg
main =
    sandbox
        { init = init
        , view = view
        , update = update
        }
