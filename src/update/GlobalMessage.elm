module GlobalMessage exposing (..)

import CustomTypes exposing (..)


type Msg
    = InitialModel
    | CModalMsg CharacterModal
    | JModalMsg JobModal
    | SModalMsg SkillModal
    | BInfoMsg BuildInfo


type CharacterModal
    = OpenCharacterModal Int
    | UpdateCurrentCharacter ( Int, Maybe Character )
    | UpdateBuildWithCharacter ( Int, Character )
    | CloseCharacterModal


type JobModal
    = OpenJobModal ( Int, Maybe Job )
    | CloseJobModal
    | UpdateJobPicker ( Int, Maybe Job )


type SkillModal
    = OpenSkillModal ( ( Int, Int ), Maybe Skill, Bool )
    | CloseSkillModal
    | UpdateSkillPicker ( ( Int, Int ), Maybe Skill, Bool )
    | UpdateBuildWithSkill ( ( Int, Int ), Skill, Bool )


type BuildInfo
    = ToggleBuildInfo Int
