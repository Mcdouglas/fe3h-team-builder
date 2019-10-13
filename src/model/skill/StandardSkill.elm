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
      StandardSkill 0 "Sword Prowess Lv.1" 1 False [] False
    , StandardSkill 1 "Wrath Strike" 2 True [] False
    , StandardSkill 2 "Sword Prowess Lv.2" 3 False [] False
    , StandardSkill 3 "Grounder" 4 True [] False
    , StandardSkill 4 "Sword Prowess Lv.3" 5 False [] False
    , StandardSkill 5 "Haze Slice" 5 True [] False
    , StandardSkill 6 "Hexblade" 5 True [] False
    , StandardSkill 7 "Sunder" 5 True [] False
    , StandardSkill 8 "Soulblade" 5 True [] False
    , StandardSkill 9 "Axebreaker" 6 False [] False
    , StandardSkill 10 "Sword Prowess Lv.4" 7 False [] False
    , StandardSkill 11 "Hexblade" 8 True [] False
    , StandardSkill 12 "Windsweep" 8 True [] False
    , StandardSkill 13 "Finess Blade" 8 True [] False
    , StandardSkill 14 "Sword Prowess Lv.5" 9 False [] False
    , StandardSkill 15 "Sword Critical +10" 10 False [] False
    , StandardSkill 16 "Swordfaire" 11 False [] False

    -- Lance
    , StandardSkill 17 "Lance Prowess Lv.1" 13 False [] False
    , StandardSkill 18 "Tempest Lance" 14 True [] False
    , StandardSkill 19 "Lance Prowess Lv.2" 15 False [] False
    , StandardSkill 20 "Knightkneeler" 16 True [] False
    , StandardSkill 21 "Lance Prowess Lv.3" 17 False [] False
    , StandardSkill 22 "Shatter Slash" 17 True [] False
    , StandardSkill 23 "Vengeance" 17 True [] False
    , StandardSkill 24 "Monster Piercer" 17 True [] False
    , StandardSkill 25 "Hit and Run" 17 True [] False
    , StandardSkill 26 "Frozen Lance" 17 True [] False
    , StandardSkill 27 "Swordbreaker" 18 False [] False
    , StandardSkill 28 "Lance Prowess Lv.4" 19 False [] False
    , StandardSkill 29 "Frozen Lance" 20 True [] False
    , StandardSkill 30 "Swift Strikes" 20 True [] False
    , StandardSkill 31 "Glowing Ember" 20 True [] False
    , StandardSkill 32 "Lance Jab" 20 True [] False
    , StandardSkill 33 "Lance Prowess Lv.5" 21 False [] False
    , StandardSkill 34 "Lance Critical +10" 22 False [] False
    , StandardSkill 35 "Lancefaire" 23 False [] False

    -- Axe
    , StandardSkill 36 "Axe Prowess Lv.1" 25 False [] False
    , StandardSkill 37 "Smash" 26 True [] False
    , StandardSkill 38 "Axe Prowess Lv.2" 27 False [] False
    , StandardSkill 39 "Helm Splitter" 28 True [] False
    , StandardSkill 40 "Axe Prowess Lv.3" 29 False [] False
    , StandardSkill 41 "Monster Breaker" 29 True [] False
    , StandardSkill 42 "Focused Strike" 29 True [] False
    , StandardSkill 43 "Wild Abandon" 29 True [] False
    , StandardSkill 44 "Lightning Axe" 29 True [] False
    , StandardSkill 45 "Spike" 29 True [] False
    , StandardSkill 46 "Lancebreaker" 30 False [] False
    , StandardSkill 47 "Axe Prowess Lv.4" 31 False [] False
    , StandardSkill 48 "Lightning Axe" 32 True [] False
    , StandardSkill 49 "Diamond Axe" 32 True [] False
    , StandardSkill 50 "Armored Strike" 32 True [] False
    , StandardSkill 51 "Exhaustive Strike" 32 True [] False
    , StandardSkill 52 "Axe Prowess Lv.5" 33 False [] False
    , StandardSkill 53 "Axe Critical +10" 34 False [] False
    , StandardSkill 54 "Axefaire" 35 False [] False

    -- Bow
    , StandardSkill 55 "Bow Prowess Lv.1" 37 False [] False
    , StandardSkill 56 "Curved Shot" 38 True [] False
    , StandardSkill 57 "Bow Prowess Lv.2" 39 False [] False
    , StandardSkill 58 "Close Counter" 40 False [] False
    , StandardSkill 59 "Heavy Draw" 40 True [] False
    , StandardSkill 60 "Deadeye" 40 True [] False
    , StandardSkill 61 "Waning Shot" 40 True [] False
    , StandardSkill 62 "Monster Blast" 40 True [] False
    , StandardSkill 63 "Break Shot" 40 True [] False
    , StandardSkill 64 "Schisms Shot" 40 True [] False
    , StandardSkill 65 "Point-Blank Volley" 40 True [] False
    , StandardSkill 66 "Bow Prowess Lv.3" 41 False [] False
    , StandardSkill 67 "Bow Prowess Lv.4" 43 False [] False
    , StandardSkill 68 "Waning Shot" 44 True [] False
    , StandardSkill 69 "Schisms Shot" 44 True [] False
    , StandardSkill 70 "Point-Blank Volley" 44 True [] False
    , StandardSkill 71 "Encloser" 44 True [] False
    , StandardSkill 72 "Ward Arrow" 44 True [] False
    , StandardSkill 73 "Bow Prowess Lv.5" 45 False [] False
    , StandardSkill 74 "Bow Critical +10" 46 False [] False
    , StandardSkill 75 "Bowfaire" 47 False [] False

    -- Brawling
    , StandardSkill 76 "Brawling Prowess Lv.1" 49 False [] False
    , StandardSkill 77 "Fading Blow" 50 True [] False
    , StandardSkill 78 "Brawling Prowess Lv.2" 51 False [] False
    , StandardSkill 79 "Rushing Blow" 52 True [] False
    , StandardSkill 80 "Brawling Prowess Lv.3" 53 False [] False
    , StandardSkill 81 "Draining Blow" 53 True [] False
    , StandardSkill 82 "Bombard" 53 True [] False
    , StandardSkill 83 "One-Two Punch" 53 True [] False
    , StandardSkill 84 "Nimble Combo" 53 True [] False
    , StandardSkill 85 "Monster Crusher" 53 True [] False
    , StandardSkill 86 "Brawling Prowess Lv.4" 55 False [] False
    , StandardSkill 87 "Draining Blow" 56 True [] False
    , StandardSkill 88 "Bombard" 56 True [] False
    , StandardSkill 89 "Mystic Blow" 56 True [] False
    , StandardSkill 90 "Mystic Blow" 56 True [] False
    , StandardSkill 91 "Brawling Prowess Lv.5" 57 False [] False
    , StandardSkill 92 "Brawl Critical +10" 58 False [] False
    , StandardSkill 93 "Fistfaire" 59 False [] False

    -- Reason
    , StandardSkill 94 "Reason Prowess Lv.1" 61 False [] False
    , StandardSkill 95 "Reason Prowess Lv.2" 63 False [] False
    , StandardSkill 96 "Reason Prowess Lv.3" 65 False [] False
    , StandardSkill 97 "Reason Prowess Lv.4" 67 False [] False
    , StandardSkill 98 "Reason Prowess Lv.5" 69 False [] False
    , StandardSkill 99 "Black Magic Range +1" 70 False [ 2, 3, 22 ] True
    , StandardSkill 100 "Black Magic Range +1" 70 False [ 2, 3, 22 ] False
    , StandardSkill 101 "Black Tomefaire" 71 False [ 2, 3, 22 ] True
    , StandardSkill 102 "Dark Tomefaire" 71 False [ 2, 3, 22 ] False

    -- Faith
    , StandardSkill 103 "Faith Prowess Lv.1" 73 False [] False
    , StandardSkill 104 "Faith Prowess Lv.2" 75 False [] False
    , StandardSkill 105 "Faith Prowess Lv.3" 77 False [] False
    , StandardSkill 106 "Faith Prowess Lv.4" 79 False [] False
    , StandardSkill 107 "Faith Prowess Lv.5" 81 False [] False
    , StandardSkill 108 "Black Magic Range +1" 82 False [] False
    , StandardSkill 109 "Dark Tomefaire" 83 False [] False

    -- Authority
    , StandardSkill 110 "Authority Prowess Lv.1" 85 False [] False
    , StandardSkill 111 "Rally Magic" 86 False [ 3, 17 ] False
    , StandardSkill 112 "Rally Charm" 86 False [ 8, 28, 2, 10, 18 ] False
    , StandardSkill 113 "Rally Dexterity" 86 False [ 4, 21 ] False
    , StandardSkill 114 "Rally Resistance" 86 False [ 3, 16, 26 ] False
    , StandardSkill 115 "Rally Strength" 86 False [ 20, 21, 32 ] False
    , StandardSkill 116 "Rally Speed" 86 False [] False
    , StandardSkill 117 "Rally Defense" 86 False [] False
    , StandardSkill 118 "Rally Luck" 86 False [] False
    , StandardSkill 119 "Authority Prowess Lv.2" 87 False [] False
    , StandardSkill 120 "Battalion Vantage" 88 False [] False
    , StandardSkill 121 "Battalion Wrath" 88 False [] False
    , StandardSkill 122 "Battalion Desperation" 88 False [] False
    , StandardSkill 123 "Battalion Renewal" 88 False [] False
    , StandardSkill 124 "Authority Prowess Lv.3" 89 False [] False
    , StandardSkill 125 "Rally Dexterity" 89 False [] False
    , StandardSkill 126 "Rally Resistance" 89 False [] False
    , StandardSkill 127 "Rally Speed" 89 False [] False
    , StandardSkill 128 "Model Leader" 89 False [] False
    , StandardSkill 129 "Defense Tactics" 90 False [] False
    , StandardSkill 130 "Authority Prowess Lv.4" 91 False [] False
    , StandardSkill 131 "Authority Prowess Lv.5" 93 False [] False
    , StandardSkill 132 "Rally Movement" 94 False [] False
    , StandardSkill 133 "Offensive Tactics" 95 False [] False

    -- Heavy Armor
    , StandardSkill 134 "Weight -3" 100 False [] False
    , StandardSkill 135 "Weight -5" 105 False [] False
    , StandardSkill 136 "Armored Effect Null" 107 False [] False

    -- Riding
    , StandardSkill 137 "Dexterity +4" 112 False [] False
    , StandardSkill 138 "Movement +1" 117 False [] False
    , StandardSkill 139 "Cavalry Effect Null" 119 False [] False

    -- Flying
    , StandardSkill 140 "Alert Stance+" 126 False [] False
    , StandardSkill 141 "Alert Stance+" 129 False [] False
    , StandardSkill 142 "Flying Effect Null" 131 False [] False
    ]
