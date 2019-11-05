module SkillModal exposing (..)

import GlobalMessage exposing (Msg(..), SkillModal(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


modalSkillPicker : Model -> Html Msg
modalSkillPicker model =
    let
        ( buildPosition, skillPosition, maybeSkill ) =
            model.view.skillPicker
    in
    div
        [ class "modal"
        , hidden (not model.view.skillModalIsOpen)
        ]
        [ div [ class "modal-content" ]
            [ viewSkillGrid model buildPosition
            , viewSideBar model
            ]
        ]


viewSkillGrid : Model -> Int -> Html Msg
viewSkillGrid model position =
    div [ class "characters-grid" ]
        []


viewSideBar : Model -> Html Msg
viewSideBar model =
    div [ class "sidebar" ]
        [ buttonCloseModal ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick (SModalMsg CloseSkillModal)
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
