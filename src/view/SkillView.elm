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
            , style "overflow-wrap" "anywhere"
            ]
            [ text element.name ]
        , div [ class "custom-popover above" ] [ text element.description ]
        ]


getSkillPicture : ( Model, Int ) -> Html Msg
getSkillPicture ( model, id ) =
    div
        [ class "card-img-top"
        , style "width" "2rem"
        , style "height" "2rem"
        , style "margin" "0 auto"
        , style "border-radius" "16px"
        , style "content" ("url(\"resources/img/skill_character/" ++ String.fromInt id ++ ".png\")") -- FIXME skill_character -> skill
        ]
        []
