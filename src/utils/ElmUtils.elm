module ElmUtils exposing (..)

import GlobalMessage exposing (Msg(..))
import Html exposing (..)


appendMaybeText : Maybe String -> Maybe String -> Maybe String
appendMaybeText maybeText maybeOldText =
    case maybeOldText of
        Just oldText ->
            case maybeText of
                Just text ->
                    Just (oldText ++ " / " ++ text)

                Nothing ->
                    maybeOldText

        Nothing ->
            case maybeText of
                Just text ->
                    maybeText

                Nothing ->
                    Nothing


appendMaybe : Maybe String -> List (Html Msg) -> List (Html Msg)
appendMaybe maybe list =
    Maybe.map text maybe
        |> Maybe.map (\m -> List.singleton m)
        |> Maybe.withDefault []
        |> (++) list
