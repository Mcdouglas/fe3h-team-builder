module JsonLoader exposing (..)

import Http


type alias JsonModel =
    { jsonStr : String
    , errorMessage : Maybe String
    }


type Msg
    = SendHttpRequest
    | DataReceived (Result Http.Error String)


getJsonFile : String -> Cmd Msg
getJsonFile url =
    Http.get
        { url = url
        , expect = Http.expectString DataReceived
        }


handleHttpResponse : String -> Msg -> JsonModel -> ( JsonModel, Cmd Msg )
handleHttpResponse url msg model =
    case msg of
        SendHttpRequest ->
            ( model, getJsonFile url )

        DataReceived (Ok jsonFile) ->
            let
                jsonStr =
                    jsonFile

                -- TODO Improve with Json.Decode
            in
            ( { model | jsonStr = jsonStr }, Cmd.none )

        DataReceived (Err httpError) ->
            ( { model
                | errorMessage = Just (buildErrorMessage httpError)
              }
            , Cmd.none
            )


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
