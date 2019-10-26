module Character exposing (..)

import CustomTypes exposing (..)


getCharacterById : Int -> Maybe Character
getCharacterById val =
    initCharacters
        |> List.filter (\e -> e.id == val)
        |> List.head


initCharacters : List Character
initCharacters =
    [ Character 0 "Byleth" Male 1 Major 1
    , Character 1 "Byleth" Female 1 Major 1

    -- Black Eagles
    , Character 2 "Edelgard" Female 3 Minor 17
    , Character 3 "Hubert" Male 8 NonOwner 0
    , Character 4 "Ferdinand" Male 10 Minor 13
    , Character 5 "Linhardt" Male 13 Minor 12
    , Character 6 "Caspar" Male 12 NonOwner 0
    , Character 7 "Bernadetta" Female 11 Minor 14
    , Character 8 "Dorothea" Female 9 NonOwner 0
    , Character 9 "Petra" Female 14 NonOwner 0

    -- Blue Lions
    , Character 10 "Dimitri" Male 5 Minor 2
    , Character 11 "Dedue" Male 16 NonOwner 0
    , Character 12 "Felix" Male 17 Major 6
    , Character 13 "Ashe" Male 18 NonOwner 0
    , Character 14 "Sylvain" Male 20 Minor 7
    , Character 15 "Mercedes" Female 15 Minor 10
    , Character 16 "Annette" Female 19 Minor 5
    , Character 17 "Ingrid" Female 21 Minor 4

    -- Golden Deer
    , Character 18 "Claude" Male 7 Minor 11
    , Character 19 "Lorenz" Male 22 Minor 8
    , Character 20 "Raphael" Male 24 NonOwner 0
    , Character 21 "Ignatz" Male 26 NonOwner 0
    , Character 22 "Lysithea" Female 25 Major 8
    , Character 23 "Marianne" Female 27 Minor 16
    , Character 24 "Hilda" Female 23 Minor 9
    , Character 25 "Leonie" Female 28 NonOwner 0

    -- Churche of Seiros
    , Character 26 "Seteth" Male 32 Major 13
    , Character 27 "Flayn" Female 33 Major 12
    , Character 28 "Manuela" Female 29 NonOwner 0
    , Character 29 "Hanneman" Male 30 Minor 14
    , Character 30 "Catherine" Female 31 Major 3
    , Character 31 "Gilbert" Male 35 NonOwner 0
    , Character 32 "Alois" Male 32 NonOwner 0
    , Character 33 "Shamir" Female 36 NonOwner 0
    , Character 34 "Cyril" Male 37 NonOwner 0
    ]
