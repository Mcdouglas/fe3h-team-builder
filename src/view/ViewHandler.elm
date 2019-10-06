module ViewHandler exposing (..)

import Category exposing (CategoryUnionType(..), categoryToString)
import CustomTypes exposing (Job, JobCategory)
import Html exposing (..)
import HttpCommands exposing (Msg(..))
import JsonDao exposing (JsonModel)


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
        [ viewFlatFile model.elements
        , viewTableJobCategory model
        , viewTableJob model
        ]


viewFlatFile : List String -> Html Msg
viewFlatFile elements =
    div []
        [ h3 [] [ text "Json file" ]
        , ul [] (List.map viewElement elements)
        ]


viewElement : String -> Html Msg
viewElement element =
    li [] [ text element ]


viewTableJobCategory : JsonModel -> Html Msg
viewTableJobCategory model =
    div []
        [ viewHeaderJobCategory
        , viewRowsJobCategory model.jobCategories
        ]


viewHeaderJobCategory : Html Msg
viewHeaderJobCategory =
    tr []
        [ th []
            [ text "Id" ]
        , th []
            [ text "Category" ]
        , th []
            [ text "Experience" ]
        , th []
            [ text "Level req." ]
        ]


viewRowsJobCategory : List JobCategory -> Html Msg
viewRowsJobCategory elements =
    div []
        [ ul [] (List.map viewJobCategory elements) ]


viewJobCategory : JobCategory -> Html Msg
viewJobCategory element =
    tr []
        [ td []
            [ text (String.fromInt element.id) ]
        , td []
            [ text (categoryToString element.category) ]
        , td []
            [ text (String.fromInt element.experience) ]
        , td []
            [ text (String.fromInt element.level) ]
        ]


viewTableJob : JsonModel -> Html Msg
viewTableJob model =
    div []
        [ viewHeaderJob
        , viewRowsJob model.jobs
        ]


viewHeaderJob : Html Msg
viewHeaderJob =
    tr []
        [ th []
            [ text "Id" ]
        , th []
            [ text "Category" ]
        , th []
            [ text "Experience" ]
        , th []
            [ text "Level req." ]
        ]


viewRowsJob : List Job -> Html Msg
viewRowsJob elements =
    div []
        [ ul [] (List.map viewJob elements) ]


viewJob : Job -> Html Msg
viewJob element =
    tr []
        [ td []
            [ text (String.fromInt element.id) ]
        , td []
            [ text element.name ]
        , td []
            [ text (String.fromInt element.jobCategoryId) ]
        , td []
            [ viewSplitRow (List.map String.fromInt element.proficiencyIdList) ]
        , td []
            [ viewSplitRow (List.map String.fromInt element.certificationIdList) ]
        , td []
            [ viewSplitRow (List.map String.fromInt element.masteryIdList) ]
        , td []
            [ text element.gender ]
        , td []
            [ text element.note ]
        ]


viewSplitRow : List String -> Html Msg
viewSplitRow elements =
    text (String.join ", " elements)
