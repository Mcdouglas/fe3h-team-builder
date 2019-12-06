module GlobalModel exposing (..)

import CustomTypes exposing (..)
import Dict exposing (Dict)
import Url exposing (..)
import Browser.Navigation exposing (Key)

type alias Model =
    { team : Dict Int Build
    , data : DataModel
    , view : ViewModel
    , errorMessage : Maybe String
    , url : Url
    , key: Key
    }


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
    , skillSearch : String
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
