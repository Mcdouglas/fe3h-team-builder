module Main exposing (main)

import Browser exposing (sandbox)
import CustomTypes exposing (..)
import DataBuilder exposing (loadAllStaticData)
import DebugView exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (Model)
import Html exposing (..)
import ModelHandler exposing (..)
import ViewHandler exposing (..)


init : Model
init =
    Model mockCharacterBuilds loadAllStaticData False ( -1, Nothing ) Nothing


view model =
    viewModelOrError model


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowBuildInfo value ->
            toggleBuildInfo ( value, model )

        OpenCharacterModal ( id, value ) ->
            openCharacterModal model True id

        UpdateCharacterModal value ->
            updateCharacterModal model value

        UpdateBuild value ->
            closeCharacterModal (updateBuild model value) False

        CloseCharacterModal ->
            closeCharacterModal model False

        _ ->
            model


main : Program () Model Msg
main =
    sandbox
        { init = init
        , view = view
        , update = update
        }
