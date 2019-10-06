module Category exposing (CategoryUnionType(..), categoryToString)


type CategoryUnionType
    = Starting String
    | Beginner String
    | Intermediate String
    | Advanced String
    | Master String
    | Unique String


categoryToString : CategoryUnionType -> String
categoryToString category =
    case category of
        Starting value ->
            value

        Beginner value ->
            value

        Intermediate value ->
            value

        Advanced value ->
            value

        Master value ->
            value

        Unique value ->
            value
