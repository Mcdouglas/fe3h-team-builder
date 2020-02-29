module StandardSkill exposing (getStandardSkill, initStandardSkills)

import CustomTypes exposing (StandardSkill)


getStandardSkill : Int -> Maybe StandardSkill
getStandardSkill val =
    initStandardSkills
        |> List.filter (\e -> e.id == val)
        |> List.head


initStandardSkills : List StandardSkill
initStandardSkills =
    [ -- Sword --
      StandardSkill 0 11 "Sword Prowess Lv.1" 1 False [] False "Grants Hit +5, Avoid +7 and Critical Evade +5 when equipped with Sword." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 2 12 "Sword Prowess Lv.2" 3 False [] False "Grants Hit +6, Avoid +10 and Critical Evade +6 when equipped with Sword." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 4 13 "Sword Prowess Lv.3" 5 False [] False "Grants Hit +7, Avoid +13 and Critical Evade +7 when equipped with Sword." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 10 83 "Axebreaker" 6 False [] False "Grants Hit/Avo +20 when using a sword against axe users." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 11 14 "Sword Prowess Lv.4" 7 False [] False "Grants Hit +8, Avoid +16 and Critical Evade +8 when equipped with Sword." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 15 15 "Sword Prowess Lv.5" 9 False [] False "Grants Hit +10, Avoid +20 and Critical Evade +10 when equipped with Sword." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 16 52 "Sword Critical +10" 10 False [] False "Grants Crit +10 when using a sword." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 17 73 "Swordfaire" 11 False [] False "Might +5 when a sword is equipped." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Lance --
    , StandardSkill 18 16 "Lance Prowess Lv.1" 13 False [] False "Grants Hit +6, Avoid +6 and Critical Evade +5 when equipped with Lance." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 20 17 "Lance Prowess Lv.2" 15 False [] False "Grants Hit +8, Avoid +8 and Critical Evade +6 when equipped with Lance." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 22 18 "Lance Prowess Lv.3" 17 False [] False "Grants Hit +10, Avoid +10 and Critical Evade +7 when equipped with Lance." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 28 81 "Swordbreaker" 18 False [] False "Grants Hit/Avo +20 when using a lance against sword users." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 29 19 "Lance Prowess Lv.4" 19 False [] False "Grants Hit +12, Avoid +12 and Critical Evade +8 when equipped with Lance." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 34 21 "Lance Prowess Lv.5" 21 False [] False "Grants Hit +15, Avoid +15 and Critical Evade +10 when equipped with Lance." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 35 53 "Lance Critical +10" 22 False [] False "Grants Crit +10 when using a lance." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 36 75 "Lancefaire" 23 False [] False "Might +5 when a lance is equipped." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Axe --
    , StandardSkill 37 22 "Axe Prowess Lv.1" 25 False [] False "Grants Hit +7, Avoid +5 and Critical Evade +5 when equipped with Axe." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 39 23 "Axe Prowess Lv.2" 27 False [] False "Grants Hit +10, Avoid +6 and Critical Evade +6 when equipped with Axe." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 41 24 "Axe Prowess Lv.3" 29 False [] False "Grants Hit +13, Avoid +7 and Critical Evade +7 when equipped with Axe." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 47 82 "Lancebreaker" 30 False [] False "Grants Hit/Avo +20 when using an axe against lance users." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 48 25 "Axe Prowess Lv.4" 31 False [] False "Grants Hit +16, Avoid +8 and Critical Evade +8 when equipped with Axe" Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 53 26 "Axe Prowess Lv.5" 33 False [] False "Grants Hit +20, Avoid +10 and Critical Evade +10 when equipped with Axe." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 54 54 "Axe Critical +10" 34 False [] False "Grants Crit +10 when using an axe." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 55 74 "Axefaire" 35 False [] False "Might +5 when an axe is equipped." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Bow --
    , StandardSkill 56 27 "Bow Prowess Lv.1" 37 False [] False "Grants Hit +6, Avoid +6 and Critical Evade +5 when equipped with Bow." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 58 28 "Bow Prowess Lv.2" 39 False [] False "Grants Hit +8, Avoid +8 and Critical Evade +6 when equipped with Bow." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 59 169 "Close Counter" 40 False [] False "Allows unit to counterattack adjacent foes." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 67 29 "Bow Prowess Lv.3" 41 False [] False "Grants Hit +10, Avoid +10 and Critical Evade +7 when equipped with Bow." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 68 30 "Bow Prowess Lv.4" 43 False [] False "Grants Hit +12, Avoid +12 and Critical Evade +8 when equipped with Bow." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 74 31 "Bow Prowess Lv.5" 45 False [] False "Grants Hit +15, Avoid +15 and Critical Evade +10 when equipped with Bow." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 75 55 "Bow Critical +10" 46 False [] False "Grants Crit +10 when using a bow." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 76 76 "Bowfaire" 47 False [] False "Might +5 when a bow is equipped." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Brawl --
    , StandardSkill 77 32 "Brawling Prowess Lv.1" 49 False [] False "Grants Hit +5, Avoid +7 and Critical Evade +5 when brawling." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 79 33 "Brawling Prowess Lv.2" 51 False [] False "Grants Hit +6, Avoid +10 and Critical Evade +6 when brawling." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 81 34 "Brawling Prowess Lv.3" 53 False [] False "Grants Hit +7, Avoid +13 and Critical Evade +7 when brawling." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 88 35 "Brawling Prowess Lv.4" 55 False [] False "Grants Hit +8, Avoid +16 and Critical Evade +8 when brawling." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 93 36 "Brawling Prowess Lv.5" 57 False [] False "Grants Hit +10, Avoid +20 and Critical Evade +10 when brawling." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 94 56 "Brawl Critical +10" 58 False [] False "Grants Crit +10 when brawling." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 95 77 "Fistfaire" 59 False [] False "Might +5 when a gauntlet is equipped." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Reason --
    , StandardSkill 96 37 "Reason Prowess Lv.1" 61 False [] False "Grants Hit +5, Avoid +7 and Critical Evade +5 when equipped with Reason Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 97 38 "Reason Prowess Lv.2" 63 False [] False "Grants Hit +6, Avoid +10 and Critical Evade +6 when equipped with Reason Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 98 39 "Reason Prowess Lv.3" 65 False [] False "Grants Hit +7, Avoid +13 and Critical Evade +7 when equipped with Reason Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 99 40 "Reason Prowess Lv.4" 67 False [] False "Grants Hit +8, Avoid +16 and Critical Evade +8 when equipped with Reason Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 100 41 "Reason Prowess Lv.5" 69 False [] False "Grants Hit +10, Avoid +20 and Critical Evade +10 when equipped with Reason Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 101 92 "Black Magic Range +1" 70 False [ 2, 3, 22 ] True "Increases black magic range by 1." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 102 93 "Dark Magic Range +1" 70 False [ 2, 3, 22 ] False "Increases dark magic range by 1." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 103 78 "Black Tomefaire" 71 False [ 2, 3, 22 ] True "Might +5 when Black Magic is equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 104 79 "Dark Tomefaire" 71 False [ 2, 3, 22 ] False "Might +5 when Dark Magic is equipped." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Faith --
    , StandardSkill 105 42 "Faith Prowess Lv.1" 73 False [] False "Grants Hit +5, Avoid +7 and Critical Evade +5 when equipped with Faith Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 106 43 "Faith Prowess Lv.2" 75 False [] False "Grants Hit +6, Avoid +10 and Critical Evade +6 when equipped with Faith Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 107 44 "Faith Prowess Lv.3" 77 False [] False "Grants Hit +7, Avoid +13 and Critical Evade +7 when equipped with Faith Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 108 45 "Faith Prowess Lv.4" 79 False [] False "Grants Hit +8, Avoid +16 and Critical Evade +8 when equipped with Faith Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 109 46 "Faith Prowess Lv.5" 81 False [] False "Grants Hit +10, Avoid +20 and Critical Evade +10 when equipped with Faith Magic." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 110 94 "White Magic Range +1" 82 False [] False "Increases White Magic range by 1 for attacks that damage foes." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 111 80 "White Tomefaire" 83 False [] False "Might +5 when White Magic is equipped." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Authority --
    , StandardSkill 112 47 "Authority Prowess Lv.1" 85 False [] False "Grants Mt +2 with gambits." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 113 100 "Rally Magic" 86 False [ 3, 17 ] False "Use Rally to grant Mag +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 114 101 "Rally Charm" 86 False [ 8, 28 ] False "Use Rally to grant Cha +8 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 115 102 "Rally Dexterity" 86 False [ 4 ] False "Use Rally to grant Dex +8 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 116 103 "Rally Resistance" 86 False [ 16 ] False "Use Rally to grant Res +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 117 104 "Rally Strength" 86 False [ 20, 32 ] False "Use Rally to grant Str +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 118 105 "Rally Speed" 86 False [ 21 ] False "Use Rally to grant Spd +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 119 106 "Rally Defense" 86 False [ 26, 31 ] False "Use Rally to grant Def +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 120 107 "Rally Luck" 86 False [ 27 ] False "Use Rally to grant Lck +8 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 121 48 "Authority Prowess Lv.2" 87 False [] False "Grants Mt +4 with gambits." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 122 158 "Battalion Vantage" 88 False [ 0, 1, 2, 12, 24, 19, 30 ] False "When foe initiates combat, unit still attacks first if battalion endurance is ≤ 1/3." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 123 154 "Battalion Wrath" 88 False [ 3, 6, 7, 9, 10, 11, 20, 24, 26, 31, 32 ] False "If foe initiates combat while unit’s battalion endurance is ≤ 1/3, grants Crit +50." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 124 159 "Battalion Desperation" 88 False [ 4, 8, 13, 17, 18, 21, 22, 25, 29, 33, 34 ] False "If unit initiates combat when battalion endurance is ≤ 1/3, unit’s follow-up attack (if possible) occurs before foe’s counterattack." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 125 152 "Battalion Renewal" 88 False [ 5, 15, 16, 23, 27, 28 ] False "Unit recovers up to 30% of max HP at the start of each turn while battalion endurance is ≤ 1/3." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 126 49 "Authority Prowess Lv.3" 89 False [] False "Grants Mt +6 with gambits." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 127 102 "Rally Dexterity" 89 False [ 21 ] False "Use Rally to grant Dex +8 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 128 103 "Rally Resistance" 89 False [ 3 ] False "Use Rally to grant Res +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 129 105 "Rally Speed" 89 False [ 16 ] False "Use Rally to grant Spd +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 130 183 "Model Leader" 89 False [ 0, 1, 2, 10, 18, 26 ] False "Doubles experience earned for battalions." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 131 155 "Defense Tactics" 90 False [] False "Battalion endurance takes half damage." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 132 50 "Authority Prowess Lv.4" 91 False [] False "Grants Mt +8 with gambits." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 133 158 "Battalion Vantage" 92 False [ 10, 21 ] False "When foe initiates combat, unit still attacks first if battalion endurance is ≤ 1/3." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 134 154 "Battalion Wrath" 92 False [ 16, 18 ] False "If foe initiates combat while unit’s battalion endurance is ≤ 1/3, grants Crit +50." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 135 159 "Battalion Desperation" 92 False [ 0, 1, 3, 26 ] False "If unit initiates combat when battalion endurance is ≤ 1/3, unit’s follow-up attack (if possible) occurs before foe’s counterattack." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 136 152 "Battalion Renewal" 92 False [ 2 ] False "Unit recovers up to 30% of max HP at the start of each turn while battalion endurance is ≤ 1/3." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 137 51 "Authority Prowess Lv.5" 93 False [] False "Grants Mt +10 with gambits." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 138 101 "Rally Charm" 94 False [ 2, 10, 18 ] False "Use Rally to grant Cha +8 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 139 103 "Rally Resistance" 94 False [ 26 ] False "Use Rally to grant Res +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 140 104 "Rally Strength" 94 False [ 21 ] False "Use Rally to grant Str +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 141 105 "Rally Speed" 94 False [ 3 ] False "Use Rally to grant Spd +4 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 142 108 "Rally Movement" 94 False [ 0, 1, 16 ] False "Use Rally to grant Mv +1 to an ally." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 143 156 "Offensive Tactics" 95 False [] False "Grants Mt +5 and Hit +20 with gambits." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Heavy Armor --
    , StandardSkill 144 177 "Weight -3" 100 False [] False "The combined weight of equipment is reduced by 3." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 145 190 "Smite" 102 True [] False "User pushes ally foward 2 spaces." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 146 178 "Weight -5" 105 False [] False "The combined weight of equipment is reduced by 5." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 147 173 "Armored Effect Null" 107 False [] False "Nullifies any extra effectiveness against armored units." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Riding --
    , StandardSkill 148 126 "Dexterity +4" 112 False [] False "Increases Dex by 4." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 149 129 "Movement +1" 117 False [] False "Increases Mv by 1." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 150 174 "Cavalry Effect Null" 119 False [] False "Nullifies any extra effectiveness against cavalry units." Nothing Nothing Nothing Nothing Nothing Nothing

    -- Flying --
    , StandardSkill 151 130 "Alert Stance+" 126 False [] False "If unit takes no action except Wait, grants Avo +15 for 1 turn." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 152 131 "Alert Stance+" 129 False [] False "If unit takes no action except Wait, grants Avo +30 for 1 turn." Nothing Nothing Nothing Nothing Nothing Nothing
    , StandardSkill 153 175 "Flying Effect Null" 131 False [] False "Nullifies any extra effectiveness against flying units." Nothing Nothing Nothing Nothing Nothing Nothing

    -- COMBAT ARTS --
    -- Sword --
    , StandardSkill 1 186 "Wrath Strike" 2 True [] False "" (Just 3) (Just 5) (Just 10) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 3 186 "Grounder" 4 True [] False "Effective against Flying enemies." (Just 4) (Just 3) (Just 20) Nothing (Just 5) (Just ( 1, 1 ))
    , StandardSkill 5 186 "Bane of Monsters" 5 True [ 0, 1, 9, 18, 30 ] False "Effective against Monsters." (Just 4) (Just 6) Nothing Nothing (Just 10) (Just ( 1, 1 ))
    , StandardSkill 6 186 "Haze Slice" 5 True [ 2, 21, 26 ] False "" (Just 5) (Just 2) Nothing (Just 30) Nothing (Just ( 1, 1 ))
    , StandardSkill 7 186 "Hexblade" 5 True [ 8, 28 ] False "Deals magic-based damage." (Just 3) (Just 7) (Just 10) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 8 186 "Sunder" 5 True [ 4, 10, 12 ] False "" (Just 3) (Just 4) Nothing Nothing (Just 15) (Just ( 1, 1 ))
    , StandardSkill 9 186 "Soulblade" 5 True [ 23 ] False "Deals magic-based damage, Might increases based on user's Resistance." (Just 4) (Just 2) (Just 10) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 12 186 "Hexblade" 8 True [ 2, 17 ] False "Deals magic-based damage." (Just 3) (Just 7) (Just 10) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 13 186 "Windsweep" 8 True [ 0, 1, 10 ] False "Prevents enemy counterattack." (Just 5) (Just 3) (Just 20) Nothing (Just 10) (Just ( 1, 1 ))
    , StandardSkill 14 186 "Finess Blade" 8 True [ 9, 12, 18, 30 ] False "Might increases based on user's Dexterity." (Just 4) (Just 2) Nothing (Just 10) Nothing (Just ( 1, 1 ))

    -- Lance --
    , StandardSkill 19 187 "Tempest Lance" 14 True [] False "" (Just 5) (Just 8) (Just 10) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 21 187 "Knightkneeler" 16 True [] False "Effective against Cavalry enemies." (Just 4) (Just 5) (Just 15) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 23 187 "Shatter Slash" 17 True [ 4, 24, 31 ] False "After combat, inflicts Def -5 on foe for 1 turn." (Just 3) (Just 4) (Just 10) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 24 187 "Vengeance" 17 True [ 7, 11, 34 ] False "Damage increases in relation to the user’s missing HP." (Just 4) (Just 2) Nothing Nothing (Just 10) (Just ( 1, 1 ))
    , StandardSkill 25 187 "Monster Piercer" 17 True [ 10, 14, 25, 26 ] False "Effective against Monsters." (Just 4) (Just 7) Nothing Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 26 187 "Hit and Run" 17 True [ 17, 27, 33 ] False "After combat, user moves 1 space backwards." (Just 4) (Just 4) (Just 10) (Just 20) Nothing (Just ( 1, 1 ))
    , StandardSkill 27 187 "Frozen Lance" 17 True [ 19 ] False "Deals magic-based damage. Might increases based on user’s Dexterity." (Just 4) (Just 3) (Just 5) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 30 187 "Frozen Lance" 20 True [ 17, 27 ] False "Deals magic-based damage. Might increases based on user’s Dexterity." (Just 4) (Just 3) (Just 5) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 31 187 "Swift Strikes" 20 True [ 4, 14, 26 ] False "Triggers 2 consecutive hits." (Just 4) (Just 2) Nothing Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 32 187 "Glowing Ember" 20 True [ 10, 31 ] False "Might increases based on user’s Defense." (Just 4) (Just 2) Nothing (Just 10) Nothing (Just ( 1, 1 ))
    , StandardSkill 33 187 "Lance Jab" 20 True [ 25, 33, 34 ] False "Might increases based on user’s Speed." (Just 5) (Just 3) Nothing Nothing (Just 10) (Just ( 1, 1 ))

    -- Axe --
    , StandardSkill 38 188 "Smash" 26 True [] False "" (Just 5) (Just 3) (Just 20) Nothing (Just 20) (Just ( 1, 1 ))
    , StandardSkill 40 188 "Helm Splitter" 28 True [] False "Effective against Armored enemies." (Just 5) (Just 7) Nothing Nothing (Just 5) (Just ( 1, 1 ))
    , StandardSkill 42 188 "Monster Breaker" 29 True [ 2, 11, 34 ] False "Effective against Monsters." (Just 5) (Just 9) Nothing Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 43 188 "Focused Strike" 29 True [ 4, 13, 26 ] False "" (Just 3) Nothing (Just 30) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 44 188 "Wild Abandon" 29 True [ 6, 9, 20 ] False "" (Just 5) (Just 10) (Just -30) Nothing (Just 30) (Just ( 1, 1 ))
    , StandardSkill 45 188 "Lightning Axe" 29 True [ 16 ] False "Deals magic-based damage. Might increases based on user’s Resistance." (Just 3) (Just 4) Nothing Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 46 188 "Spike" 29 True [ 14, 24, 31, 32 ] False "" (Just 5) (Just 5) (Just 15) Nothing (Just 10) (Just ( 1, 1 ))
    , StandardSkill 49 188 "Lightning Axe" 32 True [ 2, 14 ] False "Deals magic-based damage. Might increases based on user’s Resistance." (Just 3) (Just 4) Nothing Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 50 188 "Diamond Axe" 32 True [ 9, 24, 26 ] False "" (Just 7) (Just 14) (Just -20) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 51 188 "Armored Strike" 32 True [ 4, 11, 34 ] False "Might increases based on user’s Defense." (Just 3) (Just 4) Nothing Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 52 188 "Exhaustive Strike" 32 True [ 6, 32 ] False "Depletes all of the weapon’s remaining durability and adds 30% of that value to Might." (Just 1) (Just 3) (Just 10) Nothing Nothing (Just ( 1, 1 ))

    -- Bow --
    , StandardSkill 57 189 "Curved Shot" 38 True [] False "" (Just 3) (Just 1) (Just 30) Nothing Nothing (Just ( 2, 3 ))
    , StandardSkill 60 189 "Heavy Draw" 40 True [ 3, 12, 33 ] False "" (Just 5) (Just 8) (Just 10) Nothing Nothing (Just ( 2, 2 ))
    , StandardSkill 61 189 "Deadeye" 40 True [ 7, 13 ] False "" (Just 5) (Just 6) Nothing Nothing Nothing (Just ( 3, 5 ))
    , StandardSkill 62 189 "Warning Shot" 40 True [ 9 ] False "After combat, inflicts Str -5 on foe for 1 turn." (Just 3) (Just 4) (Just 10) Nothing Nothing (Just ( 2, 3 ))
    , StandardSkill 63 189 "Monster Blast" 40 True [ 18, 33 ] False "Effective against Monsters." (Just 4) (Just 5) Nothing Nothing (Just 10) (Just ( 2, 2 ))
    , StandardSkill 64 189 "Break Shot" 40 True [ 21, 25 ] False "After combat, inflicts Def -5 on foe for 1 turn." (Just 3) (Just 4) (Just 5) Nothing Nothing (Just ( 2, 3 ))
    , StandardSkill 65 189 "Schisms Shot" 40 True [ 29 ] False "After combat, inflicts Res -5 on foe for 1 turn." (Just 3) (Just 4) (Just 15) Nothing Nothing (Just ( 2, 3 ))
    , StandardSkill 66 189 "Point-Blank Volley" 40 True [ 34 ] False "" (Just 4) (Just 3) (Just 10) (Just 10) Nothing (Just ( 1, 1 ))
    , StandardSkill 69 189 "Warning Shot" 44 True [ 13 ] False "After combat, inflicts Str -5 on foe for 1 turn." (Just 3) (Just 4) (Just 10) Nothing Nothing (Just ( 2, 3 ))
    , StandardSkill 70 189 "Schisms Shot" 44 True [ 3 ] False "After combat, inflicts Res -5 on foe for 1 turn." (Just 3) (Just 4) (Just 15) Nothing Nothing (Just ( 2, 3 ))
    , StandardSkill 71 189 "Point-Blank Volley" 44 True [ 25 ] False "2 consecutive hits." (Just 4) (Just 3) (Just 10) (Just 10) Nothing (Just ( 1, 1 ))
    , StandardSkill 72 189 "Encloser" 44 True [ 7, 18 ] False "Prevents foe from moving for 1 turn." (Just 3) (Just 4) (Just 15) Nothing Nothing (Just ( 2, 2 ))
    , StandardSkill 73 189 "Ward Arrow" 44 True [ 21, 29 ] False "Prevents foe from using magic for 1 turn." (Just 3) (Just 4) (Just 15) Nothing Nothing (Just ( 2, 2 ))

    -- Brawl --
    , StandardSkill 78 190 "Fading Blow" 50 True [] False "After combat, user moves 1 space backwards." (Just 3) (Just 6) (Just 10) (Just 30) Nothing (Just ( 1, 1 ))
    , StandardSkill 80 190 "Rushing Blow" 52 True [] False "After combat, user moves 1 space in front of the enemy." (Just 3) (Just 7) (Just 20) (Just 10) Nothing (Just ( 1, 1 ))
    , StandardSkill 82 190 "Draining Blow" 53 True [ 0, 1 ] False "Restores HP equal to 50% of the damage inflicted to the enemy." (Just 3) (Just 4) (Just 20) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 83 190 "Bombard" 53 True [ 6 ] False "Triggers 2 consecutive hits." (Just 3) (Just 3) Nothing Nothing (Just 10) (Just ( 1, 1 ))
    , StandardSkill 84 190 "One-Two Punch" 53 True [ 11, 32 ] False "Triggers a follow-up attack." (Just 4) (Just 8) (Just 20) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 85 190 "Nimble Combo" 53 True [ 12, 30 ] False "2 consecutive hits." (Just 3) (Just 4) Nothing (Just 20) Nothing (Just ( 1, 1 ))
    , StandardSkill 86 190 "Monster Crusher" 53 True [ 20 ] False "Effective against Monsters." (Just 4) (Just 13) (Just 10) Nothing (Just 10) (Just ( 1, 1 ))
    , StandardSkill 87 190 "Healing Focus" 54 True [] False "Restores 50% of the user's HP." Nothing Nothing Nothing Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 89 190 "Draining Blow" 56 True [ 20 ] False "Restores HP equal to 50% of the damage inflicted to the enemy." (Just 3) (Just 4) (Just 20) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 90 190 "Bombard" 56 True [ 30 ] False "Triggers 2 consecutive hits." (Just 3) (Just 3) Nothing Nothing (Just 10) (Just ( 1, 1 ))
    , StandardSkill 91 190 "Mystic Blow" 56 True [ 0, 1, 12 ] False "Deals magic-based damage." (Just 3) (Just 10) (Just 10) Nothing Nothing (Just ( 1, 1 ))
    , StandardSkill 92 190 "Mighty Blow" 56 True [ 6, 11, 32 ] False "" (Just 3) (Just 10) (Just -5) Nothing (Just 20) (Just ( 1, 1 ))
    ]
