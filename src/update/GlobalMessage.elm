module GlobalMessage exposing (..)

import CustomTypes exposing (..)


type Msg
    = InitialModel
    | CModalMsg CharacterModal
    | SModalMsg SkillModal
    | BInfoMsg BuildInfo


type CharacterModal
    = OpenCharacterModal ( Int, Character )
    | UpdateCurrentCharacter ( Int, Maybe Character )
    | UpdateBuildWithCharacter ( Int, Character )
    | CloseCharacterSelector


type SkillModal
    = OpenSkillModal ( Int, Int, Maybe Skill )


type BuildInfo
    = ToggleBuildInfo Int
