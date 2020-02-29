module DataHandlerTest exposing (dataBuilderTest)

import CustomTypes exposing (..)
import DataHandler exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import GlobalModel exposing (..)
import Test exposing (..)


dataBuilderTest =
    let
        datas =
            initStaticData
    in
    describe "Test the data builder"
        [ test "Expect model contains 133 Studies"
            (\_ ->
                datas
                    |> (\m -> List.length m.studies)
                    |> Expect.equal 132
            )
        , test "Expect model contains 6 jobsCategories"
            (\_ ->
                datas
                    |> (\m -> List.length m.jobCategories)
                    |> Expect.equal 5
            )
        , test "Expect model contains 47 jobs"
            (\_ ->
                datas
                    |> (\m -> List.length m.jobs)
                    |> Expect.equal 47
            )
        , test "Expect model contains 33 jobSkills"
            (\_ ->
                datas
                    |> (\m -> List.length m.jobSkills)
                    |> Expect.equal 33
            )
        , test "Expect model contains 54 masterySkills"
            (\_ ->
                datas
                    |> (\m -> List.length m.masterySkills)
                    |> Expect.equal 54
            )
        , test "Expect model contains 154 standardSkills"
            (\_ ->
                datas
                    |> (\m -> List.length m.standardSkills)
                    |> Expect.equal 154
            )
        ]
