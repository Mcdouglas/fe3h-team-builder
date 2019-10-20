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
    div [ class "col-sm border-right" ]
        (List.map (\e -> div [] [ text (e.name ++ ", ") ]) listPassiveSkill)


viewActiveSkills : ( Model, CharacterBuild ) -> Html Msg
viewActiveSkills ( model, element ) =
    let
        listActiveSkill =
            getActiveSkills element
    in
    div [ class "col-sm border-right" ]
        (List.map (\e -> div [] [ text (e.name ++ ", ") ]) listActiveSkill)
