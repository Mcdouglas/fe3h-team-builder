module SkillEventListener exposing (..)

import Array exposing (Array)
import CustomTypes exposing (..)
import GlobalMessage exposing (SkillModal(..))
import GlobalModel exposing (..)
import ModelHandler exposing (..)


handle : SkillModal -> Model -> Model
handle msg model =
    case msg of
        OpenSkillModal value ->
            openSkillModal value model


openSkillModal : ( Int, Int, Maybe Skill ) -> Model -> Model
openSkillModal ( buildPosition, skillPosition, maybeSkill ) model =
    let
        oldView =
            model.view

        newView =
            { oldView | skillModalIsOpen = True, skillPicker = ( buildPosition, skillPosition, maybeSkill ) }
    in
    { model | view = newView }
