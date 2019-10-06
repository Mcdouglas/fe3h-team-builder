module Job exposing (..)

import Gender exposing (GenderUnionType(..), genderToString)
import Stringable exposing (..)


type alias Job =
    { id : Int, name : String, jobCategoryId : Int, proficiencyIdList : List Int, certificationIdList : List Int, masteryIdList : List Int, gender : GenderUnionType, note : String }


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
