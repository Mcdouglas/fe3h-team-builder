module Stringable exposing (..)

import CustomTypes exposing (..)
import Html exposing (br, div, text)


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

        _ ->
            "None"


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


jobToStringable : Stringable Job
jobToStringable =
    { stringable =
        \{ id, name, jobCategoryId, proficiencyIdList, certificationIdList, masteryIdList, gender, note } ->
            let
                pil =
                    proficiencyIdList |> toString (list int)

                cil =
                    certificationIdList |> toString (list int)

                mil =
                    masteryIdList |> toString (list int)
            in
            "Job { "
                ++ "id: "
                ++ toString int id
                ++ ", name: "
                ++ name
                ++ ", jobCategoryId: "
                ++ toString int jobCategoryId
                ++ ", proficiencyIdList: "
                ++ pil
                ++ ", certificationIdList: "
                ++ cil
                ++ ", masteryIdList: "
                ++ mil
                ++ ", gender: "
                ++ genderToString gender
                ++ ", note: "
                ++ note
                ++ " }"
    }


jobCategoryToStringable : Stringable JobCategory
jobCategoryToStringable =
    { stringable =
        \{ id, category, experience, level } ->
            let
                str =
                    categoryToString category
            in
            "Job { "
                ++ "id: "
                ++ toString int id
                ++ ", category: "
                ++ str
                ++ ", experience: "
                ++ toString int experience
                ++ ", level: "
                ++ toString int level
                ++ " }"
    }
