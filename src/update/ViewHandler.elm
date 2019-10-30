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


openCharacterModal : Model -> Bool -> Int -> Model
openCharacterModal model state position =
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
                    { oldView | characterModalOpen = state, currentCharacter = ( position, value ) }

                Nothing ->
                    { oldView | characterModalOpen = state }
    in
    { model | view = newView }


updateCharacterModal : Model -> ( Int, Maybe Character ) -> Model
updateCharacterModal model element =
    let
        oldView =
            model.view

        newView =
            { oldView | currentCharacter = element }
    in
    { model | view = newView }


closeCharacterModal : Model -> Bool -> Model
closeCharacterModal model state =
    let
        oldView =
            model.view

        newView =
            { oldView | characterModalOpen = False }
    in
    { model | view = newView }
