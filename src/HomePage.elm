module HomePage exposing (main)

import Browser exposing (sandbox)
import DataBuilder exposing (Msg(..), loadAllStaticData)
import DebugView exposing (..)
import GlobalModel exposing (Model)
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


init : Model
init =
    loadAllStaticData


view model =
    div [ class "jumbotron" ]
        [ h1 [] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , div []
            [ viewModelOrError model ]
        ]


update : Msg -> Model -> Model
update msg model =
    model


main : Program () Model Msg
main =
    sandbox
        { init = init
        , view = view
        , update = update
        }
