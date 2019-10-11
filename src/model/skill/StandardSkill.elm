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
      StandardSkill 0 "Sword Prowess Lv.1" 1 False
    , StandardSkill 1 "Wrath Strike" 2 True
    , StandardSkill 2 "Sword Prowess Lv.2" 3 False
    , StandardSkill 3 "Grounder" 4 True
    , StandardSkill 4 "Sword Prowess Lv.3" 5 False
    , StandardSkill 5 "Haze Slice" 5 True
    , StandardSkill 6 "Hexblade" 5 True
    , StandardSkill 7 "Sunder" 5 True
    , StandardSkill 8 "Soulblade" 5 True
    , StandardSkill 9 "Axebreaker" 6 False
    , StandardSkill 10 "Sword Prowess Lv.4" 7 False
    , StandardSkill 11 "Hexblade" 8 True
    , StandardSkill 12 "Windsweep" 8 True
    , StandardSkill 13 "Finess Blade" 8 True
    , StandardSkill 14 "Sword Prowess Lv.5" 9 False
    , StandardSkill 15 "Sword Critical +10" 10 False
    , StandardSkill 16 "Swordfaire" 11 False

    -- Lance
    , StandardSkill 17 "Lance Prowess Lv.1" 13 False
    , StandardSkill 18 "Tempest Lance" 14 True
    , StandardSkill 19 "Lance Prowess Lv.2" 15 False
    , StandardSkill 20 "Knightkneeler" 16 True
    , StandardSkill 21 "Lance Prowess Lv.3" 17 False
    , StandardSkill 22 "Shatter Slash" 17 True
    , StandardSkill 23 "Vengeance" 17 True
    , StandardSkill 24 "Monster Piercer" 17 True
    , StandardSkill 25 "Hit and Run" 17 True
    , StandardSkill 26 "Frozen Lance" 17 True
    , StandardSkill 27 "Swordbreaker" 18 False
    , StandardSkill 28 "Lance Prowess Lv.4" 19 False
    , StandardSkill 29 "Frozen Lance" 20 True
    , StandardSkill 30 "Swift Strikes" 20 True
    , StandardSkill 31 "Glowing Ember" 20 True
    , StandardSkill 32 "Lance Jab" 20 True
    , StandardSkill 33 "Lance Prowess Lv.5" 21 False
    , StandardSkill 34 "Lance Critical +10" 22 False
    , StandardSkill 35 "Lancefaire" 23 False

    -- Axe
    , StandardSkill 36 "Axe Prowess Lv.1" 25 False
    , StandardSkill 37 "Smash" 26 True
    , StandardSkill 38 "Axe Prowess Lv.2" 27 False
    , StandardSkill 39 "Helm Splitter" 28 True
    , StandardSkill 40 "Axe Prowess Lv.3" 29 False
    , StandardSkill 41 "Monster Breaker" 29 True
    , StandardSkill 42 "Focused Strike" 29 True
    , StandardSkill 43 "Wild Abandon" 29 True
    , StandardSkill 44 "Lightning Axe" 29 True
    , StandardSkill 45 "Spike" 29 True
    , StandardSkill 46 "Lancebreaker" 30 False
    , StandardSkill 47 "Axe Prowess Lv.4" 31 False
    , StandardSkill 48 "Lightning Axe" 32 True
    , StandardSkill 49 "Diamond Axe" 32 True
    , StandardSkill 50 "Armored Strike" 32 True
    , StandardSkill 51 "Exhaustive Strike" 32 True
    , StandardSkill 52 "Axe Prowess Lv.5" 33 False
    , StandardSkill 53 "Axe Critical +10" 34 False
    , StandardSkill 54 "Axefaire" 35 False

    -- Bow
    , StandardSkill 55 "Bow Prowess Lv.1" 37 False
    , StandardSkill 56 "Curved Shot" 38 True
    , StandardSkill 57 "Bow Prowess Lv.2" 39 False
    , StandardSkill 58 "Close Counter" 40 False
    , StandardSkill 59 "Heavy Draw" 40 True
    , StandardSkill 60 "Deadeye" 40 True
    , StandardSkill 61 "Waning Shot" 40 True
    , StandardSkill 62 "Monster Blast" 40 True
    , StandardSkill 63 "Break Shot" 40 True
    , StandardSkill 64 "Schisms Shot" 40 True
    , StandardSkill 65 "Point-Blank Volley" 40 True
    , StandardSkill 66 "Bow Prowess Lv.3" 41 False
    , StandardSkill 67 "Bow Prowess Lv.4" 43 False
    , StandardSkill 68 "Waning Shot" 44 True
    , StandardSkill 69 "Schisms Shot" 44 True
    , StandardSkill 70 "Point-Blank Volley" 44 True
    , StandardSkill 71 "Encloser" 44 True
    , StandardSkill 72 "Ward Arrow" 44 True
    , StandardSkill 73 "Bow Prowess Lv.5" 45 False
    , StandardSkill 74 "Bow Critical +10" 46 False
    , StandardSkill 75 "Bowfaire" 47 False

    -- Brawling
    , StandardSkill 78 "Brawling Prowess Lv.1" 49 False
    , StandardSkill 79 "Fading Blow" 50 True
    , StandardSkill 80 "Brawling Prowess Lv.2" 51 False
    , StandardSkill 81 "Rushing Blow" 52 True
    , StandardSkill 82 "Brawling Prowess Lv.3" 53 False
    , StandardSkill 83 "Draining Blow" 53 True
    , StandardSkill 84 "Bombard" 53 True
    , StandardSkill 85 "One-Two Punch" 53 True
    , StandardSkill 86 "Nimble Combo" 53 True
    , StandardSkill 87 "Monster Crusher" 53 True
    , StandardSkill 88 "Brawling Prowess Lv.4" 55 False
    , StandardSkill 89 "Draining Blow" 56 True
    , StandardSkill 90 "Bombard" 56 True
    , StandardSkill 91 "Mystic Blow" 56 True
    , StandardSkill 92 "Mystic Blow" 56 True
    , StandardSkill 93 "Brawling Prowess Lv.5" 57 False
    , StandardSkill 94 "Brawl Critical +10" 58 False
    , StandardSkill 95 "Fistfaire" 59 False

    -- Reason
    , StandardSkill 96 "Reason Prowess Lv.1" 61 False
    , StandardSkill 97 "Reason Prowess Lv.2" 63 False
    , StandardSkill 98 "Reason Prowess Lv.3" 65 False
    , StandardSkill 99 "Reason Prowess Lv.4" 67 False
    , StandardSkill 100 "Reason Prowess Lv.5" 69 False
    , StandardSkill 101 "Black Magic Range +1" 70 False
    , StandardSkill 102 "Black Magic Range +1" 70 False
    , StandardSkill 103 "Black Tomefaire" 71 False
    , StandardSkill 104 "Dark Tomefaire" 71 False

    -- Faith
    , StandardSkill 105 "Faith Prowess Lv.1" 73 False
    , StandardSkill 106 "Faith Prowess Lv.2" 75 False
    , StandardSkill 107 "Faith Prowess Lv.3" 77 False
    , StandardSkill 108 "Faith Prowess Lv.4" 79 False
    , StandardSkill 109 "Faith Prowess Lv.5" 81 False
    , StandardSkill 110 "Black Magic Range +1" 82 False
    , StandardSkill 111 "Dark Tomefaire" 83 False

    -- Authority
    , StandardSkill 112 "Authority Prowess Lv.1" 85 False
    , StandardSkill 113 "Rally Magic" 86 False
    , StandardSkill 114 "Rally Charm" 86 False
    , StandardSkill 115 "Rally Dexterity" 86 False
    , StandardSkill 116 "Rally Resistance" 86 False
    , StandardSkill 117 "Rally Strength" 86 False
    , StandardSkill 118 "Rally Speed" 86 False
    , StandardSkill 119 "Rally Defense" 86 False
    , StandardSkill 120 "Rally Luck" 86 False
    , StandardSkill 121 "Authority Prowess Lv.2" 87 False
    , StandardSkill 122 "Battalion Vantage" 88 False
    , StandardSkill 123 "Battalion Wrath" 88 False
    , StandardSkill 124 "Battalion Desperation" 88 False
    , StandardSkill 125 "Battalion Renewal" 88 False
    , StandardSkill 126 "Authority Prowess Lv.3" 89 False
    , StandardSkill 127 "Rally Dexterity" 89 False
    , StandardSkill 128 "Rally Resistance" 89 False
    , StandardSkill 129 "Rally Speed" 89 False
    , StandardSkill 130 "Model Leader" 89 False
    , StandardSkill 131 "Defense Tactics" 90 False
    , StandardSkill 132 "Authority Prowess Lv.4" 91 False
    , StandardSkill 133 "Authority Prowess Lv.5" 93 False
    , StandardSkill 134 "Rally Movement" 94 False
    , StandardSkill 135 "Offensive Tactics" 95 False

    -- Heavy Armor
    , StandardSkill 136 "Weight -3" 100 False
    , StandardSkill 137 "Weight -5" 105 False
    , StandardSkill 138 "Armored Effect Null" 107 False

    -- Riding
    , StandardSkill 140 "Dexterity +4" 112 False
    , StandardSkill 141 "Movement +1" 117 False
    , StandardSkill 142 "Cavalry Effect Null" 119 False

    -- Flying
    , StandardSkill 143 "Alert Stance+" 126 False
    , StandardSkill 144 "Alert Stance+" 129 False
    , StandardSkill 145 "Flying Effect Null" 131 False
    ]
