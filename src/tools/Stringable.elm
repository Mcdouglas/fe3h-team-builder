module Stringable exposing (..)

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
