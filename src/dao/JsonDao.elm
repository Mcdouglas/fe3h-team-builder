module JsonDao exposing (..)

-- import ClassCategoriesJsonLoader exposing (..)

import ClassCategoriesJsonLoader exposing (getClassCategories)
import CustomModel exposing (JsonModel, Msg(..))
import CustomTypes exposing (..)
import Http
import Json.Decode exposing (Decoder, Error(..), decodeString, list, string)
import JsonLoader exposing (defaultHttpCommand)


setup : ( JsonModel, Cmd Msg )
setup =
    ( JsonModel
        []
        []
        Nothing
    , defaultHttpCommand
    )


handleHttpResponse : Msg -> JsonModel -> ( JsonModel, Cmd Msg )
handleHttpResponse msg model =
    case msg of
        SendHttpRequest ->
            ( model, defaultHttpCommand )

        DataReceived (Ok elements) ->
            ( { model | elements = elements }, getClassCategories )

        DataReceived (Err httpError) ->
            ( { model
                | errorMessage = Just (buildErrorMessage httpError)
              }
            , Cmd.none
            )

        ClassCategoriesReceived (Ok elements) ->
            ( { model | classCategories = elements }, Cmd.none )

        ClassCategoriesReceived (Err httpError) ->
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
