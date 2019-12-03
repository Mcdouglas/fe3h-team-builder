module GlobalModel exposing (..)

import CustomTypes exposing (..)


type alias Model =
    { team : List ( Int, Build )
    , data : DataModel
    , view : ViewModel
    , errorMessage : Maybe String
    }


type SortType
    = SortByType
    | SortByName
    | ReverseSortByType
    | ReverseSortByName


type alias ViewModel =
    { characterModalIsOpen : Bool
    , skillModalIsOpen : Bool
    , jobModalIsOpen : Bool
    , skipNextClosure : Bool
    , characterPicker : ( Int, Maybe Character )
    , skillPicker : ( ( Int, Int ), Maybe Skill, Bool )
    , jobPicker : ( Int, Maybe Job )
    , isCreatingBuild : Bool
    , skillListSortBy : SortType
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
