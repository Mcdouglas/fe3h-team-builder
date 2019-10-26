module SkillView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import ModelHandler exposing (..)


viewPassiveSkills : ( Model, CharacterBuild ) -> Html Msg
viewPassiveSkills ( model, element ) =
    let
        listPassiveSkill =
            getPassiveSkills element
    in
    div [ class "item-a2" ]
        (List.map (\e -> viewSkill ( model, e )) listPassiveSkill)


viewActiveSkills : ( Model, CharacterBuild ) -> Html Msg
viewActiveSkills ( model, element ) =
    let
        listActiveSkill =
            getActiveSkills element
    in
    div [ class "item-a3" ]
        (List.map (\e -> viewSkill ( model, e )) listActiveSkill)


viewSkill : ( Model, Maybe Skill ) -> Html Msg
viewSkill ( model, element ) =
    case element of
        Just value ->
            div [ class "card qs" ]
                [ getSkillPicture ( model, value.pictureId, value.combatArt )
                , div
                    [ class "card-text"
                    , style "text-align" "center"
                    , style "font-size" "10px"
                    , style "hyphens" "auto"
                    ]
                    [ text value.name ]
                , div
                    [ class "custom-popover above" ]
                    [ div [ class "popover-title" ] [ text ("[" ++ value.name ++ "]") ]
                    , div [ class "popover-text" ] [ text value.description ]
                    , div [ class "popover-instruction" ] [ text "Cliquez pour modifier" ]
                    ]
                ]

        _ ->
            div [ class "card qs" ]
                [ div
                    [ class "add-skill card-img-top"
                    , style "content" "url(\"resources/lib/octicons/plus-small.svg\")"
                    ]
                    []
                , div
                    [ class "custom-popover above" ]
                    [ div [ class "popover-instruction" ] [ text "Ajouter" ] ]
                ]


getSkillPicture : ( Model, Int, Bool ) -> Html Msg
getSkillPicture ( model, id, combatArt ) =
    let
        cssClass =
            if combatArt == True then
                "art-picture"

            else
                "skill-picture"
    in
    div
        [ class ("card-img-top " ++ cssClass)
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt id ++ ".png\")")
        ]
        []
