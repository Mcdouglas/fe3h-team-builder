module Main exposing (main)

import Browser exposing (application)
import Browser.Navigation as Nav
import BuildEventListener exposing (handle)
import BuildInfoHandler exposing (toggleBuildInfo)
import CharacterEventListener exposing (handle)
import CustomTypes exposing (SortType(..))
import DataHandler exposing (initStaticData)
import ErrorHandler exposing (viewError)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (Model, ViewModel)
import Job exposing (getJobByDefault)
import JobEventListener exposing (handle)
import SkillEventListener exposing (handle)
import TeamBuilder exposing (viewBuilder)
import Url exposing (Url)
import UrlDecoder exposing (decodeUrlInTeam, encodeTeamInUrl)


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        team =
            decodeUrlInTeam (Url.toString url)

        dataModel =
            initStaticData

        initCharacterPicker =
            ( -1, Nothing )

        initSkillPicker =
            ( ( -1, -1 ), Nothing, False )

        initJobPicker =
            ( -1, getJobByDefault )

        viewModel =
            ViewModel False False False False initCharacterPicker initSkillPicker initJobPicker False SortByType "" Nothing

        errorMessage =
            Nothing

        model =
            Model team dataModel viewModel errorMessage url key
    in
    ( model, Cmd.none )


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
            ( { model | team = decodeUrlInTeam (Url.toString url), url = url }
            , Cmd.none
            )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        RewriteUrl ->
            ( model, Nav.replaceUrl model.key (encodeTeamInUrl model) )

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
