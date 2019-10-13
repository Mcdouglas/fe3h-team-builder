module ViewPortrait exposing (..)

import CustomTypes exposing (..)
import DataBuilder exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)


viewPortrait : Character -> Html Msg
viewPortrait element =
    div [ class "item-a" ]
        [ getPictureById element.id
        , div [] [ text element.name ]
        , div [] [ text (String.fromInt element.characterSkillId) ]
        ]


getPictureById : Int -> Html Msg
getPictureById id =
    img [ src ("resources/img/portraits/" ++ String.fromInt id ++ ".png"), width 50, height 50 ] []
