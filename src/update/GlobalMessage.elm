module GlobalMessage exposing (..)

import CustomTypes exposing (..)


type Msg
    = InitialModel
    | ShowBuildInfo Int
    | OpenCharacterSelector ( Int, Character )
    | UpdateCharacterSelector ( Int, Maybe Character )
    | UpdateBuild ( Int, Character )
    | CloseCharacterSelector
    | OpenPassiveSkillSelector ( Int, Build )
