module GlobalModel exposing (..)

import CustomTypes exposing (..)


type alias Model =
    { studies : List Study
    , jobCategories : List JobCategory
    , jobs : List Job
    , jobSkills : List JobSkill
    , masterySkills : List MasterySkill
    , standardSkills : List StandardSkill
    , errorMessage : Maybe String
    }
