module StandardSkill exposing (..)

import CustomTypes exposing (..)


getStandardSkill : Int -> Maybe StandardSkill
getStandardSkill val =
    initStandardSkills
        |> List.filter (\e -> e.id == val)
        |> List.head


initStandardSkills : List StandardSkill
initStandardSkills =
    [ StandardSkill 0 "Sword Prowess Lv.1" 1 False [] False "Grants Hit +5, Avoid +7 and Critical Evade +5 when equipped with Sword "
    , StandardSkill 1 "Wrath Strike" 2 True [] False ""
    , StandardSkill 2 "Sword Prowess Lv.2" 3 False [] False "Grants Hit +6, Avoid +10 and Critical Evade +6 when equipped with Sword "
    , StandardSkill 3 "Grounder" 4 True [] False "Effective against Flying enemies"
    , StandardSkill 4 "Sword Prowess Lv.3" 5 False [] False "Grants Hit +7, Avoid +13 and Critical Evade +7 when equipped with Sword "
    , StandardSkill 5 "Bane of Monsters" 5 True [ 0, 1, 9, 18, 30 ] False "Effective against Monsters"
    , StandardSkill 6 "Haze Slice" 5 True [ 2, 21, 26 ] False ""
    , StandardSkill 7 "Hexblade" 5 True [ 8, 28 ] False "Deals magic-based damage"
    , StandardSkill 8 "Sunder" 5 True [ 4, 10, 12 ] False ""
    , StandardSkill 9 "Soulblade" 5 True [ 23 ] False "Deals magic-based damage, Might increases based on user's Resistance "
    , StandardSkill 10 "Axebreaker" 6 False [] False "Grants Hit/Avo +20 when using a sword against axe users. "
    , StandardSkill 11 "Sword Prowess Lv.4" 7 False [] False "Grants Hit +8, Avoid +16 and Critical Evade +8 when equipped with Sword "
    , StandardSkill 12 "Hexblade" 8 True [ 2, 17 ] False "Deals magic-based damage"
    , StandardSkill 13 "Windsweep" 8 True [ 0, 1, 10 ] False "Prevents enemy counterattack"
    , StandardSkill 14 "Finess Blade" 8 True [ 9, 12, 18, 30 ] False "Might increases based on user's Dexterity"
    , StandardSkill 15 "Sword Prowess Lv.5" 9 False [] False "Grants Hit +10, Avoid +20 and Critical Evade +10 when equipped with Sword "
    , StandardSkill 16 "Sword Critical +10" 10 False [] False "Grants Crit +10 when using a sword. "
    , StandardSkill 17 "Swordfaire" 11 False [] False "Might +5 when a sword is equipped. "
    , StandardSkill 18 "Lance Prowess Lv.1" 13 False [] False "Grants Hit +6, Avoid +6 and Critical Evade +5 when equipped with Lance "
    , StandardSkill 19 "Tempest Lance" 14 True [] False ""
    , StandardSkill 20 "Lance Prowess Lv.2" 15 False [] False "Grants Hit +8, Avoid +8 and Critical Evade +6 when equipped with Lance "
    , StandardSkill 21 "Knightkneeler" 16 True [] False "Effective against Cavalry enemies"
    , StandardSkill 22 "Lance Prowess Lv.3" 17 False [] False "Grants Hit +10, Avoid +10 and Critical Evade +7 when equipped with Lance "
    , StandardSkill 23 "Shatter Slash" 17 True [ 4, 24, 31 ] False "After combat, inflicts Def -5 on foe for 1 turn. "
    , StandardSkill 24 "Vengeance" 17 True [ 7, 11, 34 ] False "Damage increases in relation to the user’s missing HP. "
    , StandardSkill 25 "Monster Piercer" 17 True [ 10, 14, 25, 26 ] False "Effective against Monsters"
    , StandardSkill 26 "Hit and Run" 17 True [ 17, 27, 33 ] False "After combat, user moves 1 space backwards. "
    , StandardSkill 27 "Frozen Lance" 17 True [ 19 ] False "Deals magic-based damage. Might increases based on user’s Dexterity. "
    , StandardSkill 28 "Swordbreaker" 18 False [] False "Grants Hit/Avo +20 when using a lance against sword users. "
    , StandardSkill 29 "Lance Prowess Lv.4" 19 False [] False "Grants Hit +12, Avoid +12 and Critical Evade +8 when equipped with Lance "
    , StandardSkill 30 "Frozen Lance" 20 True [ 17, 27 ] False "Deals magic-based damage. Might increases based on user’s Dexterity. "
    , StandardSkill 31 "Swift Strikes" 20 True [ 4, 14, 26 ] False "Triggers 2 consecutive hits. "
    , StandardSkill 32 "Glowing Ember" 20 True [ 10, 31 ] False "Might increases based on user’s Defense. "
    , StandardSkill 33 "Lance Jab" 20 True [ 25, 33, 34 ] False "Might increases based on user’s Speed. "
    , StandardSkill 34 "Lance Prowess Lv.5" 21 False [] False "Grants Hit +15, Avoid +15 and Critical Evade +10 when equipped with Lance "
    , StandardSkill 35 "Lance Critical +10" 22 False [] False "Grants Crit +10 when using a lance. "
    , StandardSkill 36 "Lancefaire" 23 False [] False "Might +5 when a lance is equipped. "
    , StandardSkill 37 "Axe Prowess Lv.1" 25 False [] False "Grants Hit +7, Avoid +5 and Critical Evade +5 when equipped with Axe "
    , StandardSkill 38 "Smash" 26 True [] False ""
    , StandardSkill 39 "Axe Prowess Lv.2" 27 False [] False "Grants Hit +10, Avoid +6 and Critical Evade +6 when equipped with Axe "
    , StandardSkill 40 "Helm Splitter" 28 True [] False "Effective against Armored enemies"
    , StandardSkill 41 "Axe Prowess Lv.3" 29 False [] False "Grants Hit +13, Avoid +7 and Critical Evade +7 when equipped with Axe "
    , StandardSkill 42 "Monster Breaker" 29 True [ 2, 11, 34 ] False "Effective against Monsters"
    , StandardSkill 43 "Focused Strike" 29 True [ 4, 13, 26 ] False ""
    , StandardSkill 44 "Wild Abandon" 29 True [ 6, 9, 20 ] False ""
    , StandardSkill 45 "Lightning Axe" 29 True [ 16 ] False "Deals magic-based damage. Might increases based on user’s Resistance."
    , StandardSkill 46 "Spike" 29 True [ 14, 24, 31, 32 ] False ""
    , StandardSkill 47 "Lancebreaker" 30 False [] False "Grants Hit/Avo +20 when using an axe against lance users. "
    , StandardSkill 48 "Axe Prowess Lv.4" 31 False [] False "Grants Hit +16, Avoid +8 and Critical Evade +8 when equipped with Axe "
    , StandardSkill 49 "Lightning Axe" 32 True [ 2, 14 ] False "Deals magic-based damage. Might increases based on user’s Resistance."
    , StandardSkill 50 "Diamond Axe" 32 True [ 9, 24, 26 ] False ""
    , StandardSkill 51 "Armored Strike" 32 True [ 4, 11, 34 ] False "Might increases based on user’s Defense. "
    , StandardSkill 52 "Exhaustive Strike" 32 True [ 6, 32 ] False "Depletes all of the weapon’s remaining durability and adds 30% of that value to Might."
    , StandardSkill 53 "Axe Prowess Lv.5" 33 False [] False "Grants Hit +20, Avoid +10 and Critical Evade +10 when equipped with Axe "
    , StandardSkill 54 "Axe Critical +10" 34 False [] False "Grants Crit +10 when using an axe. "
    , StandardSkill 55 "Axefaire" 35 False [] False "Might +5 when an axe is equipped. "
    , StandardSkill 56 "Bow Prowess Lv.1" 37 False [] False "Grants Hit +6, Avoid +6 and Critical Evade +5 when equipped with Bow "
    , StandardSkill 57 "Curved Shot" 38 True [] False ""
    , StandardSkill 58 "Bow Prowess Lv.2" 39 False [] False "Grants Hit +8, Avoid +8 and Critical Evade +6 when equipped with Bow "
    , StandardSkill 59 "Close Counter" 40 False [] False "Allows unit to counterattack adjacent foes. "
    , StandardSkill 60 "Heavy Draw" 40 True [ 3, 12, 33 ] False ""
    , StandardSkill 61 "Deadeye" 40 True [ 7, 13 ] False ""
    , StandardSkill 62 "Warning Shot" 40 True [ 9 ] False "After combat, inflicts Str -5 on foe for 1 turn. "
    , StandardSkill 63 "Monster Blast" 40 True [ 18, 33 ] False "Effective against Monsters"
    , StandardSkill 64 "Break Shot" 40 True [ 21, 25 ] False "After combat, inflicts Def -5 on foe for 1 turn."
    , StandardSkill 65 "Schisms Shot" 40 True [ 29 ] False "After combat, inflicts Res -5 on foe for 1 turn. "
    , StandardSkill 66 "Point-Blank Volley" 40 True [ 34 ] False ""
    , StandardSkill 67 "Bow Prowess Lv.3" 41 False [] False "Grants Hit +10, Avoid +10 and Critical Evade +7 when equipped with Bow "
    , StandardSkill 68 "Bow Prowess Lv.4" 43 False [] False "Grants Hit +12, Avoid +12 and Critical Evade +8 when equipped with Bow "
    , StandardSkill 69 "Warning Shot" 44 True [ 13 ] False "After combat, inflicts Str -5 on foe for 1 turn. "
    , StandardSkill 70 "Schisms Shot" 44 True [ 3 ] False "After combat, inflicts Res -5 on foe for 1 turn. "
    , StandardSkill 71 "Point-Blank Volley" 44 True [ 25 ] False "2 consecutive hits. "
    , StandardSkill 72 "Encloser" 44 True [ 7, 18 ] False "Prevents foe from moving for 1 turn "
    , StandardSkill 73 "Ward Arrow" 44 True [ 21, 29 ] False "Prevents foe from using magic for 1 turn "
    , StandardSkill 74 "Bow Prowess Lv.5" 45 False [] False "Grants Hit +15, Avoid +15 and Critical Evade +10 when equipped with Bow "
    , StandardSkill 75 "Bow Critical +10" 46 False [] False "Grants Crit +10 when using a bow. "
    , StandardSkill 76 "Bowfaire" 47 False [] False "Might +5 when a bow is equipped. "
    , StandardSkill 77 "Brawling Prowess Lv.1" 49 False [] False "Grants Hit +5, Avoid +7 and Critical Evade +5 when brawling. "
    , StandardSkill 78 "Fading Blow" 50 True [] False "After combat, user moves 1 space backwards. "
    , StandardSkill 79 "Brawling Prowess Lv.2" 51 False [] False "Grants Hit +6, Avoid +10 and Critical Evade +6 when brawling "
    , StandardSkill 80 "Rushing Blow" 52 True [] False "After combat, user moves 1 space in front of the enemy."
    , StandardSkill 81 "Brawling Prowess Lv.3" 53 False [] False "Grants Hit +7, Avoid +13 and Critical Evade +7 when brawling "
    , StandardSkill 82 "Draining Blow" 53 True [ 0, 1 ] False "Restores HP equal to 50% of the damage inflicted to the enemy. "
    , StandardSkill 83 "Bombard" 53 True [ 6 ] False "Triggers 2 consecutive hits. "
    , StandardSkill 84 "One-Two Punch" 53 True [ 11, 32 ] False "Triggers a follow-up attack. "
    , StandardSkill 85 "Nimble Combo" 53 True [ 12, 30 ] False "2 consecutive hits. "
    , StandardSkill 86 "Monster Crusher" 53 True [ 20 ] False "Effective against Monsters"
    , StandardSkill 87 "Healing Focus" 54 True [] False "Restores 50% of the user's HP"
    , StandardSkill 88 "Brawling Prowess Lv.4" 55 False [] False "Grants Hit +8, Avoid +16 and Critical Evade +8 when brawling "
    , StandardSkill 89 "Draining Blow" 56 True [ 20 ] False "Restores HP equal to 50% of the damage inflicted to the enemy. "
    , StandardSkill 90 "Bombard" 56 True [ 30 ] False "Triggers 2 consecutive hits. "
    , StandardSkill 91 "Mystic Blow" 56 True [ 0, 1, 12 ] False "Deals magic-based damage. "
    , StandardSkill 92 "Mighty Blow" 56 True [ 6, 11, 32 ] False ""
    , StandardSkill 93 "Brawling Prowess Lv.5" 57 False [] False "Grants Hit +10, Avoid +20 and Critical Evade +10 when brawling "
    , StandardSkill 94 "Brawl Critical +10" 58 False [] False "Grants Crit +10 when brawling. "
    , StandardSkill 95 "Fistfaire" 59 False [] False "Might +5 when a gauntlet is equipped. "
    , StandardSkill 96 "Reason Prowess Lv.1" 61 False [] False "Grants Hit +5, Avoid +7 and Critical Evade +5 when equipped with Reason Magic "
    , StandardSkill 97 "Reason Prowess Lv.2" 63 False [] False "Grants Hit +6, Avoid +10 and Critical Evade +6 when equipped with Reason Magic "
    , StandardSkill 98 "Reason Prowess Lv.3" 65 False [] False "Grants Hit +7, Avoid +13 and Critical Evade +7 when equipped with Reason Magic "
    , StandardSkill 99 "Reason Prowess Lv.4" 67 False [] False "Grants Hit +8, Avoid +16 and Critical Evade +8 when equipped with Reason Magic "
    , StandardSkill 100 "Reason Prowess Lv.5" 69 False [] False "Grants Hit +10, Avoid +20 and Critical Evade +10 when equipped with Reason Magic "
    , StandardSkill 101 "Black Magic Range +1" 70 False [ 2, 3, 22 ] True "Increases black magic range by 1. "
    , StandardSkill 102 "Black Magic Range +1" 70 False [ 2, 3, 22 ] False "Increases dark magic range by 1. "
    , StandardSkill 103 "Black Tomefaire" 71 False [ 2, 3, 22 ] True "Might +5 when Black Magic is equipped. "
    , StandardSkill 104 "Dark Tomefaire" 71 False [ 2, 3, 22 ] False "Might +5 when Dark Magic is equipped. "
    , StandardSkill 105 "Faith Prowess Lv.1" 73 False [] False "Grants Hit +5, Avoid +7 and Critical Evade +5 when equipped with Faith Magic "
    , StandardSkill 106 "Faith Prowess Lv.2" 75 False [] False "Grants Hit +6, Avoid +10 and Critical Evade +6 when equipped with Faith Magic "
    , StandardSkill 107 "Faith Prowess Lv.3" 77 False [] False "Grants Hit +7, Avoid +13 and Critical Evade +7 when equipped with Faith Magic "
    , StandardSkill 108 "Faith Prowess Lv.4" 79 False [] False "Grants Hit +8, Avoid +16 and Critical Evade +8 when equipped with Faith Magic "
    , StandardSkill 109 "Faith Prowess Lv.5" 81 False [] False "Grants Hit +10, Avoid +20 and Critical Evade +10 when equipped with Faith Magic "
    , StandardSkill 110 "Black Magic Range +1" 82 False [] False "Increases White Magic range by 1 for attacks that damage foes. "
    , StandardSkill 111 "Dark Tomefaire" 83 False [] False "Might +5 when White Magic is equipped. "
    , StandardSkill 112 "Authority Prowess Lv.1" 85 False [] False "Grants Mt +2 with gambits. "
    , StandardSkill 113 "Rally Magic" 86 False [ 3, 17 ] False "Use Rally to grant Mag +4 to an ally. "
    , StandardSkill 114 "Rally Charm" 86 False [ 8, 28 ] False "Use Rally to grant Cha +8 to an ally. "
    , StandardSkill 115 "Rally Dexterity" 86 False [ 4 ] False "Use Rally to grant Dex +8 to an ally. "
    , StandardSkill 116 "Rally Resistance" 86 False [ 16 ] False "Use Rally to grant Res +4 to an ally. "
    , StandardSkill 117 "Rally Strength" 86 False [ 20, 32 ] False "Use Rally to grant Str +4 to an ally. "
    , StandardSkill 118 "Rally Speed" 86 False [ 21 ] False "Use Rally to grant Spd +4 to an ally. "
    , StandardSkill 119 "Rally Defense" 86 False [ 26, 31 ] False "Use Rally to grant Def +4 to an ally. "
    , StandardSkill 120 "Rally Luck" 86 False [ 27 ] False "Use Rally to grant Lck +8 to an ally. "
    , StandardSkill 121 "Authority Prowess Lv.2" 87 False [] False "Grants Mt +4 with gambits. "
    , StandardSkill 122 "Battalion Vantage" 88 False [ 0, 1, 2, 12, 24, 19, 30 ] False "When foe initiates combat, unit still attacks first if battalion endurance is ≤ 1/3. "
    , StandardSkill 123 "Battalion Wrath" 88 False [ 3, 6, 7, 9, 10, 11, 20, 24, 26, 31, 32 ] False "If foe initiates combat while unit’s battalion endurance is ≤ 1/3, grants Crit +50. "
    , StandardSkill 124 "Battalion Desperation" 88 False [ 4, 8, 13, 17, 18, 21, 22, 25, 29, 33, 34 ] False "If unit initiates combat when battalion endurance is ≤ 1/3, unit’s follow-up attack (if possible) occurs before foe’s counterattack. "
    , StandardSkill 125 "Battalion Renewal" 88 False [ 5, 15, 16, 23, 27, 28 ] False "Unit recovers up to 30% of max HP at the start of each turn while battalion endurance is ≤ 1/3. "
    , StandardSkill 126 "Authority Prowess Lv.3" 89 False [] False "Grants Mt +6 with gambits. "
    , StandardSkill 127 "Rally Dexterity" 89 False [ 21 ] False "Use Rally to grant Dex +8 to an ally. "
    , StandardSkill 128 "Rally Resistance" 89 False [ 3 ] False "Use Rally to grant Res +4 to an ally. "
    , StandardSkill 129 "Rally Speed" 89 False [ 16 ] False "Use Rally to grant Spd +4 to an ally. "
    , StandardSkill 130 "Model Leader" 89 False [ 0, 1, 2, 10, 18, 26 ] False "Doubles experience earned for battalions. "
    , StandardSkill 131 "Defense Tactics" 90 False [] False "Battalion endurance takes half damage. "
    , StandardSkill 132 "Authority Prowess Lv.4" 91 False [] False "Grants Mt +8 with gambits. "
    , StandardSkill 133 "Battalion Vantage" 92 False [ 10, 21 ] False "When foe initiates combat, unit still attacks first if battalion endurance is ≤ 1/3. "
    , StandardSkill 134 "Battalion Wrath" 92 False [ 16, 18 ] False "If foe initiates combat while unit’s battalion endurance is ≤ 1/3, grants Crit +50. "
    , StandardSkill 135 "Battalion Desperation" 92 False [ 0, 1, 3, 26 ] False "If unit initiates combat when battalion endurance is ≤ 1/3, unit’s follow-up attack (if possible) occurs before foe’s counterattack. "
    , StandardSkill 136 "Battalion Renewal" 92 False [ 2 ] False "Unit recovers up to 30% of max HP at the start of each turn while battalion endurance is ≤ 1/3. "
    , StandardSkill 137 "Authority Prowess Lv.5" 93 False [] False "Grants Mt +10 with gambits. "
    , StandardSkill 138 "Rally Charm" 94 False [ 2, 10, 18 ] False "Use Rally to grant Cha +8 to an ally. "
    , StandardSkill 139 "Rally Resistance" 94 False [ 26 ] False "Use Rally to grant Res +4 to an ally. "
    , StandardSkill 140 "Rally Strength" 94 False [ 21 ] False "Use Rally to grant Str +4 to an ally. "
    , StandardSkill 141 "Rally Speed" 94 False [ 3 ] False "Use Rally to grant Spd +4 to an ally. "
    , StandardSkill 142 "Rally Movement" 94 False [ 0, 1, 16 ] False "Use Rally to grant Mv +1 to an ally. "
    , StandardSkill 143 "Offensive Tactics" 95 False [] False "Grants Mt +5 and Hit +20 with gambits. "
    , StandardSkill 144 "Weight -3" 100 False [] False "The combined weight of equipment is reduced by 3. "
    , StandardSkill 145 "Smite" 102 True [] False "User pushes ally foward 2 spaces"
    , StandardSkill 146 "Weight -5" 105 False [] False "The combined weight of equipment is reduced by 5. "
    , StandardSkill 147 "Armored Effect Null" 107 False [] False "Nullifies any extra effectiveness against armored units. "
    , StandardSkill 148 "Dexterity +4" 112 False [] False "Increases Dex by 4. "
    , StandardSkill 149 "Movement +1" 117 False [] False "Increases Mv by 1. "
    , StandardSkill 150 "Cavalry Effect Null" 119 False [] False "Nullifies any extra effectiveness against cavalry units. "
    , StandardSkill 151 "Alert Stance+" 126 False [] False "If unit takes no action except Wait, grants Avo +15 for 1 turn. "
    , StandardSkill 152 "Alert Stance+" 129 False [] False "If unit takes no action except Wait, grants Avo +30 for 1 turn. "
    , StandardSkill 153 "Flying Effect Null" 131 False [] False "Nullifies any extra effectiveness against flying units."
    ]
