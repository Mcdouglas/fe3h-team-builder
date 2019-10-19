module GlobalModel exposing (..)

import CustomTypes exposing (..)


type alias Model =
    { team : List (Maybe CharacterBuild)
    , dataModel : DataModel
    , errorMessage : Maybe String
    }


type alias DataModel =
    { studies : List Study
    , jobCategories : List JobCategory
    , jobs : List Job
    , jobSkills : List JobSkill
    , masterySkills : List MasterySkill
    , standardSkills : List StandardSkill
    }
