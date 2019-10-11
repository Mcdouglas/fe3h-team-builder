module Example exposing (dataBuilderTest)

import CustomTypes exposing (..)
import DataBuilder exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import GlobalModel exposing (..)
import Test exposing (..)


dataBuilderTest =
    describe "Test the data builder"
        [ test "Expect model contains 6 jobsCategories"
            (\_ ->
                loadAllStaticData
                    |> (\m -> List.length m.jobCategories)
                    |> Expect.equal 6
            )
        , test "Expect model contains 47 jobs"
            (\_ ->
                loadAllStaticData
                    |> (\m -> List.length m.jobs)
                    |> Expect.equal 47
            )
        ]
