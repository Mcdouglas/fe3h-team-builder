module GlobalMessage exposing (..)

import Browser exposing (..)
import CustomTypes exposing (..)
import Url exposing (..)


type Msg
    = InitialModel
    | CModalMsg CharacterModal
    | JModalMsg JobModal
    | SModalMsg SkillModal
    | BuildMsg BuildPanel
    | ToggleBuildInfo Int
    | NoOp
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | RewriteUrl String


type CharacterModal
    = OpenCharacterModal Int
    | CloseCharacterModal
    | UpdateCharacterPicker ( Int, Maybe Character )
    | UpdateBuildWithCharacter ( Int, Character )


type JobModal
    = OpenJobModal ( Int, Maybe Job )
    | CloseJobModal
    | UpdateJobPicker ( Int, Maybe Job )
    | UpdateBuild ( Int, Job )


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
