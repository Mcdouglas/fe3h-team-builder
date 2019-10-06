module JsonDecoders exposing (..)

import Category exposing (CategoryUnionType(..))
import Gender exposing (GenderUnionType(..))
import Job exposing (..)
import JobCategory exposing (JobCategory)
import Json.Decode exposing (Decoder, andThen, field, int, list, string)
import Json.Decode.Pipeline exposing (custom, optional, optionalAt, required, requiredAt)


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


jobCategoriesDecoder : Decoder JobCategory
jobCategoriesDecoder =
    Json.Decode.succeed JobCategory
        |> required "id" int
        |> custom (field "category" string |> andThen categoryDecoder)
        |> optional "experience" int 0
        |> optional "level" int 0


genderDecoder : String -> Decoder GenderUnionType
genderDecoder gender =
    case gender of
        "Male" ->
            Json.Decode.succeed (Male gender)

        "Female" ->
            Json.Decode.succeed (Female gender)

        _ ->
            Json.Decode.succeed None


jobsDecoder : Decoder Job
jobsDecoder =
    Json.Decode.succeed Job
        |> required "id" int
        |> required "name" string
        |> required "jobCategoryId" int
        |> optional "proficiencyIdList" (list int) []
        |> optional "certificationIdList" (list int) []
        |> optional "masteryIdList" (list int) []
        |> custom (field "gender" string |> andThen genderDecoder)
        |> optional "note" string ""
