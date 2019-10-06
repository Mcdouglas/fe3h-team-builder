module ViewHandler exposing (..)

import Category exposing (CategoryUnionType(..), categoryToString)
import CustomTypes exposing (Class, ClassCategory)
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
        , viewTableClassCategory model
        , viewTableClass model
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


viewTableClassCategory : JsonModel -> Html Msg
viewTableClassCategory model =
    div []
        [ viewHeaderClassCategory
        , viewRowsClassCategory model.classCategories
        ]


viewHeaderClassCategory : Html Msg
viewHeaderClassCategory =
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


viewRowsClassCategory : List ClassCategory -> Html Msg
viewRowsClassCategory elements =
    div []
        [ ul [] (List.map viewClassCategory elements) ]


viewClassCategory : ClassCategory -> Html Msg
viewClassCategory element =
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


viewTableClass : JsonModel -> Html Msg
viewTableClass model =
    div []
        [ viewHeaderClass
        , viewRowsClass model.classes
        ]


viewHeaderClass : Html Msg
viewHeaderClass =
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


viewRowsClass : List Class -> Html Msg
viewRowsClass elements =
    div []
        [ ul [] (List.map viewClass elements) ]


viewClass : Class -> Html Msg
viewClass element =
    tr []
        [ td []
            [ text (String.fromInt element.id) ]
        , td []
            [ text element.name ]
        , td []
            [ text (String.fromInt element.classCategoryId) ]
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



--    { id : Int, name : String, classCategoryId : Int, proficiencyIdList : List Int, certificationIdList : List Int, masteryIdList: List Int, gender : String, note: String }
