module ViewHandler exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Maybe.Extra exposing (..)


toggleBuildInfo : ( Int, Model ) -> Model
toggleBuildInfo ( characterId, model ) =
    let
        toggleInfo ( id, maybeItem ) =
            case maybeItem of
                Just item ->
                    if item.idCharacter == characterId then
                        ( id, Just { item | hiddenInfo = not item.hiddenInfo } )

                    else
                        ( id, Just item )

                Nothing ->
                    ( id, maybeItem )

        newTeam =
            model.team
                |> List.map (\e -> toggleInfo e)
    in
    { model | team = newTeam }
