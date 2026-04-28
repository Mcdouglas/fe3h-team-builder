module BuildEventListener exposing (handle)

import Dict exposing (Dict(..))
import GlobalMessage exposing (BuildPanel(..), Msg(..))
import GlobalModel exposing (Model)


handle : BuildPanel -> Model -> Model
handle msg model =
    case msg of
        DeleteBuild value ->
            deleteBuild model value

        UpBuild value ->
            upBuildInDict model value

        DownBuild value ->
            downBuildInDict model value

        AddBuild ->
            addBuild model


deleteBuild : Model -> Int -> Model
deleteBuild model buildIdx =
    let
        newTeam =
            if Dict.size model.team > 1 then
                model.team |> Dict.remove buildIdx |> Dict.values |> List.indexedMap Tuple.pair |> Dict.fromList

            else
                model.team
    in
    { model | team = newTeam }


upBuildInDict : Model -> Int -> Model
upBuildInDict model buildIdx =
    let
        newTeam =
            if buildIdx > 0 then
                let
                    buildToDown =
                        model.team |> Dict.get (buildIdx - 1)

                    buildToUp =
                        model.team |> Dict.get buildIdx
                in
                model.team |> Dict.update buildIdx (\_ -> buildToDown) |> Dict.update (buildIdx - 1) (\_ -> buildToUp)

            else
                model.team
    in
    { model | team = newTeam }


downBuildInDict : Model -> Int -> Model
downBuildInDict model buildIdx =
    let
        newTeam =
            if buildIdx < 11 then
                let
                    buildToDown =
                        model.team |> Dict.get buildIdx

                    buildToUp =
                        model.team |> Dict.get (buildIdx + 1)
                in
                model.team |> Dict.update buildIdx (\_ -> buildToUp) |> Dict.update (buildIdx + 1) (\_ -> buildToDown)

            else
                model.team
    in
    { model | team = newTeam }


addBuild : Model -> Model
addBuild model =
    let
        oldView =
            model.view

        newView =
            { oldView | characterModalIsOpen = True, isCreatingBuild = True }
    in
    { model | view = newView }
