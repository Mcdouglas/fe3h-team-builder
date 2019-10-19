module BuilderExpandedView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


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
        , style "position" "absolute"
        , style "left" "calc(50% - 20px)"
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
    div
        [ class "list-group-item list-group-item-secondary"
        , id ("info-" ++ String.fromInt element.idCharacter)
        , hidden element.hiddenInfo
        ]
        [ text "Hidden infos" ]
