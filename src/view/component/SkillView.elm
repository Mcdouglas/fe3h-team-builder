module SkillView exposing (skillButton, viewSkill)

import CustomTypes exposing (Skill)
import GlobalMessage exposing (Msg(..), SkillModal(..))
import Html exposing (Attribute, Html, div, p, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Popover exposing (viewPopover, viewPopoverClickable)


skillButton : ( ( Int, Int ), Maybe Skill, Bool ) -> Html Msg
skillButton ( positions, maybeSkill, isCombatArt ) =
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
            if skill.combatArt then
                "art-picture"

            else
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
            if isCombatArt then
                "art-picture"

            else
                "skill-picture"
    in
    div
        [ class ("button-clickable qs " ++ cssClass)
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt pictureId ++ ".png\")")
        , onClickEvent
        ]
        []
