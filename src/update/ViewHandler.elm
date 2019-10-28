module ViewHandler exposing (..)

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
