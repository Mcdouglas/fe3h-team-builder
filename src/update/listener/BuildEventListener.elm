module BuildEventListener exposing (..)

import DataHandler exposing (initBuild)
import Dict exposing (Dict)
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
                model.team |> Dict.remove buildIdx

            else
                model.team
    in
    { model | team = newTeam }


upBuildInDict : Model -> Int -> Model
upBuildInDict model buildIdx =
    let
        upBuild build dict =
            let
                targetIdx =
                    if buildIdx > 0 then
                        buildIdx - 1

                    else
                        -1

                maybeBuild =
                    dict |> Dict.get targetIdx
            in
            case maybeBuild of
                Just targetBuild ->
                    dict |> Dict.insert buildIdx targetBuild |> Dict.insert targetIdx build

                Nothing ->
                    dict

        newTeam =
            model.team
                |> Dict.get buildIdx
                |> Maybe.map (\build -> upBuild build model.team)
                |> Maybe.withDefault model.team
    in
    { model | team = newTeam }


downBuildInDict : Model -> Int -> Model
downBuildInDict model buildIdx =
    let
        downBuild build dict =
            let
                targetIdx =
                    if buildIdx > 0 then
                        buildIdx + 1

                    else
                        -1

                maybeBuild =
                    dict |> Dict.get targetIdx
            in
            case maybeBuild of
                Just targetBuild ->
                    dict |> Dict.insert buildIdx targetBuild |> Dict.insert targetIdx build

                Nothing ->
                    dict

        newTeam =
            model.team
                |> Dict.get buildIdx
                |> Maybe.map (\build -> downBuild build model.team)
                |> Maybe.withDefault model.team
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
