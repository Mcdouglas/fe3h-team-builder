module JobCategory exposing (..)

import Category exposing (..)
import Job exposing (..)
import Stringable exposing (..)


type alias JobCategory =
    { id : Int, category : CategoryUnionType, experience : Int, level : Int }


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
