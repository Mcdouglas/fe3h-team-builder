module ViewHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Maybe.Extra exposing (..)


toggleBuildInfo : ( Int, Model ) -> Model
toggleBuildInfo ( characterId, model ) =
    let
        toggleInfo ( id, item ) =
            if item.idCharacter == characterId then
                ( id, { item | hiddenInfo = not item.hiddenInfo } )

            else
                ( id, item )

        newTeam =
            model.team
                |> List.map (\e -> toggleInfo e)
    in
    { model | team = newTeam }


openCharacterSelector : Model -> Bool -> Int -> Model
openCharacterSelector model state position =
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


updateCharacterSelector : Model -> ( Int, Maybe Character ) -> Model
updateCharacterSelector model element =
    let
        oldView =
            model.view

        newView =
            { oldView | currentCharacter = element }
    in
    { model | view = newView }


closeCharacterSelector : Model -> Bool -> Model
closeCharacterSelector model state =
    let
        oldView =
            model.view

        newView =
            { oldView | characterSelectorIsOpen = False }
    in
    { model | view = newView }
