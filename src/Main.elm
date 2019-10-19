module Main exposing (main)

import Browser exposing (sandbox)
import DataBuilder exposing (loadAllStaticData)
import DebugView exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (Model)
import Html exposing (..)
import ModelHandler exposing (..)
import ViewHandler exposing (..)


init : Model
init =
    Model mockCharacterBuilds loadAllStaticData Nothing


view model =
    div []
        [ viewModelOrError model ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowBuildInfo value ->
            toggleBuildInfo ( value, model )

        _ ->
            model


main : Program () Model Msg
main =
    sandbox
        { init = init
        , view = view
        , update = update
        }
