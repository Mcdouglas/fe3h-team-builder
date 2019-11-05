module SkillView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..), SkillModal(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


viewSkill : Model -> ( Int, Int, Maybe Skill ) -> Html Msg
viewSkill model ( buildPosition, skillPosition, maybeSkill ) =
    let
        onClickEvent =
            onClick (SModalMsg (OpenSkillModal ( buildPosition, skillPosition, maybeSkill )))
    in
    case maybeSkill of
        Just value ->
            div []
                [ getSkillPicture value.pictureId value.combatArt onClickEvent
                , p
                    []
                    [ text value.name ]
                , div
                    [ class "custom-popover above" ]
                    [ p [ class "popover-title" ] [ text ("[" ++ value.name ++ "]") ]
                    , p [ class "popover-text" ] [ text value.description ]
                    , p [ class "popover-instruction" ] [ text "Click to change " ]
                    ]
                ]

        _ ->
            div [ class "add-skill", style "content" "url(\"resources/lib/octicons/plus-small.svg\")", onClickEvent ] [ ]


getSkillPicture : Int -> Bool -> Attribute Msg -> Html Msg
getSkillPicture pictureId isCombatArt onClickEvent =
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
