module GlobalMessage exposing (..)

import CustomTypes exposing (..)


type Msg
    = InitialModel
    | ShowBuildInfo Int
    | OpenCharacterModal ( Int, Character )
    | UpdateCharacterModal ( Int, Maybe Character )
    | UpdateBuild ( Int, Character )
    | CloseCharacterModal
