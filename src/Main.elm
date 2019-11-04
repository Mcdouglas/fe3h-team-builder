module Main exposing (main)

import Browser exposing (sandbox)
import BuildInfoEventListener exposing (..)
import CharacterEventListener exposing (..)
import DataHandler exposing (..)
import ErrorHandler exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)


init : Model
init =
    let
        team =
            mockBuilds

        dataModel =
            initStaticData

        viewModel =
            ViewModel False ( -1, Nothing ) False

        errorMessage =
            Nothing
    in
    Model team dataModel viewModel errorMessage


view model =
    viewModelOrError model


update : Msg -> Model -> Model
update msg model =
    case msg of
        BInfoMsg value ->
            BuildInfoEventListener.handle value model

        CModalMsg value ->
            CharacterEventListener.handle value model

        _ ->
            model


main : Program () Model Msg
main =
    sandbox
        { init = init
        , view = view
        , update = update
        }
