module DebugView exposing (..)

import ViewBuilder exposing (..)
import CustomTypes exposing (..)
import DataBuilder exposing (Msg(..))
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


viewEntirePage : Model -> Html Msg
viewEntirePage model =
    div []
        [ viewJobCategoriesJson model
        , viewJobsJson model
        ]


viewJobCategoriesJson : Model -> Html Msg
viewJobCategoriesJson model =
    div []
        [ ul [] (List.map viewJobCategoryJson model.dataModel.jobCategories) ]


viewJobCategoryJson : JobCategory -> Html Msg
viewJobCategoryJson element =
    let
        str =
            toString jobCategoryToStringable element
    in
    div []
        [ text str ]


viewJobsJson : Model -> Html Msg
viewJobsJson model =
    div []
        [ ul [] (List.map viewJobJson model.dataModel.jobs) ]


viewJobJson : Job -> Html Msg
viewJobJson job =
    let
        str =
            toString jobToStringable job
    in
    div []
        [ text str ]
