module Main exposing (main)

import Browser exposing (application)
import BuildEventListener exposing (handle)
import BuildInfoHandler exposing (toggleBuildInfo)
import CharacterEventListener exposing (handle)
import CustomTypes exposing (SortType(..))
import DataHandler exposing (..)
import ErrorHandler exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import JobEventListener exposing (handle)
import SkillEventListener exposing (..)
import TeamBuilder exposing (..)
import Url exposing (..)
import Browser.Navigation as Nav


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key  =
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
            ViewModel False False False False initCharacterPicker initSkillPicker initJobPicker False SortByType ""

        errorMessage =
            Nothing
    in
    (Model team dataModel viewModel errorMessage, Cmd.none)


view : Model -> Browser.Document Msg
view model =
    { title = "Url interpretor"
    , body =
        case model.errorMessage of
            Just message ->
                [ viewError message ]

            Nothing ->
                [ viewBuilder model ]
    }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        BuildMsg value ->
            (BuildEventListener.handle value model, Cmd.none)

        CModalMsg value ->
            (CharacterEventListener.handle value model, Cmd.none)

        JModalMsg value ->
            (JobEventListener.handle value model, Cmd.none)

        SModalMsg value ->
            (SkillEventListener.handle value model, Cmd.none)

        ToggleBuildInfo value ->
            (toggleBuildInfo model value, Cmd.none)

        UrlChanged value ->
            Debug.log "UrlChange" (model, Cmd.none)
            
        LinkClicked value ->
            Debug.log "LinkClicked" (model, Cmd.none)

        _ ->
            (model, Cmd.none)


main : Program () Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }