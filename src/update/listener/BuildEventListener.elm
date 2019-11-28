module BuildEventListener exposing (..)

import DataHandler exposing (initBuild)
import GlobalMessage exposing (BuildPanel(..), Msg(..))
import GlobalModel exposing (Model)


handle : BuildPanel -> Model -> Model
handle msg model =
    case msg of
        DeleteBuild value ->
            deleteBuild model value

        UpBuild value ->
            upBuild model value

        DownBuild value ->
            downBuild model value

        AddBuild ->
            addBuild model


deleteBuild : Model -> Int -> Model
deleteBuild model buildIdx =
    let
        newTeam =
            if List.length model.team > 1 then
                model.team |> List.filter (\( i, build ) -> i /= buildIdx)

            else
                model.team
    in
    { model | team = newTeam }


upBuild : Model -> Int -> Model
upBuild model buildIdx =
    let
        nothingBefore =
            (model.team |> List.filter (\( i, _ ) -> i == buildIdx - 1) |> List.head) == Nothing

        newTeam =
            if nothingBefore == False then
                model.team
                    |> List.map
                        (\( i, b ) ->
                            if i == buildIdx then
                                ( buildIdx - 1, b )

                            else if i == buildIdx - 1 then
                                ( buildIdx, b )

                            else
                                ( i, b )
                        )

            else
                model.team
    in
    { model | team = newTeam }


downBuild : Model -> Int -> Model
downBuild model buildIdx =
    let
        nothingAfter =
            (model.team |> List.filter (\( i, _ ) -> i == buildIdx + 1) |> List.head) == Nothing

        newTeam =
            if nothingAfter == False then
                model.team
                    |> List.map
                        (\( i, b ) ->
                            if i == buildIdx then
                                ( buildIdx + 1, b )

                            else if i == buildIdx + 1 then
                                ( buildIdx, b )

                            else
                                ( i, b )
                        )

            else
                model.team
    in
    { model | team = newTeam }


addBuild : Model -> Model
addBuild model =
    let
        idx =
            List.length model.team

        newTeam =
            ( idx, initBuild -1 ) :: model.team
    in
    { model | team = newTeam }
