module ModelHandlerTest exposing (..)

import CustomTypes exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import GlobalModel exposing (..)
import Job exposing (..)
import JobCategory exposing (..)
import JobSkill exposing (..)
import ModelHandler exposing (..)
import Test exposing (..)


modelHandlerTest =
    let
        -- default value
        wrongJob =
            Job -1 -1 "" 0 [] [] Nothing Nothing Nothing Nothing [] False

        wrongJobCategory =
            JobCategory -1 Beginner Nothing Nothing

        wrongJobSkill =
            JobSkill -1 -1 "" [] False "" Nothing Nothing Nothing Nothing Nothing Nothing

        -- jobs
        commoner =
            getJobById 0
                |> Maybe.withDefault wrongJob

        hero =
            getJobById 19
                |> Maybe.withDefault wrongJob

        gremory =
            getJobById 36
                |> Maybe.withDefault wrongJob

        enlightenedOne =
            getJobById 40

        -- jobCategories
        unique =
            getJobCategoryById 0
                |> Maybe.withDefault wrongJobCategory

        intermerdiate =
            getJobCategoryById 2
                |> Maybe.withDefault wrongJobCategory

        -- jobSkills
        canto =
            getJobSkillById 1
                |> Maybe.withDefault wrongJobSkill

        blackMagicUsesx2 =
            getJobSkillById 25
                |> Maybe.withDefault wrongJobSkill
    in
    describe "Test the data builder"
        [ describe "Test getJobById"
            [ test "Expect job is Commoner"
                (\_ ->
                    commoner
                        |> Expect.equal
                            { id = 0
                            , idPicture = 0
                            , name = "Commoner"
                            , jobCategoryId = 0
                            , proficiencyList = []
                            , studyIdList = []
                            , gender = Nothing
                            , magicUsage = Just CanUseSomeMagic
                            , note = Nothing
                            , customExperience = Just 20
                            , onlyCharacters = []
                            , canFly = False
                            }
                )
            , test "Expect job is Hero"
                (\_ ->
                    hero
                        |> Expect.equal
                            { id = 19
                            , idPicture = 19
                            , name = "Hero"
                            , jobCategoryId = 3
                            , proficiencyList = [ Proficiency Sword 3, Proficiency Axe 2 ]
                            , studyIdList = [ 6, 28 ]
                            , gender = Just Male
                            , magicUsage = Nothing
                            , note = Nothing
                            , customExperience = Nothing
                            , onlyCharacters = []
                            , canFly = False
                            }
                )
            , test "Expect job is Gremory"
                (\_ ->
                    gremory
                        |> Expect.equal
                            { id = 36
                            , idPicture = 37
                            , name = "Gremory"
                            , jobCategoryId = 4
                            , proficiencyList = [ Proficiency Reason 3, Proficiency Faith 3 ]
                            , studyIdList = [ 68, 80 ]
                            , gender = Just Female
                            , magicUsage = Just CanUseMagic
                            , note = Nothing
                            , customExperience = Nothing
                            , onlyCharacters = []
                            , canFly = False
                            }
                )
            , test "Expect job is Enlightened One"
                (\_ ->
                    enlightenedOne
                        |> Maybe.withDefault wrongJob
                        |> Expect.equal
                            { id = 40
                            , idPicture = 40
                            , name = "Enlightened One"
                            , jobCategoryId = 0
                            , proficiencyList = [ Proficiency Sword 3, Proficiency Brawling 2, Proficiency Faith 3, Proficiency Authority 3 ]
                            , studyIdList = []
                            , gender = Nothing
                            , magicUsage = Just CanUseMagic
                            , note = Just "Byleth only"
                            , customExperience = Just 100
                            , onlyCharacters = [ 0, 1 ]
                            , canFly = False
                            }
                )
            ]
        , describe "Test getJobSkillById"
            [ test "Expect jobCategory is Intermerdiate"
                (\_ ->
                    intermerdiate
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
                        |> Expect.equal
                            { id = 0
                            , category = Unique
                            , experience = Nothing
                            , level = Nothing
                            }
                )
            ]
        , describe "Test getJobByJobSkill"
            [ test "Expect List Job equals 12"
                (\_ ->
                    getJobsByJobSkill canto
                        |> List.length
                        |> Expect.equal 12
                )
            , test "Expect contains explicit list of job"
                (\_ ->
                    getJobsByJobSkill blackMagicUsesx2
                        |> List.member gremory
                        |> Expect.equal True
                )
            ]
        , describe "Test getJobSkillsByJob"
            [ test "Expect List Job equals 12"
                (\_ ->
                    getJobSkillsByJob 38
                        |> List.map (\e -> e.id)
                        |> Expect.equal [ 1, 21, 24 ]
                )
            ]
        ]
