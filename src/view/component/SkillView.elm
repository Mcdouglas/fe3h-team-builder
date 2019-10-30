module SkillView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import ModelHandler exposing (..)


viewPassiveSkills : Model -> CharacterBuild -> Html Msg
viewPassiveSkills model element =
    let
        listPassiveSkill =
            getPassiveSkills element
    in
    div [ class "item-a2" ]
        (List.map (\e -> viewSkill model e) listPassiveSkill)


viewActiveSkills : Model -> CharacterBuild -> Html Msg
viewActiveSkills model element =
    let
        listActiveSkill =
            getActiveSkills element
    in
    div [ class "item-a3" ]
        (List.map (\e -> viewSkill model e) listActiveSkill)


viewSkill : Model -> Maybe Skill -> Html Msg
viewSkill model element =
    case element of
        Just value ->
            div [ class "qs card" ]
                [ getSkillPicture model value.pictureId value.combatArt
                , div
                    [ class "card-text" ]
                    [ text value.name ]
                , div
                    [ class "custom-popover above" ]
                    [ div [ class "popover-title" ] [ text ("[" ++ value.name ++ "]") ]
                    , div [ class "popover-text" ] [ text value.description ]
                    , div [ class "popover-instruction" ] [ text "Click to change " ]
                    ]
                ]

        _ ->
            div [ class "add-skill qs card" ]
                [ div
                    [ class "card-img-top"
                    , style "content" "url(\"resources/lib/octicons/plus-small.svg\")"
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
        [ class ("tile-clickable card-img-top " ++ cssClass)
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt id ++ ".png\")")
        ]
        []
