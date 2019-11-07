module BuildInfoEventListener exposing (..)

import GlobalMessage exposing (BuildInfo(..))
import GlobalModel exposing (..)


handle : BuildInfo -> Model -> Model
handle msg model =
    case msg of
        ToggleBuildInfo value ->
            toggleBuildInfo ( value, model )


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
