module SkillEventListener exposing (..)

import Array exposing (Array)
import CustomTypes exposing (..)
import GlobalMessage exposing (SkillModal(..))
import GlobalModel exposing (..)
import ModelHandler exposing (..)


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
