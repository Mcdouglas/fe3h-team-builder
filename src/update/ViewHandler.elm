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
    in
    case build of
        Just value ->
            { model | characterModalOpen = state, currentCharacter = ( position, value ) }

        Nothing ->
            { model | characterModalOpen = state }


updateCharacterModal : Model -> ( Int, Maybe Character ) -> Model
updateCharacterModal model element =
    { model | currentCharacter = element }


closeCharacterModal : Model -> Bool -> Model
closeCharacterModal model state =
    { model | characterModalOpen = False }
