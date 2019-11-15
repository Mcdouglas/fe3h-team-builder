module JobEventListener exposing (..)

import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)


handle : JobModal -> Model -> Model
handle msg model =
    case msg of
        OpenJobModal ->
            openModal model

        CloseJobModal ->
            closeModal model


openModal : Model -> Model
openModal model =
    let
        oldView =
            model.view

        newView =
            { oldView | jobModalIsOpen = True }
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
