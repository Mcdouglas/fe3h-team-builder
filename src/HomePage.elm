module HomePage exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http
import JsonLoader exposing (JsonModel, Msg(..), handleHttpResponse)


url : String
url =
    "./resources/class-categories.json"


view model =
    div [ class "jumbotron" ]
        [ h1 [] [ text "Welcome to Dunder Mifflin!" ]
        , p []
            [ text "Dunder Mifflin Inc. (stock symbol "
            , strong [] [ text "DMI" ]
            , text <|
                """ 
                ) is a micro-cap regional paper and office 
                supply distributor with an emphasis on servicing 
                small-business clients.
                """
            ]
        , div []
            [ button [ onClick SendHttpRequest ]
                [ text "Get data from server" ]
            , viewJsonFileOrError model
            ]
        ]


viewJsonFileOrError : JsonModel -> Html Msg
viewJsonFileOrError model =
    case model.errorMessage of
        Just message ->
            viewError message

        Nothing ->
            viewJsonFile model.jsonStr


viewJsonFile : String -> Html Msg
viewJsonFile jsonFile =
    div []
        [ h3 [] [ text "Json file" ]
        , p [] [ text jsonFile ]
        ]


viewError : String -> Html Msg
viewError errorMessage =
    let
        errorHeading =
            "Couldn't fetch json file at this time."
    in
    div []
        [ h3 [] [ text errorHeading ]
        , text ("Error: " ++ errorMessage)
        ]


update : Msg -> JsonModel -> ( JsonModel, Cmd Msg )
update msg model =
    handleHttpResponse url msg model


init : () -> ( JsonModel, Cmd Msg )
init _ =
    ( { jsonStr = ""
      , errorMessage = Nothing
      }
    , Cmd.none
    )


main : Program () JsonModel Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
