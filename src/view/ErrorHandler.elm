module ErrorHandler exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (Model)
import Html exposing (..)
import TeamBuilder exposing (..)


viewModelOrError : Model -> Html Msg
viewModelOrError model =
    case model.errorMessage of
        Just message ->
            viewError message

        Nothing ->
            viewBuilder model


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
