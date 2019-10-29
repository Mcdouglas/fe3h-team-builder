module GlobalMessage exposing (..)

import CustomTypes exposing (..)


type Msg
    = InitialModel
    | ShowBuildInfo Int
    | OpenCharacterModal ( Int, Character )
    | ShowCharacterModal ( Int, Maybe Character )
    | CloseCharacterModal
