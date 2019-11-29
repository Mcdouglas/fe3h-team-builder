module Main exposing (main)

import Browser exposing (sandbox)
import BuildEventListener exposing (handle)
import BuildInfoHandler exposing (toggleBuildInfo)
import CharacterEventListener exposing (handle)
import DataHandler exposing (..)
import ErrorHandler exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import JobEventListener exposing (handle)
import SkillEventListener exposing (..)
import TeamBuilder exposing (..)


init : Model
init =
    let
        team =
            mockBuilds

        dataModel =
            initStaticData

        initCharacterPicker =
            ( -1, Nothing )

        initSkillPicker =
            ( ( -1, -1 ), Nothing, False )

        initJobPicker =
            ( -1, Nothing )

        viewModel =
            ViewModel False initCharacterPicker False False initSkillPicker False initJobPicker

        errorMessage =
            Nothing
    in
    Model team dataModel viewModel errorMessage


view model =
    case model.errorMessage of
        Just message ->
            viewError message

        Nothing ->
            viewBuilder model


update : Msg -> Model -> Model
update msg model =
    case msg of
        BuildMsg value ->
            BuildEventListener.handle value model

        CModalMsg value ->
            CharacterEventListener.handle value model

        JModalMsg value ->
            JobEventListener.handle value model

        SModalMsg value ->
            SkillEventListener.handle value model

        ToggleBuildInfo value ->
            toggleBuildInfo model value

        _ ->
            model


main : Program () Model Msg
main =
    sandbox
        { init = init
        , view = view
        , update = update
        }
