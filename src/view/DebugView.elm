module DebugView exposing (..)

import BuilderView exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (Model)
import Html exposing (..)
import Stringable exposing (..)


viewModelOrError : Model -> Html Msg
viewModelOrError model =
    case model.errorMessage of
        Just message ->
            viewError message

        Nothing ->
            viewPlanner model


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
