module JobEventListener exposing (..)

import CustomTypes exposing (Job)
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)


handle : JobModal -> Model -> Model
handle msg model =
    case msg of
        OpenJobModal value ->
            openModal model value

        CloseJobModal ->
            closeModal model

        UpdateJobPicker value ->
            updateJobPicker model value


updateJobPicker : Model -> ( Int, Maybe Job ) -> Model
updateJobPicker model picker =
    let
        oldView =
            model.view

        newView =
            { oldView | jobPicker = picker }
    in
    { model | view = newView }


openModal : Model -> ( Int, Maybe Job ) -> Model
openModal model currentJob =
    let
        oldView =
            model.view

        newView =
            { oldView | jobModalIsOpen = True, jobPicker = currentJob }
    in
    { model | view = newView }


closeModal : Model -> Model
closeModal model =
    let
        oldView =
            model.view

        newView =
            { oldView | jobModalIsOpen = False }
    in
    { model | view = newView }
