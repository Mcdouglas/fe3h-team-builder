module SkillView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..),SkillModal(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


viewSkill : Model -> ( Int, Int, Maybe Skill ) -> Html Msg
viewSkill model (buildPosition, skillPosition, maybeSkill) =
    let
        onClickEvent = onClick (SModalMsg (OpenSkillModal ( buildPosition, skillPosition, maybeSkill )))
    in
    case maybeSkill of
        Just value ->
            div [ onClickEvent ]
                [ getSkillPicture model value.pictureId value.combatArt
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
            div [ class "add-skill", onClickEvent ]
                [ div
                    [ style "content" "url(\"resources/lib/octicons/plus-small.svg\")"
                    ]
                    []
                ]


getSkillPicture : Model -> Int -> Bool -> Html Msg
getSkillPicture model id combatArt =
    let
        cssClass =
            case combatArt of
                True ->
                    "art-picture"

                False ->
                    "skill-picture"
    in
    div
        [ class ("button-clickable qs " ++ cssClass)
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt id ++ ".png\")")
        ]
        []
