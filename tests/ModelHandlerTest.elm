module ModelHandlerTest exposing (..)

import CustomTypes exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import GlobalModel exposing (..)
import Job exposing (..)
import Test exposing (..)


modelHandlerTest =
    describe "Test the data builder"
        [ test "Expect model contains 133 Studies"
            (\_ ->
                getJobById 18
                    |> Maybe.map (\e -> e.name)
                    |> Maybe.withDefault ""
                    |> Expect.equal "Swordmaster"
            )
        ]
