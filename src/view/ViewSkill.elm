module ViewSkill exposing (..)

import CustomTypes exposing (..)
import DataBuilder exposing (Msg(..))
import Html exposing (..)
import ModelHandler exposing (..)


viewPassiveSkills : CharacterBuild -> Html Msg
viewPassiveSkills element =
    let
        listPassiveSkill =
            getPassiveSkills element
    in
    div []
        (List.map (\e -> div [] [ text (e.name ++ ", ") ]) listPassiveSkill)


viewActiveSkills : CharacterBuild -> Html Msg
viewActiveSkills element =
    let
        listActiveSkill =
            getActiveSkills element
    in
    div []
        (List.map (\e -> div [] [ text (e.name ++ ", ") ]) listActiveSkill)
