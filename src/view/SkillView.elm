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


viewSkill : ( Model, Skill ) -> Html Msg
viewSkill ( model, element ) =
    div [ class "card qs" ]
        [ getSkillPicture ( model, element.id ) -- FIXME id -> idPicture
        , div
            [ class "card-text"
            , style "text-align" "center"
            , style "font-size" "10px"
            , style "hyphens" "auto"
            ]
            [ text element.name ]
        , div
            [ class "custom-popover above" ]
            [ div [ class "popover-title" ] [ text ("[" ++ element.name ++ "]") ]
            , div [ class "popover-text" ] [ text element.description ]
            , div [ class "popover-instruction" ] [ text "Cliquez pour modifier" ]
            ]
        ]


getSkillPicture : ( Model, Int ) -> Html Msg
getSkillPicture ( model, id ) =
    div
        [ class "skill-picture card-img-top"
        , style "content" ("url(\"resources/img/skill_character/" ++ String.fromInt id ++ ".png\")") -- FIXME skill_character -> skill
        ]
        []
