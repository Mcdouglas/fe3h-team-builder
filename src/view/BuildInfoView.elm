module BuildInfoView exposing (..)

import CustomTypes exposing (Build)
import GlobalMessage exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)


sectionBuildInfo : Build -> Html Msg
sectionBuildInfo element =
    div
        [ class "item-b2"
        , hidden element.hiddenInfo
        , id ("info-" ++ String.fromInt element.idCharacter)
        ]
        [ text "Hidden infos" ]
