module HiddenInfo exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


viewBuildInfo : CharacterBuild -> Html Msg
viewBuildInfo element =
    div
        [ class "item-b2"
        , hidden element.hiddenInfo
        , id ("info-" ++ String.fromInt element.idCharacter)
        ]
        [ text "Hidden infos" ]


buttonBuildInfo : CharacterBuild -> Html Msg
buttonBuildInfo element =
    let
        infoShown =
            not element.hiddenInfo
    in
    div
        [ onClick (ShowBuildInfo element.idCharacter)
        , class "item-b1"
        ]
        [ img
            [ if element.hiddenInfo == True then
                src "resources/lib/octicons/chevron-down.svg"

              else
                src "resources/lib/octicons/chevron-up.svg"
            ]
            []
        ]
