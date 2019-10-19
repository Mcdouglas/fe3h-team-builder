module SkillView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import ModelHandler exposing (..)


viewPassiveSkills : CharacterBuild -> Html Msg
viewPassiveSkills element =
    let
        listPassiveSkill =
            getPassiveSkills element
    in
    div [ class "col-sm" ]
        (List.map (\e -> div [] [ text (e.name ++ ", ") ]) listPassiveSkill)


viewActiveSkills : CharacterBuild -> Html Msg
viewActiveSkills element =
    let
        listActiveSkill =
            getActiveSkills element
    in
    div [ class "col-sm" ]
        (List.map (\e -> div [] [ text (e.name ++ ", ") ]) listActiveSkill)
