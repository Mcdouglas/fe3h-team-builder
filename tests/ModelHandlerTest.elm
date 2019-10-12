module ModelHandlerTest exposing (..)

import CustomTypes exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import GlobalModel exposing (..)
import Job exposing (..)
import JobCategory exposing (..)
import Test exposing (..)


modelHandlerTest =
    let
        -- default value
        wrongJob =
            Job -1 "" 0 [] [] Nothing Nothing Nothing Nothing

        wrongJobCategory =
            JobCategory -1 Beginner Nothing Nothing

        -- jobs
        commoner =
            getJobById 0

        hero =
            getJobById 19

        gremory =
            getJobById 36

        enlightenedOne =
            getJobById 40

        -- jobCategories
        intermerdiate =
            getJobCategoryById 2

        unique =
            getJobCategoryById 5
    in
    describe "Test the data builder"
        [ describe "Test getJobById"
            [ test "Expect job is Commoner"
                (\_ ->
                    commoner
                        |> Maybe.withDefault wrongJob
                        |> Expect.equal
                            { id = 0
                            , name = "Commoner"
                            , jobCategoryId = 0
                            , proficiencyList = []
                            , studyIdList = []
                            , gender = Nothing
                            , magicUsage = Just CanUseSomeMagic
                            , note = Nothing
                            , customExperience = Nothing
                            }
                )
            , test "Expect job is Hero"
                (\_ ->
                    hero
                        |> Maybe.withDefault wrongJob
                        |> Expect.equal
                            { id = 19
                            , name = "Hero"
                            , jobCategoryId = 3
                            , proficiencyList = [ Proficiency Sword 3, Proficiency Axe 2 ]
                            , studyIdList = [ 6, 28 ]
                            , gender = Just Male
                            , magicUsage = Nothing
                            , note = Nothing
                            , customExperience = Nothing
                            }
                )
            , test "Expect job is Gremory"
                (\_ ->
                    gremory
                        |> Maybe.withDefault wrongJob
                        |> Expect.equal
                            { id = 36
                            , name = "Gremory"
                            , jobCategoryId = 4
                            , proficiencyList = [ Proficiency Reason 3, Proficiency Faith 3 ]
                            , studyIdList = [ 68, 80 ]
                            , gender = Just Female
                            , magicUsage = Just CanUseMagic
                            , note = Nothing
                            , customExperience = Nothing
                            }
                )
            , test "Expect job is Enlightened One"
                (\_ ->
                    enlightenedOne
                        |> Maybe.withDefault wrongJob
                        |> Expect.equal
                            { id = 40
                            , name = "Enlightened One"
                            , jobCategoryId = 5
                            , proficiencyList = [ Proficiency Sword 3, Proficiency Brawling 2, Proficiency Faith 3, Proficiency Authority 3 ]
                            , studyIdList = []
                            , gender = Nothing
                            , magicUsage = Just CanUseMagic
                            , note = Just "Byleth only"
                            , customExperience = Just 100
                            }
                )
            ]
        , describe "Test getJobSkillById"
            [ test "Expect jobCategory is Intermerdiate"
                (\_ ->
                    intermerdiate
                        |> Maybe.withDefault wrongJobCategory
                        |> Expect.equal
                            { id = 2
                            , category = Intermediate
                            , experience = Just 100
                            , level = Just 10
                            }
                )
            , test "Expect jobCategory is Unique"
                (\_ ->
                    unique
                        |> Maybe.withDefault wrongJobCategory
                        |> Expect.equal
                            { id = 5
                            , category = Unique
                            , experience = Nothing
                            , level = Nothing
                            }
                )
            ]
        ]
