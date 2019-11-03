module SkillView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import ModelHandler exposing (..)


viewPassiveSkills : Model -> Build -> Html Msg
viewPassiveSkills model element =
    let
        listPassiveSkill =
            getPassiveSkills element
    in
    div [ class "item-a2" ]
        (List.map (\e -> viewSkill model e) listPassiveSkill)


viewActiveSkills : Model -> Build -> Html Msg
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
            div []
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
            div [ class "add-skill" ]
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
