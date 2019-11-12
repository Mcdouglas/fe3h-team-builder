module CharacterEventListener exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import DataHandler exposing (initBuild)
import GlobalMessage exposing (CharacterModal(..))
import GlobalModel exposing (..)


handle : CharacterModal -> Model -> Model
handle msg model =
    case msg of
        OpenCharacterModal id ->
            openModal model id

        UpdateCurrentCharacter value ->
            updateCurrent model value

        UpdateBuildWithCharacter value ->
            closeModal (updateBuild model value)

        CloseCharacterModal ->
            closeModal model


openModal : Model -> Int -> Model
openModal model position =
    let
        maybeCharacter =
            model.team
                |> List.filter (\( id, e ) -> id == position)
                |> List.map (\( id, e ) -> getCharacterById e.idCharacter)
                |> List.head

        oldView =
            model.view

        newView =
            case maybeCharacter of
                Just value ->
                    { oldView | characterSelectorIsOpen = True, currentCharacter = ( position, value ) }

                Nothing ->
                    { oldView | characterSelectorIsOpen = True }
    in
    { model | view = newView }


closeModal : Model -> Model
closeModal model =
    let
        oldView =
            model.view

        newView =
            { oldView | characterSelectorIsOpen = False }
    in
    { model | view = newView }


updateCurrent : Model -> ( Int, Maybe Character ) -> Model
updateCurrent model element =
    let
        oldView =
            model.view

        newView =
            { oldView | currentCharacter = element }
    in
    { model | view = newView }


updateBuild : Model -> ( Int, Character ) -> Model
updateBuild model ( position, character ) =
    let
        initNewBuild ( id, item ) =
            if id == position then
                ( id, initBuild character.id )

            else
                ( id, item )

        alreadySelected =
            not
                (model.team
                    |> List.filter (\( idx, build ) -> build.idCharacter == character.id)
                    |> List.isEmpty
                )

        newTeam =
            if alreadySelected then
                model.team

            else
                model.team
                    |> List.map (\e -> initNewBuild e)
    in
    { model | team = newTeam }
