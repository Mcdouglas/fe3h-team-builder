module BuildInfoHandler exposing (..)

import Dict exposing (Dict)
import GlobalModel exposing (..)


toggleBuildInfo : Model -> Int -> Model
toggleBuildInfo model characterId =
    let
        toggleInfo item =
            if item.idCharacter == characterId then
                { item | hiddenInfo = not item.hiddenInfo }

            else
                item

        newTeam =
            model.team
                |> Dict.map (\k v -> toggleInfo v)
    in
    { model | team = newTeam }
