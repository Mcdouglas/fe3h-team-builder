module ViewHandler exposing (..)

import CustomTypes exposing (ClassCategory)
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
        , viewTableClassCategories model
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


viewTableClassCategories : JsonModel -> Html Msg
viewTableClassCategories model =
    div []
        [ viewTableHeader
        , viewClassCategories model.classCategories
        ]


viewTableHeader : Html Msg
viewTableHeader =
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


viewClassCategories : List ClassCategory -> Html Msg
viewClassCategories elements =
    div []
        [ ul [] (List.map viewClassCategory elements) ]


viewClassCategory : ClassCategory -> Html Msg
viewClassCategory element =
    tr []
        [ td []
            [ text (String.fromInt element.id) ]
        , td []
            [ text element.category ]
        , td []
            [ text (String.fromInt element.experience) ]
        , td []
            [ text (String.fromInt element.level) ]
        ]
