module Character exposing (..)

import CustomTypes exposing (..)


getCharacterById : Int -> Maybe Character
getCharacterById val =
    initCharacters
        |> List.filter (\e -> e.id == val)
        |> List.head


initCharacters : List Character
initCharacters =
    [ Character 0 "Byleth ♂" Male 1
    , Character 1 "Byleth ♀" Female 1

    -- Black Eagles
    , Character 2 "Edelgard" Female 3
    , Character 3 "Hubert" Male 8
    , Character 4 "Ferdinant" Male 10
    , Character 5 "Linhardt" Male 13
    , Character 6 "Caspar" Male 12
    , Character 7 "Bernadetta" Female 11
    , Character 8 "Dorothea" Female 9
    , Character 9 "Petra" Female 14

    -- Blue Lions
    , Character 10 "Dimitri" Male 5
    , Character 11 "Dedue" Male 16
    , Character 12 "Felix" Male 17
    , Character 13 "Ashe" Male 18
    , Character 14 "Sylvain" Male 20
    , Character 15 "Mercedes" Female 15
    , Character 16 "Annette" Female 19
    , Character 17 "Ingrid" Female 21

    -- Golden Deer
    , Character 18 "Claude" Male 7
    , Character 19 "Lorenz" Male 22
    , Character 20 "Raphael" Male 24
    , Character 21 "Ignatz" Male 26
    , Character 22 "Lysithea" Female 25
    , Character 23 "Marianne" Female 27
    , Character 24 "Hilda" Female 23
    , Character 25 "Leonie" Female 28

    -- Churche of Seiros
    , Character 26 "Seteth" Male 32
    , Character 27 "Flayn" Female 33
    , Character 28 "Manuela" Female 29
    , Character 29 "Hanneman" Male 30
    , Character 30 "Catherine" Female 31
    , Character 31 "Gilbert" Male 35
    , Character 32 "Alois" Male 32
    , Character 33 "Shamir" Female 36
    , Character 34 "Cyril" Male 37
    ]
