module DebugView exposing (..)

import Category exposing (CategoryUnionType(..), categoryToString)
import Html exposing (..)
import HttpCommands exposing (Msg(..))
import Job exposing (..)
import JobCategory exposing (..)
import JsonDao exposing (JsonModel)
import Stringable exposing (..)


viewJsonFileOrError : JsonModel -> Html Msg
viewJsonFileOrError model =
    case model.errorMessage of
        Just message ->
            viewError message

        Nothing ->
            viewEntirePage model


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


viewEntirePage : JsonModel -> Html Msg
viewEntirePage model =
    div []
        [ viewJobCategoriesJson model
        , viewJobsJson model
        ]


viewJobCategoriesJson : JsonModel -> Html Msg
viewJobCategoriesJson model =
    div []
        [ ul [] (List.map viewJobCategoryJson model.jobCategories) ]


viewJobCategoryJson : JobCategory -> Html Msg
viewJobCategoryJson element =
    let
        str =
            toString jobCategoryToStringable element
    in
    div []
        [ text str ]


viewJobsJson : JsonModel -> Html Msg
viewJobsJson model =
    div []
        [ ul [] (List.map viewJobJson model.jobs) ]


viewJobJson : Job -> Html Msg
viewJobJson job =
    let
        str =
            toString jobToStringable job
    in
    div []
        [ text str ]
