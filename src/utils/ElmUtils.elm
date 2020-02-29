module ElmUtils exposing (appendMaybe, appendMaybeText, boolToInt)

import GlobalMessage exposing (Msg(..))


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
                Just _ ->
                    maybeText

                Nothing ->
                    Nothing


appendMaybe : Maybe String -> List String -> List String
appendMaybe maybe list =
    Maybe.map List.singleton maybe
        |> Maybe.withDefault []
        |> (++) list


boolToInt : Bool -> Int
boolToInt bool =
    if bool == True then
        1

    else
        0
