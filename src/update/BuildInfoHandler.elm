module BuildInfoHandler exposing (..)

import GlobalModel exposing (..)


toggleBuildInfo : Model -> Int -> Model
toggleBuildInfo model characterId =
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
