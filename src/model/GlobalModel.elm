module GlobalModel exposing (..)

import CustomTypes exposing (..)


type alias Model =
    { builderModel : BuilderModel
    , dataModel : DataModel
    , errorMessage : Maybe String
    }


type alias BuilderModel =
    { team : List CharacterBuild }


type alias DataModel =
    { studies : List Study
    , jobCategories : List JobCategory
    , jobs : List Job
    , jobSkills : List JobSkill
    , masterySkills : List MasterySkill
    , standardSkills : List StandardSkill
    }
