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
        , class "item-b1 bg-light rounded border"
        ]
        [ img
            [ if element.hiddenInfo == True then
                src "resources/lib/octicons/chevron-down.svg"

              else
                src "resources/lib/octicons/chevron-up.svg"
            , style "vertical-align" "baseline"
            ]
            []
        ]


viewBuildInfo : CharacterBuild -> Html Msg
viewBuildInfo element =
    div
        [ class ("item-b2")
        , hidden element.hiddenInfo
        , id ("info-" ++ String.fromInt element.idCharacter)
        ]
        [ text "Hidden infos" ]
