module SkillView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..), SkillModal(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Popover exposing (..)


skillButton : Model -> ( ( Int, Int ), Maybe Skill, Bool ) -> Html Msg
skillButton model ( positions, maybeSkill, isCombatArt ) =
    let
        onClickEvent =
            onClick (SModalMsg (OpenSkillModal ( positions, maybeSkill, isCombatArt )))
    in
    case maybeSkill of
        Just value ->
            div []
                [ getSkillTile value.pictureId value.combatArt onClickEvent
                , p
                    []
                    [ text value.name ]
                , viewPopoverClickable value.name value.description "Click to change"
                ]

        _ ->
            div [ class "add-skill" ] [ div [ onClickEvent ] [] ]


viewSkill : Skill -> Html Msg
viewSkill skill =
    let
        cssClass =
            case skill.combatArt of
                True ->
                    "art-picture"

                False ->
                    "skill-picture"
    in
    div []
        [ div
            [ class ("qs " ++ cssClass)
            , style "content" ("url(\"resources/img/skills/" ++ String.fromInt skill.pictureId ++ ".png\")")
            ]
            []
        , p [] [ text skill.name ]
        , viewPopover skill.name skill.description
        ]


getSkillTile : Int -> Bool -> Attribute Msg -> Html Msg
getSkillTile pictureId isCombatArt onClickEvent =
    let
        cssClass =
            case isCombatArt of
                True ->
                    "art-picture"

                False ->
                    "skill-picture"
    in
    div
        [ class ("button-clickable qs " ++ cssClass)
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt pictureId ++ ".png\")")
        , onClickEvent
        ]
        []
