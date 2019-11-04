module CharacterEventListener exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (CharacterModal(..))
import GlobalModel exposing (..)


handle : CharacterModal -> Model -> Model
handle msg model =
    case msg of
        OpenCharacterModal ( id, value ) ->
            openModal model True id

        UpdateCurrentCharacter value ->
            updateCurrent model value

        UpdateBuildWithCharacter value ->
            closeModal (updateBuild model value) False

        CloseCharacterSelector ->
            closeModal model False


openModal : Model -> Bool -> Int -> Model
openModal model state position =
    let
        build =
            model.team
                |> List.filter (\( id, e ) -> id == position)
                |> List.map (\( id, e ) -> getCharacterById e.idCharacter)
                |> List.head

        oldView =
            model.view

        newView =
            case build of
                Just value ->
                    { oldView | characterSelectorIsOpen = state, currentCharacter = ( position, value ) }

                Nothing ->
                    { oldView | characterSelectorIsOpen = state }
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


closeModal : Model -> Bool -> Model
closeModal model state =
    let
        oldView =
            model.view

        newView =
            { oldView | characterSelectorIsOpen = False }
    in
    { model | view = newView }


updateBuild : Model -> ( Int, Character ) -> Model
updateBuild model ( position, character ) =
    let
        initNewBuild ( id, item ) =
            if id == position then
                ( id, Build character.id [] [] -1 False )

            else
                ( id, item )

        newTeam =
            model.team
                |> List.map (\e -> initNewBuild e)
    in
    { model | team = newTeam }
