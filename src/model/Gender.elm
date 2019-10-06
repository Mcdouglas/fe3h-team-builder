module Gender exposing (..)


type GenderUnionType
    = Male String
    | Female String
    | None


genderToString : GenderUnionType -> String
genderToString gender =
    case gender of
        Male value ->
            value

        Female value ->
            value

        _ ->
            ""
