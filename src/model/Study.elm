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
      Study 0 Sword E
    , Study 1 Sword Eplus
    , Study 2 Sword D
    , Study 3 Sword Dplus
    , Study 4 Sword C
    , Study 5 Sword Cplus
    , Study 6 Sword B
    , Study 7 Sword Bplus
    , Study 8 Sword A
    , Study 9 Sword Aplus
    , Study 10 Sword S
    , Study 11 Sword Splus

    -- Lance
    , Study 12 Lance E
    , Study 13 Lance Eplus
    , Study 14 Lance D
    , Study 15 Lance Dplus
    , Study 16 Lance C
    , Study 17 Lance Cplus
    , Study 18 Lance B
    , Study 19 Lance Bplus
    , Study 20 Lance A
    , Study 21 Lance Aplus
    , Study 22 Lance S
    , Study 23 Lance Splus

    -- Axe
    , Study 24 Axe E
    , Study 25 Axe Eplus
    , Study 26 Axe D
    , Study 27 Axe Dplus
    , Study 28 Axe C
    , Study 29 Axe Cplus
    , Study 30 Axe B
    , Study 31 Axe Bplus
    , Study 32 Axe A
    , Study 33 Axe Aplus
    , Study 34 Axe S
    , Study 35 Axe Splus

    -- Bow
    , Study 36 Bow E
    , Study 37 Bow Eplus
    , Study 38 Bow D
    , Study 39 Bow Dplus
    , Study 40 Bow C
    , Study 41 Bow Cplus
    , Study 42 Bow B
    , Study 43 Bow Bplus
    , Study 44 Bow A
    , Study 45 Bow Aplus
    , Study 46 Bow S
    , Study 47 Bow Splus

    -- Brawl
    , Study 48 Brawling E
    , Study 49 Brawling Eplus
    , Study 50 Brawling D
    , Study 51 Brawling Dplus
    , Study 52 Brawling C
    , Study 53 Brawling Cplus
    , Study 54 Brawling B
    , Study 55 Brawling Bplus
    , Study 56 Brawling A
    , Study 57 Brawling Aplus
    , Study 58 Brawling S
    , Study 59 Brawling Splus

    -- Reason
    , Study 60 Reason E
    , Study 61 Reason Eplus
    , Study 62 Reason D
    , Study 63 Reason Dplus
    , Study 64 Reason C
    , Study 65 Reason Cplus
    , Study 66 Reason B
    , Study 67 Reason Bplus
    , Study 68 Reason A
    , Study 69 Reason Aplus
    , Study 70 Reason S
    , Study 71 Reason Splus

    -- Faith
    , Study 72 Faith E
    , Study 73 Faith Eplus
    , Study 74 Faith D
    , Study 75 Faith Dplus
    , Study 76 Faith C
    , Study 77 Faith Cplus
    , Study 78 Faith B
    , Study 79 Faith Bplus
    , Study 80 Faith A
    , Study 81 Faith Aplus
    , Study 82 Faith S
    , Study 83 Faith Splus

    -- Authority
    , Study 85 Authority E
    , Study 86 Authority Eplus
    , Study 87 Authority D
    , Study 88 Authority Dplus
    , Study 89 Authority C
    , Study 90 Authority Cplus
    , Study 91 Authority B
    , Study 92 Authority Bplus
    , Study 93 Authority A
    , Study 94 Authority Aplus
    , Study 95 Authority S
    , Study 96 Authority Splus

    -- Heavy Armor
    , Study 97 HeavyArmor E
    , Study 98 HeavyArmor Eplus
    , Study 99 HeavyArmor D
    , Study 100 HeavyArmor Dplus
    , Study 101 HeavyArmor C
    , Study 102 HeavyArmor Cplus
    , Study 103 HeavyArmor B
    , Study 104 HeavyArmor Bplus
    , Study 105 HeavyArmor A
    , Study 106 HeavyArmor Aplus
    , Study 107 HeavyArmor S
    , Study 108 HeavyArmor Splus

    -- Riding
    , Study 109 Riding E
    , Study 110 Riding Eplus
    , Study 111 Riding D
    , Study 112 Riding Dplus
    , Study 113 Riding C
    , Study 114 Riding Cplus
    , Study 115 Riding B
    , Study 116 Riding Bplus
    , Study 117 Riding A
    , Study 118 Riding Aplus
    , Study 119 Riding S
    , Study 120 Riding Splus

    -- Flying
    , Study 121 Flying E
    , Study 122 Flying Eplus
    , Study 123 Flying D
    , Study 124 Flying Dplus
    , Study 125 Flying C
    , Study 126 Flying Cplus
    , Study 127 Flying B
    , Study 128 Flying Bplus
    , Study 129 Flying A
    , Study 130 Flying Aplus
    , Study 131 Flying S
    , Study 132 Flying Splus
    ]
