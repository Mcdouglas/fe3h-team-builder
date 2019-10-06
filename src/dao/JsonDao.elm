module JsonDao exposing (..)

import Http
import HttpCommands exposing (..)
import Job exposing (..)
import JobCategory exposing (..)
import Json.Decode exposing (Decoder, Error(..), decodeString, list, string)
import JsonDecoders exposing (..)


type alias JsonModel =
    { jobCategories : List JobCategory
    , jobs : List Job
    , errorMessage : Maybe String
    }


setup : ( JsonModel, Cmd Msg )
setup =
    ( JsonModel
        []
        []
        Nothing
    , getJobCategories
    )


handleHttpResponse : Msg -> JsonModel -> ( JsonModel, Cmd Msg )
handleHttpResponse msg model =
    case msg of
        SendHttpRequest ->
            ( model, getJobCategories )

        JobCategoriesReceived (Ok elements) ->
            ( { model | jobCategories = elements }, getJobs )

        JobCategoriesReceived (Err httpError) ->
            ( { model
                | errorMessage = Just (buildErrorMessage httpError)
              }
            , Cmd.none
            )

        JobsReceived (Ok elements) ->
            ( { model | jobs = elements }, Cmd.none )

        JobsReceived (Err httpError) ->
            ( { model
                | errorMessage = Just (buildErrorMessage httpError)
              }
            , Cmd.none
            )


handleJsonError : Json.Decode.Error -> Maybe String
handleJsonError error =
    case error of
        Failure errorMessage _ ->
            Just errorMessage

        _ ->
            Just "Error: Invalid JSON"


buildErrorMessage : Http.Error -> String
buildErrorMessage httpError =
    case httpError of
        Http.BadUrl message ->
            message

        Http.Timeout ->
            "Server is taking too long to respond. Please try again later."

        Http.NetworkError ->
            "Unable to reach server."

        Http.BadStatus statusCode ->
            "Request failed with status code: " ++ String.fromInt statusCode

        Http.BadBody message ->
            message
