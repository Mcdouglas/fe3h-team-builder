module GlobalModel exposing (DataModel, Model, ViewModel)

import Browser.Navigation exposing (Key)
import CustomTypes exposing (Build, Character, Job, JobCategory, JobSkill, MasterySkill, Skill, SortType, StandardSkill, Study)
import Dict exposing (Dict)
import Url exposing (Url)


type alias Model =
    { team : Dict Int Build
    , data : DataModel
    , view : ViewModel
    , errorMessage : Maybe String
    , url : Url
    , key : Key
    }


type alias ViewModel =
    { characterModalIsOpen : Bool
    , skillModalIsOpen : Bool
    , jobModalIsOpen : Bool
    , skipNextClosure : Bool
    , characterPicker : ( Int, Maybe Character )
    , skillPicker : ( ( Int, Int ), Maybe Skill, Bool )
    , jobPicker : ( Int, Job )
    , isCreatingBuild : Bool
    , skillListSortBy : SortType
    , skillSearch : String
    , categorySelected : Maybe Int
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
