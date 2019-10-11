module StandardSkill exposing (..)

import CustomTypes exposing (..)


getStandardSkill : Int -> Maybe StandardSkill
getStandardSkill val =
    initStandardSkills
        |> List.filter (\e -> e.id == val)
        |> List.head


initStandardSkills : List StandardSkill
initStandardSkills =
    [ -- Sword
      StandardSkill 0 "Sword Prowess Lv.1" 1
    , StandardSkill 1 "Sword Prowess Lv.2" 3
    , StandardSkill 2 "Sword Prowess Lv.3" 5
    , StandardSkill 3 "Axebreaker" 6
    , StandardSkill 4 "Sword Prowess Lv.4" 7
    , StandardSkill 5 "Sword Prowess Lv.5" 9
    , StandardSkill 6 "Sword Critical +10" 10
    , StandardSkill 7 "Swordfaire" 11

    -- Lance
    , StandardSkill 8 "Lance Prowess Lv.1" 13
    , StandardSkill 9 "Lance Prowess Lv.2" 15
    , StandardSkill 10 "Lance Prowess Lv.3" 17
    , StandardSkill 11 "Swordbreaker" 18
    , StandardSkill 12 "Lance Prowess Lv.4" 19
    , StandardSkill 13 "Lance Prowess Lv.5" 21
    , StandardSkill 14 "Lance Critical +10" 22
    , StandardSkill 15 "Lancefaire" 23

    -- Axe
    , StandardSkill 16 "Axe Prowess Lv.1" 25
    , StandardSkill 17 "Axe Prowess Lv.2" 27
    , StandardSkill 18 "Axe Prowess Lv.3" 29
    , StandardSkill 19 "Lancebreaker" 30
    , StandardSkill 20 "Axe Prowess Lv.4" 31
    , StandardSkill 21 "Axe Prowess Lv.5" 33
    , StandardSkill 22 "Axe Critical +10" 34
    , StandardSkill 23 "Axefaire" 35

    -- Bow
    , StandardSkill 24 "Bow Prowess Lv.1" 37
    , StandardSkill 25 "Bow Prowess Lv.2" 39
    , StandardSkill 26 "Close Counter" 40
    , StandardSkill 27 "Bow Prowess Lv.3" 41
    , StandardSkill 28 "Bow Prowess Lv.4" 43
    , StandardSkill 29 "Bow Prowess Lv.5" 45
    , StandardSkill 30 "Bow Critical +10" 46
    , StandardSkill 31 "Bowfaire" 47

    -- Brawling
    , StandardSkill 32 "Brawling Prowess Lv.1" 49
    , StandardSkill 33 "Brawling Prowess Lv.2" 51
    , StandardSkill 34 "Brawling Prowess Lv.3" 53
    , StandardSkill 35 "Brawling Prowess Lv.4" 55
    , StandardSkill 36 "Brawling Prowess Lv.5" 57
    , StandardSkill 37 "Brawl Critical +10" 58
    , StandardSkill 38 "Fistfaire" 59

    -- Reason
    , StandardSkill 32 "Reason Prowess Lv.1" 61
    , StandardSkill 33 "Reason Prowess Lv.2" 63
    , StandardSkill 34 "Reason Prowess Lv.3" 65
    , StandardSkill 35 "Reason Prowess Lv.4" 67
    , StandardSkill 36 "Reason Prowess Lv.5" 69
    , StandardSkill 37 "Black Magic Range +1" 70
    , StandardSkill 38 "Black Magic Range +1" 70
    , StandardSkill 39 "Black Tomefaire" 71
    , StandardSkill 40 "Dark Tomefaire" 71

    -- Faith
    , StandardSkill 41 "Faith Prowess Lv.1" 73
    , StandardSkill 42 "Faith Prowess Lv.2" 75
    , StandardSkill 43 "Faith Prowess Lv.3" 77
    , StandardSkill 44 "Faith Prowess Lv.4" 79
    , StandardSkill 45 "Faith Prowess Lv.5" 81
    , StandardSkill 46 "Black Magic Range +1" 82
    , StandardSkill 47 "Dark Tomefaire" 83

    -- Authority
    , StandardSkill 48 "Authority Prowess Lv.1" 86
    , StandardSkill 49 "Rally Magic" 87
    , StandardSkill 50 "Rally Charm" 87
    , StandardSkill 51 "Rally Dexterity" 87
    , StandardSkill 52 "Rally Resistance" 87
    , StandardSkill 53 "Rally Strength" 87
    , StandardSkill 54 "Rally Speed" 87
    , StandardSkill 55 "Rally Defense" 87
    , StandardSkill 56 "Rally Luck" 87
    , StandardSkill 57 "Authority Prowess Lv.2" 88
    , StandardSkill 58 "Battalion Vantage" 89
    , StandardSkill 59 "Battalion Wrath" 89
    , StandardSkill 60 "Battalion Desperation" 89
    , StandardSkill 61 "Battalion Renewal" 89
    , StandardSkill 62 "Authority Prowess Lv.3" 90
    , StandardSkill 63 "Rally Dexterity" 90
    , StandardSkill 64 "Rally Resistance" 90
    , StandardSkill 65 "Rally Speed" 90
    , StandardSkill 66 "Model Leader" 90
    , StandardSkill 67 "Defense Tactics" 91
    , StandardSkill 68 "Authority Prowess Lv.4" 92
    , StandardSkill 69 "Authority Prowess Lv.5" 94
    , StandardSkill 70 "Rally Movement" 95
    , StandardSkill 71 "Offensive Tactics" 96

    -- Heavy Armor
    , StandardSkill 72 "Weight -3" 101
    , StandardSkill 73 "Weight -5" 106
    , StandardSkill 74 "Armored Effect Null" 108

    -- Riding
    , StandardSkill 75 "Dexterity +4" 113
    , StandardSkill 76 "Movement +1" 118
    , StandardSkill 77 "Cavalry Effect Null" 120

    -- Flying
    , StandardSkill 78 "Alert Stance+" 127
    , StandardSkill 79 "Alert Stance+" 130
    , StandardSkill 80 "Flying Effect Null" 132
    ]
