module MasterySkill exposing (..)

import CustomTypes exposing (..)


getMasterySkill : Int -> Maybe MasterySkill
getMasterySkill val =
    initMasterySkills
        |> List.filter (\e -> e.id == val)
        |> List.head


initMasterySkills : List MasterySkill
initMasterySkills =
    [ MasterySkill 0 122 "HP +5" [ 0, 1 ] False "Increases HP by 5."
    , MasterySkill 1 123 "Speed +2" [ 2 ] False "Increases Spd by 2."
    , MasterySkill 2 124 "Defense +2" [ 3 ] False "Increases Def by 2."
    , MasterySkill 3 191 "Reposition" [ 3 ] True "User moves ally to the space behind the user."
    , MasterySkill 4 125 "Strength +2" [ 4 ] False "Increases Str by 2."
    , MasterySkill 5 191 "Shove" [ 4 ] True "User pushes ally forward 1 space."
    , MasterySkill 6 127 "Magic +2" [ 5 ] False "Increases Mag by 2."
    , MasterySkill 7 191 "Draw Back" [ 5 ] True "User moves 1 space backwards and ally is moved to where the user was previously."
    , MasterySkill 8 128 "Resistance +2" [ 6 ] False "Increases Res by 2."
    , MasterySkill 9 186 "Subdue" [ 6 ] True "Leaves foe with at least 1 HP."
    , MasterySkill 10 157 "Vantage" [ 7 ] False "Always attack first when under 50% HP."
    , MasterySkill 11 179 "Steal" [ 8 ] False "Unit can steal non-weapon items from enemies with lower Spd than self."
    , MasterySkill 12 160 "Desperation" [ 9 ] False "If unit initiates combat with HP ≤ 50%, unit’s follow-up attack (if possible) occurs before foe’s counterattack."
    , MasterySkill 13 110 "Darting Blow" [ 10 ] False "If unit initiates combat, grants AS +6 during combat."
    , MasterySkill 14 111 "Death Blow" [ 11 ] False "If unit initiates combat, grants Str +6 during combat."
    , MasterySkill 15 112 "Armored Blow" [ 12 ] False "If unit initiates combat, grants Def +6 during combat."
    , MasterySkill 16 170 "Hit +20" [ 13 ] False "Increases Hit by 20."
    , MasterySkill 17 180 "Unarmed Combat" [ 14 ] False "User can fight without a weapon equipped."
    , MasterySkill 18 109 "Fiendish Blow" [ 15 ] False "If unit initiates combat, grants Mag+6 during combat."
    , MasterySkill 19 167 "Poison Strike" [ 16 ] False "If unit initiates combat, enemy loses up to 20% HP."
    , MasterySkill 20 176 "Miracle" [ 17 ] False "Luck\u{00A0}% chance to survive lethal damage with 1HP if HP is above 1."
    , MasterySkill 21 191 "Swap" [ 18 ] True "User swaps places with an ally."
    , MasterySkill 22 135 "Defiant Str" [ 19 ] False "Grants Str +8 when HP is ≤ 25%."
    , MasterySkill 23 168 "Lethality" [ 20 ] False "Chance to instantly kill a foe when dealing damage. Trigger\u{00A0}% = 0.25×Dex."
    , MasterySkill 24 171 "Aegis" [ 21 ] False "Chance to reduce bow/magic damage by half. Trigger\u{00A0}% = Dex stat."
    , MasterySkill 25 185 "Wrath" [ 22 ] False "If foe initiates combat while unit’s HP is ≤ 50%, grants Crit +50."
    , MasterySkill 26 172 "Pavise" [ 23 ] False "Chance to reduce sword/lance/axe/brawling damage by half. Trigger\u{00A0}% = Dex stat."
    , MasterySkill 27 88 "Seal Defense" [ 24 ] False "If unit damages foe during combat, foe suffers Def -6 for 1 turn after combat."
    , MasterySkill 28 85 "Tomebreaker" [ 26 ] False "Grants Hit/Avo +20 when brawling against magic users."
    , MasterySkill 29 84 "Bowbreaker" [ 27 ] False "Grants Hit/Avo +20 when using magic against bow users."
    , MasterySkill 30 150 "Lifetaker" [ 28 ] False "Unit recovers HP equal to 50% of damage dealt after defeating a foe."
    , MasterySkill 31 149 "Renewal" [ 29 ] False "Unit recovers up to 20% of max HP at the start of each turn."
    , MasterySkill 32 113 "Warding Blow" [ 30 ] False "If unit initiates combat, grants Res +6 during combat."
    , MasterySkill 33 70 "Defiant Avo" [ 31 ] False "Grants Avo +30 when HP is ≤ 25%."
    , MasterySkill 34 162 "Quick Riposte" [ 32 ] False "If foe initiates combat while unit’s HP is ≥ 50%, unit makes guaranteed follow-up attack."
    , MasterySkill 35 61 "Defiant Crit" [ 33 ] False "Grants Crit +50 when HP is ≤ 25%."
    , MasterySkill 36 136 "Defiant Def" [ 34 ] False "Grants Def +8 when HP is ≤ 25%."
    , MasterySkill 37 139 "Defiant Spd" [ 35 ] False "Grants Spd +8 when HP is ≤ 25%."
    , MasterySkill 38 138 "Defiant Mag" [ 36 ] False "Grants Mag +8 when HP is ≤ 25%."
    , MasterySkill 39 89 "Seal Resistance" [ 37 ] False "If unit damages foe during combat, foe suffers Res -6 for 1 turn after combat."
    , MasterySkill 40 137 "Defiant Res" [ 38 ] False "Grants Res +8 when HP is ≤ 25%."
    , MasterySkill 41 184 "Special Dance" [ 39 ] False "Dex/Spd/Luck +4 to target ally when using Dance."
    , MasterySkill 42 186 "Sword Dance" [ 39 ] True "Might increases based on user’s Charm."
    , MasterySkill 43 183 "Sacred Power" [ 40 ] False "Adjacent allies deal 3 extra damage and take 3 less damage during combat."
    , MasterySkill 44 144 "Pomp & Circumstance" [ 41, 43, 45 ] False "Increases Lck/Cha by 4."
    ]
