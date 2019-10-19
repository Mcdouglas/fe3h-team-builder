module ViewBuilder exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Stringable exposing (..)
import ViewJob exposing (..)
import ViewPortrait exposing (..)
import ViewSkill exposing (..)


viewPlanner : Model -> Html Msg
viewPlanner model =
    div [ class "planner" ]
        [ h3 [] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTable model.team
        ]


viewTable : List (Maybe CharacterBuild) -> Html Msg
viewTable team =
    ul [ class "list-group mx-2" ]
        (List.map (\e -> viewSelector ( team, e )) team)


viewSelector : ( List (Maybe CharacterBuild), Maybe CharacterBuild ) -> Html Msg
viewSelector ( model, element ) =
    case element of
        Just value ->
            viewRow value

        Nothing ->
            li [ class "list-group-item list-group-item-secondary" ] [ text "TODO" ]


viewRow : CharacterBuild -> Html Msg
viewRow element =
    div []
        [ li [ class "list-group-item mt-3" ]
            [ viewPortrait element
            , viewPassiveSkills element
            , viewActiveSkills element
            , viewJobSkills element
            , toggleBuildInfo element
            ]
        , viewBuildInfo element
        ]


toggleBuildInfo : CharacterBuild -> Html Msg
toggleBuildInfo element =
    let
        infoShown =
            not element.hiddenInfo
    in
    button
        [ onClick (ShowBuildInfo element.idCharacter)
        , type_ "button"
        , style "height" "20px"
        , style "width" "40px"
        , class "bg-light rounded border"
        , style "border-color" "grey"
        , style "position" "relative"
        , style "bottom" "-1.5rem"
        , style "left" "calc(50% - 40px)"
        , style "z-index" "1"
        , style "outline" "none"
        ]
        [ img
            [ if element.hiddenInfo == True then
                src "resources/lib/octicons/chevron-down.svg"

              else
                src "resources/lib/octicons/chevron-up.svg"
            ]
            []
        ]


viewBuildInfo : CharacterBuild -> Html Msg
viewBuildInfo element =
    let
        cssClassHidden =
            if element.hiddenInfo == True then
                "invisible"

            else
                "visible"
    in
    li
        [ class "list-group-item list-group-item-secondary"
        , id ("info-" ++ String.fromInt element.idCharacter)
        , hidden element.hiddenInfo
        ]
        [ text "Hidden infos" ]
