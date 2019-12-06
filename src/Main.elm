module Main exposing (main)

import Browser exposing (application)
<<<<<<< HEAD
import Browser.Navigation as Nav
=======
>>>>>>> Transform sandbox -> application
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
<<<<<<< HEAD
import UrlDecoder exposing (..)


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
=======
import Browser.Navigation as Nav


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key  =
>>>>>>> Transform sandbox -> application
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

        model =
            Model team dataModel viewModel errorMessage url key
    in
<<<<<<< HEAD
    ( model, Nav.replaceUrl model.key (encodeTeamInUrl model) )
=======
    (Model team dataModel viewModel errorMessage url key, Cmd.none)
>>>>>>> Replace by other kind of url handlers


view : Model -> Browser.Document Msg
view model =
    { title = "FE3H-TEAM-BUILDER"
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
            update RewriteUrl (BuildEventListener.handle value model)

        CModalMsg value ->
            update RewriteUrl (CharacterEventListener.handle value model)

        JModalMsg value ->
            update RewriteUrl (JobEventListener.handle value model)

        SModalMsg value ->
            update RewriteUrl (SkillEventListener.handle value model)

        ToggleBuildInfo value ->
            ( toggleBuildInfo model value, Cmd.none )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

<<<<<<< HEAD
        RewriteUrl ->
            ( model, Nav.replaceUrl model.key (encodeTeamInUrl model) )
=======
        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )
            
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )
>>>>>>> Replace by other kind of url handlers

        _ ->
            ( model, Cmd.none )


main : Program () Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
