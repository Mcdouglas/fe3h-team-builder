module BuildInfoHandler exposing (toggleBuildInfo)

import Dict exposing (Dict(..))
import GlobalModel exposing (Model)


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
                |> Dict.map (\_ v -> toggleInfo v)
    in
    { model | team = newTeam }
