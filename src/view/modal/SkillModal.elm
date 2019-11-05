module SkillModal exposing (..)

import Html exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html.Attributes exposing (..)


modalSkillPicker : Model -> Html Msg
modalSkillPicker model =
    let
        ( buildPosition, skillPosition, maybeSkill ) =
            model.view.skillPicker
    in
    case maybeSkill of
        Just character ->
            div
                [ class "modal"
                , hidden ( not model.view.skillModalIsOpen )
                ]
                [ div [ class "modal-content" ]
                    [ ]
                ]

        Nothing ->
            div [] []