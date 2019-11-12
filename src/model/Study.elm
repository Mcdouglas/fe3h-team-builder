module Study exposing (..)

import CustomTypes exposing (..)


getStudyById : Int -> Maybe Study
getStudyById val =
    initStudies
        |> List.filter (\e -> e.id == val)
        |> List.head


initStudies : List Study
initStudies =
    [ -- Sword
      Study 0 0 Sword E
    , Study 1 0 Sword Eplus
    , Study 2 0 Sword D
    , Study 3 0 Sword Dplus
    , Study 4 0 Sword C
    , Study 5 0 Sword Cplus
    , Study 6 0 Sword B
    , Study 7 0 Sword Bplus
    , Study 8 0 Sword A
    , Study 9 0 Sword Aplus
    , Study 10 0 Sword S
    , Study 11 0 Sword Splus

    -- Lance
    , Study 12 1 Lance E
    , Study 13 1 Lance Eplus
    , Study 14 1 Lance D
    , Study 15 1 Lance Dplus
    , Study 16 1 Lance C
    , Study 17 1 Lance Cplus
    , Study 18 1 Lance B
    , Study 19 1 Lance Bplus
    , Study 20 1 Lance A
    , Study 21 1 Lance Aplus
    , Study 22 1 Lance S
    , Study 23 1 Lance Splus

    -- Axe
    , Study 24 2 Axe E
    , Study 25 2 Axe Eplus
    , Study 26 2 Axe D
    , Study 27 2 Axe Dplus
    , Study 28 2 Axe C
    , Study 29 2 Axe Cplus
    , Study 30 2 Axe B
    , Study 31 2 Axe Bplus
    , Study 32 2 Axe A
    , Study 33 2 Axe Aplus
    , Study 34 2 Axe S
    , Study 35 2 Axe Splus

    -- Bow
    , Study 36 3 Bow E
    , Study 37 3 Bow Eplus
    , Study 38 3 Bow D
    , Study 39 3 Bow Dplus
    , Study 40 3 Bow C
    , Study 41 3 Bow Cplus
    , Study 42 3 Bow B
    , Study 43 3 Bow Bplus
    , Study 44 3 Bow A
    , Study 45 3 Bow Aplus
    , Study 46 3 Bow S
    , Study 47 3 Bow Splus

    -- Brawl
    , Study 48 4 Brawling E
    , Study 49 4 Brawling Eplus
    , Study 50 4 Brawling D
    , Study 51 4 Brawling Dplus
    , Study 52 4 Brawling C
    , Study 53 4 Brawling Cplus
    , Study 54 4 Brawling B
    , Study 55 4 Brawling Bplus
    , Study 56 4 Brawling A
    , Study 57 4 Brawling Aplus
    , Study 58 4 Brawling S
    , Study 59 4 Brawling Splus

    -- Reason
    , Study 60 5 Reason E
    , Study 61 5 Reason Eplus
    , Study 62 5 Reason D
    , Study 63 5 Reason Dplus
    , Study 64 5 Reason C
    , Study 65 5 Reason Cplus
    , Study 66 5 Reason B
    , Study 67 5 Reason Bplus
    , Study 68 5 Reason A
    , Study 69 5 Reason Aplus
    , Study 70 5 Reason S
    , Study 71 5 Reason Splus

    -- Faith
    , Study 72 6 Faith E
    , Study 73 6 Faith Eplus
    , Study 74 6 Faith D
    , Study 75 6 Faith Dplus
    , Study 76 6 Faith C
    , Study 77 6 Faith Cplus
    , Study 78 6 Faith B
    , Study 79 6 Faith Bplus
    , Study 80 6 Faith A
    , Study 81 6 Faith Aplus
    , Study 82 6 Faith S
    , Study 83 6 Faith Splus

    -- Authority
    , Study 84 7 Authority E
    , Study 85 7 Authority Eplus
    , Study 86 7 Authority D
    , Study 87 7 Authority Dplus
    , Study 88 7 Authority C
    , Study 89 7 Authority Cplus
    , Study 90 7 Authority B
    , Study 91 7 Authority Bplus
    , Study 92 7 Authority A
    , Study 93 7 Authority Aplus
    , Study 94 7 Authority S
    , Study 95 7 Authority Splus

    -- Heavy Armor
    , Study 96 8 HeavyArmor E
    , Study 97 8 HeavyArmor Eplus
    , Study 98 8 HeavyArmor D
    , Study 99 8 HeavyArmor Dplus
    , Study 100 8 HeavyArmor C
    , Study 101 8 HeavyArmor Cplus
    , Study 102 8 HeavyArmor B
    , Study 103 8 HeavyArmor Bplus
    , Study 104 8 HeavyArmor A
    , Study 105 8 HeavyArmor Aplus
    , Study 106 8 HeavyArmor S
    , Study 107 8 HeavyArmor Splus

    -- Riding
    , Study 108 9 Riding E
    , Study 109 9 Riding Eplus
    , Study 110 9 Riding D
    , Study 111 9 Riding Dplus
    , Study 112 9 Riding C
    , Study 113 9 Riding Cplus
    , Study 114 9 Riding B
    , Study 115 9 Riding Bplus
    , Study 116 9 Riding A
    , Study 117 9 Riding Aplus
    , Study 118 9 Riding S
    , Study 119 9 Riding Splus

    -- Flying
    , Study 120 10 Flying E
    , Study 121 10 Flying Eplus
    , Study 122 10 Flying D
    , Study 123 10 Flying Dplus
    , Study 124 10 Flying C
    , Study 125 10 Flying Cplus
    , Study 126 10 Flying B
    , Study 127 10 Flying Bplus
    , Study 128 10 Flying A
    , Study 129 10 Flying Aplus
    , Study 130 10 Flying S
    , Study 131 10 Flying Splus
    ]
