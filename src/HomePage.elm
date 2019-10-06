module HomePage exposing (main)

import Browser
import CustomModel exposing (JsonModel, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http
import JsonDao exposing (handleHttpResponse, setup)
import JsonLoader exposing (viewJsonFileOrError)


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
            [ viewJsonFileOrError model
            ]
        ]


update : Msg -> JsonModel -> ( JsonModel, Cmd Msg )
update msg model =
    handleHttpResponse msg model


init : () -> ( JsonModel, Cmd Msg )
init _ =
    setup


main : Program () JsonModel Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
