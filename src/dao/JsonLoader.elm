module JsonLoader exposing (..)

import ClassCategoriesDecoder exposing (classCategoriesDecoder)
import Http
import Json.Decode exposing (Error(..), decodeString)


type alias JsonModel =
    { jsonStr : String
    , jsonStrs : List String
    , errorMessage : Maybe String
    }


type Msg
    = SendHttpRequest
    | DataReceived (Result Http.Error (List String))


getJsonFile : String -> Cmd Msg
getJsonFile url =
    Http.get
        { url = url
        , expect = Http.expectJson DataReceived classCategoriesDecoder
        }


handleHttpResponse : String -> Msg -> JsonModel -> ( JsonModel, Cmd Msg )
handleHttpResponse url msg model =
    case msg of
        SendHttpRequest ->
            ( model, getJsonFile url )

        DataReceived (Ok jsonStrs) ->
            ( { model | jsonStrs = jsonStrs }, Cmd.none )

        DataReceived (Err httpError) ->
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
