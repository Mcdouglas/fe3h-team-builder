module SkillEventListener exposing (..)

import GlobalModel exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (SkillModal(..))
import ModelHandler exposing (..)
import Array exposing (Array)

handle : SkillModal -> Model -> Model
handle msg model =
    case msg of
        OpenSkillModal ( buildPosition, skillPosition, maybeSkill ) -> 
            openSkillModal buildPosition skillPosition maybeSkill model

openSkillModal : Int -> Int -> Maybe Skill -> Model -> Model
openSkillModal buildPosition skillPosition maybeSkill model =
    let
        oldView =
            model.view

        newView =
            case maybeSkill of
                Just value ->
                    { oldView | skillModalIsOpen = True, skillPicker = ( buildPosition, skillPosition, Just value ) }

                Nothing ->
                    { oldView | skillModalIsOpen = True }
    in
    { model | view = newView }