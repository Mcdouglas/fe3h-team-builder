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
    | UpdateCharacterPicker ( Int, Maybe Character )
    | UpdateBuildWithCharacter ( Int, Character )
    | CloseCharacterModal


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


type BuildPanel
    = DeleteBuild Int
    | UpBuild Int
    | DownBuild Int
