module GlobalMessage exposing (..)

import CustomTypes exposing (..)


type Msg
    = InitialModel
    | CModalMsg CharacterModal
    | JModalMsg JobModal
    | SModalMsg SkillModal
    | BuildMsg BuildPanel
    | ToggleBuildInfo Int


type CharacterModal
    = OpenCharacterModal Int
    | CloseCharacterModal
    | IgnoreCloseCharacterModal
    | UpdateCharacterPicker ( Int, Maybe Character )
    | UpdateBuildWithCharacter ( Int, Character )


type JobModal
    = OpenJobModal ( Int, Maybe Job )
    | CloseJobModal
    | IgnoreCloseJobModal
    | UpdateJobPicker ( Int, Maybe Job )
    | UpdateBuild ( Int, Job )


type SkillModal
    = OpenSkillModal ( ( Int, Int ), Maybe Skill, Bool )
    | CloseSkillModal
    | IgnoreCloseSkillModal
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
