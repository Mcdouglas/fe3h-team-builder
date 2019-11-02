module GlobalModel exposing (..)

import CustomTypes exposing (..)


type alias Model =
    { team : List ( Int, CharacterBuild )
    , data : DataModel
    , view : ViewModel
    , errorMessage : Maybe String
    }


type alias ViewModel =
    { characterSelectorIsOpen : Bool
    , currentCharacter : ( Int, Maybe Character )
    }


type alias DataModel =
    { studies : List Study
    , jobCategories : List JobCategory
    , jobs : List Job
    , jobSkills : List JobSkill
    , masterySkills : List MasterySkill
    , standardSkills : List StandardSkill
    , characters : List Character
    }
