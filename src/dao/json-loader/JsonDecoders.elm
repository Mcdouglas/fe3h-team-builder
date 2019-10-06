module JsonDecoders exposing (..)

import Category exposing (CategoryUnionType(..))
import CustomTypes exposing (Class, ClassCategory)
import Json.Decode exposing (Decoder, andThen, field, int, list, string)
import Json.Decode.Pipeline exposing (custom, optional, optionalAt, required, requiredAt)


defaultDecoder : Decoder (List String)
defaultDecoder =
    list string


categoryDecoder : String -> Decoder CategoryUnionType
categoryDecoder category =
    case category of
        "Starting" ->
            Json.Decode.succeed (Starting category)

        "Beginner" ->
            Json.Decode.succeed (Beginner category)

        "Intermediate" ->
            Json.Decode.succeed (Intermediate category)

        "Advanced" ->
            Json.Decode.succeed (Advanced category)

        "Master" ->
            Json.Decode.succeed (Master category)

        "Unique" ->
            Json.Decode.succeed (Unique category)

        _ ->
            Json.Decode.succeed (Starting category)


classCategoriesDecoder : Decoder ClassCategory
classCategoriesDecoder =
    Json.Decode.succeed ClassCategory
        |> required "id" int
        |> custom (field "category" string |> andThen categoryDecoder)
        |> optional "experience" int 0
        |> optional "level" int 0


classesDecoder : Decoder Class
classesDecoder =
    Json.Decode.succeed Class
        |> required "id" int
        |> required "name" string
        |> required "classCategoryId" int
        |> optional "proficiencyIdList" (list int) []
        |> optional "certificationIdList" (list int) []
        |> optional "masteryIdList" (list int) []
        |> optional "gender" string ""
        |> optional "note" string ""
