module GlobalMessage exposing (BuildPanel(..), CharacterModal(..), JobModal(..), Msg(..), SkillModal(..))

import Browser exposing (UrlRequest)
import CustomTypes exposing (Character, Job, Skill)
import Url exposing (Url)


type Msg
    = InitialModel
    | CModalMsg CharacterModal
    | JModalMsg JobModal
    | SModalMsg SkillModal
    | BuildMsg BuildPanel
    | ToggleBuildInfo Int
    | NoOp
    | LinkClicked UrlRequest
    | UrlChanged Url
    | RewriteUrl


type CharacterModal
    = OpenCharacterModal Int
    | CloseCharacterModal
    | UpdateCharacterPicker ( Int, Maybe Character )
    | UpdateBuildWithCharacter ( Int, Character )


type JobModal
    = OpenJobModal ( Int, Job )
    | CloseJobModal
    | UpdateJobPicker ( Int, Job )
    | UpdateBuild ( Int, Job )
    | UpdateCategory Int
    | DeleteCategory


type SkillModal
    = OpenSkillModal ( ( Int, Int ), Maybe Skill, Bool )
    | CloseSkillModal
    | UpdateSkillPicker ( ( Int, Int ), Maybe Skill, Bool )
    | UpdateBuildWithSkill ( ( Int, Int ), Skill, Bool )
    | UpdateSkillFilter String
    | CleanSearchSkillFilter
    | ChangeSortType String


type BuildPanel
    = DeleteBuild Int
    | UpBuild Int
    | DownBuild Int
    | AddBuild
