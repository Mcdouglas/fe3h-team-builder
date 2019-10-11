module Stringable exposing (..)

import CustomTypes exposing (..)
import DataBuilder exposing (..)
import Html exposing (br, div, text)
import Job exposing (..)
import JobCategory exposing (..)
import JobSkill exposing (..)
import Maybe.Extra exposing (..)
import Study exposing (..)


type alias Stringable a =
    { stringable : a -> String }



-- Basics.toString going to Debug.toString in Elm 0.19 right?


toString : Stringable a -> a -> String
toString { stringable } x =
    stringable x



-- Primitive Types (The basic types built-into Elm: Int, Char, Float, ...):


int : Stringable Int
int =
    {- Obviously this will be changed with Int.toString in 0.19 -}
    { stringable = \x -> String.fromInt x }


char : Stringable Char
char =
    {- Obviously this will be changed with Char.toString in 0.19 -}
    { stringable = \x -> String.fromChar x }


float : Stringable Float
float =
    {- Obviously this will be changed with Float.toString in 0.19 -}
    { stringable = \x -> String.fromFloat x }



-- Composite Types: (List, Array, ... but also custom made like Tree)


list : Stringable a -> Stringable (List a)
list nestedStringable =
    { stringable =
        \xs ->
            let
                str =
                    xs
                        |> List.map (toString nestedStringable)
                        |> List.reverse
                        |> List.foldl (\a b -> a ++ ", " ++ b) ""
                        |> String.dropRight 2
            in
            "[ " ++ str ++ " ]"
    }



-- Custom types built with primitive (core Elm) types


type alias FooBar =
    { foo : Int
    , bar : Char
    }


type BazQux
    = BazQux Int


foobar : Stringable FooBar
foobar =
    { stringable =
        \{ foo, bar } ->
            "FooBar { "
                ++ "foo: "
                ++ toString int foo
                ++ ", bar: "
                ++ toString char bar
                ++ " }"
    }


bazqux : Stringable BazQux
bazqux =
    { stringable = \(BazQux x) -> "BazQux " ++ toString int x }


genderToString : GenderUnionType -> String
genderToString gender =
    case gender of
        Male ->
            "Male"

        Female ->
            "Female"


magicUsageToString : MagicUsage -> String
magicUsageToString magicUsage =
    case magicUsage of
        CanUseMagic ->
            "Can use magic"

        CanUseSomeMagic ->
            "Can use some magic"


categoryToString : CategoryUnionType -> String
categoryToString category =
    case category of
        Starting ->
            "Starting"

        Beginner ->
            "Beginner"

        Intermediate ->
            "Intermediate"

        Advanced ->
            "Advanced"

        Master ->
            "Master"

        Unique ->
            "Unique"


rankToString : Rank -> String
rankToString rank =
    case rank of
        E ->
            "E"

        Eplus ->
            "E+"

        D ->
            "D"

        Dplus ->
            "D+"

        C ->
            "C"

        Cplus ->
            "C+"

        B ->
            "B"

        Bplus ->
            "B+"

        A ->
            "A"

        Aplus ->
            "A+"

        S ->
            "S"

        Splus ->
            "S+"


subjectToString : Subject -> String
subjectToString subject =
    case subject of
        Sword ->
            "Sword"

        Lance ->
            "Lance"

        Axe ->
            "Axe"

        Bow ->
            "Bow"

        Brawling ->
            "Brawling"

        Reason ->
            "Reason"

        Faith ->
            "Faith"

        Authority ->
            "Authority"

        HeavyArmor ->
            "HeavyArmor"

        Riding ->
            "Riding"

        Flying ->
            "Flying"


jobToStringable : Stringable Job
jobToStringable =
    { stringable =
        \{ id, name, jobCategoryId, proficiencyList, studyIdList, gender, magicUsage, note, customExperience, customLevel } ->
            "Job { "
                ++ "id: "
                ++ toString int id
                ++ ", name: "
                ++ name
                ++ ", jobCategoryId: "
                ++ toString int jobCategoryId
                ++ ", proficiencyList: ["
                ++ (proficiencyList
                        |> List.map (\e -> "{ subject: " ++ subjectToString e.subject ++ ", bonus: " ++ toString int e.bonus ++ " }")
                        |> List.foldl (\a b -> a ++ ", " ++ b) ""
                   )
                ++ "]"
                ++ ", studyIdList: ["
                ++ (studyIdList
                        |> List.map (\e -> getStudyById e)
                        |> Maybe.Extra.values
                        |> List.map (\e -> "{ subject: " ++ subjectToString e.subject ++ ", rank: " ++ rankToString e.rank ++ " }")
                        |> List.foldl (\a b -> a ++ ", " ++ b) ""
                   )
                ++ "]"
                ++ (gender |> Maybe.map (\a -> genderToString a) |> Maybe.map (\a -> ", gender: " ++ a) |> Maybe.withDefault "")
                ++ (magicUsage |> Maybe.map (\a -> magicUsageToString a) |> Maybe.map (\a -> ", magicUsage: " ++ a) |> Maybe.withDefault "")
                ++ (note |> Maybe.map (\a -> ", note: " ++ a) |> Maybe.withDefault "")
                ++ (customExperience |> Maybe.map (\a -> toString int a) |> Maybe.map (\a -> ", customExperience: " ++ a) |> Maybe.withDefault "")
                ++ (customLevel |> Maybe.map (\a -> toString int a) |> Maybe.map (\a -> ", customLevel: " ++ a) |> Maybe.withDefault "")
                ++ " }"
    }


jobCategoryToStringable : Stringable JobCategory
jobCategoryToStringable =
    { stringable =
        \{ id, category, experience, level } ->
            "JobCategory { "
                ++ "id: "
                ++ toString int id
                ++ ", category: "
                ++ categoryToString category
                ++ (experience |> Maybe.map (\a -> toString int a) |> Maybe.map (\a -> ", experience: " ++ a) |> Maybe.withDefault "")
                ++ (level |> Maybe.map (\a -> toString int a) |> Maybe.map (\a -> ", level: " ++ a) |> Maybe.withDefault "")
                ++ " }"
    }
