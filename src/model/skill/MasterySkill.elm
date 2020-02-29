module MasterySkill exposing (getMasterySkill, getMasterySkillsForJob, initMasterySkills)

import CustomTypes exposing (MasterySkill)


getMasterySkill : Int -> Maybe MasterySkill
getMasterySkill val =
    initMasterySkills
        |> List.filter (\e -> e.id == val)
        |> List.head


getMasterySkillsForJob : Int -> List MasterySkill
getMasterySkillsForJob id =
    initMasterySkills
        |> List.filter (\e -> List.member id e.jobIdList)


initMasterySkills : List MasterySkill
initMasterySkills =
    [ -- Perks
      MasterySkill 0 122 "HP +5" [ 0, 1 ] False "Increases HP by 5." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 1 123 "Speed +2" [ 2 ] False "Increases Spd by 2." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 2 124 "Defense +2" [ 3 ] False "Increases Def by 2." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 4 125 "Strength +2" [ 4 ] False "Increases Str by 2." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 6 127 "Magic +2" [ 5 ] False "Increases Mag by 2." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 8 128 "Resistance +2" [ 6 ] False "Increases Res by 2." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 10 157 "Vantage" [ 7 ] False "Always attack first when under 50% HP." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 11 179 "Steal" [ 8 ] False "Unit can steal non-weapon items from enemies with lower Spd than self." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 12 160 "Desperation" [ 9 ] False "If unit initiates combat with HP ≤ 50%, unit’s follow-up attack (if possible) occurs before foe’s counterattack." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 13 110 "Darting Blow" [ 10 ] False "If unit initiates combat, grants AS +6 during combat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 14 111 "Death Blow" [ 11 ] False "If unit initiates combat, grants Str +6 during combat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 15 112 "Armored Blow" [ 12 ] False "If unit initiates combat, grants Def +6 during combat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 16 170 "Hit +20" [ 13 ] False "Increases Hit by 20." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 17 180 "Unarmed Combat" [ 14 ] False "User can fight without a weapon equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 18 109 "Fiendish Blow" [ 15 ] False "If unit initiates combat, grants Mag+6 during combat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 19 167 "Poison Strike" [ 16 ] False "If unit initiates combat, enemy loses up to 20% HP." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 20 176 "Miracle" [ 17 ] False "Luck\u{00A0}% chance to survive lethal damage with 1HP if HP is above 1." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 22 135 "Defiant Str" [ 19 ] False "Grants Str +8 when HP is ≤ 25%." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 23 168 "Lethality" [ 20 ] False "Chance to instantly kill a foe when dealing damage. Trigger\u{00A0}% = 0.25×Dex." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 24 171 "Aegis" [ 21 ] False "Chance to reduce bow/magic damage by half. Trigger\u{00A0}% = Dex stat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 25 185 "Wrath" [ 22 ] False "If foe initiates combat while unit’s HP is ≤ 50%, grants Crit +50." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 26 172 "Pavise" [ 23 ] False "Chance to reduce sword/lance/axe/brawling damage by half. Trigger\u{00A0}% = Dex stat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 27 88 "Seal Defense" [ 24 ] False "If unit damages foe during combat, foe suffers Def -6 for 1 turn after combat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 28 85 "Tomebreaker" [ 26 ] False "Grants Hit/Avo +20 when brawling against magic users." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 29 84 "Bowbreaker" [ 27 ] False "Grants Hit/Avo +20 when using magic against bow users." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 30 150 "Lifetaker" [ 28 ] False "Unit recovers HP equal to 50% of damage dealt after defeating a foe." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 31 149 "Renewal" [ 29 ] False "Unit recovers up to 20% of max HP at the start of each turn." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 32 113 "Warding Blow" [ 30 ] False "If unit initiates combat, grants Res +6 during combat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 33 70 "Defiant Avo" [ 31 ] False "Grants Avo +30 when HP is ≤ 25%." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 34 162 "Quick Riposte" [ 32 ] False "If foe initiates combat while unit’s HP is ≥ 50%, unit makes guaranteed follow-up attack." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 35 61 "Defiant Crit" [ 33 ] False "Grants Crit +50 when HP is ≤ 25%." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 36 136 "Defiant Def" [ 34 ] False "Grants Def +8 when HP is ≤ 25%." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 37 139 "Defiant Spd" [ 35 ] False "Grants Spd +8 when HP is ≤ 25%." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 38 138 "Defiant Mag" [ 36 ] False "Grants Mag +8 when HP is ≤ 25%." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 39 89 "Seal Resistance" [ 37 ] False "If unit damages foe during combat, foe suffers Res -6 for 1 turn after combat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 40 137 "Defiant Res" [ 38 ] False "Grants Res +8 when HP is ≤ 25%." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 41 184 "Special Dance" [ 39 ] False "Dex/Spd/Luck +4 to target ally when using Dance." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 43 183 "Sacred Power" [ 40 ] False "Adjacent allies deal 3 extra damage and take 3 less damage during combat." Nothing Nothing Nothing Nothing Nothing Nothing
    , MasterySkill 44 144 "Pomp & Circumstance" [ 41, 43, 45 ] False "Increases Lck/Cha by 4." Nothing Nothing Nothing Nothing Nothing Nothing

    -- CombatArt
    , MasterySkill 3 191 "Reposition" [ 3 ] True "User moves ally to the space behind the user." Nothing Nothing Nothing Nothing Nothing (Just ( 1, 1 ))
    , MasterySkill 5 191 "Shove" [ 4 ] True "User pushes ally forward 1 space." Nothing Nothing Nothing Nothing Nothing (Just ( 1, 1 ))
    , MasterySkill 7 191 "Draw Back" [ 5 ] True "User moves 1 space backwards and ally is moved to where the user was previously." Nothing Nothing Nothing Nothing Nothing (Just ( 1, 1 ))
    , MasterySkill 9 186 "Subdue" [ 6 ] True "Leaves foe with at least 1 HP." Nothing Nothing Nothing Nothing Nothing (Just ( 1, 1 ))
    , MasterySkill 21 191 "Swap" [ 18 ] True "User swaps places with an ally." (Just 3) Nothing (Just 20) Nothing Nothing (Just ( 1, 1 ))
    , MasterySkill 42 186 "Sword Dance" [ 39 ] True "Might increases based on user’s Charm." (Just 2) (Just 1) Nothing (Just 20) Nothing (Just ( 1, 1 ))
    , MasterySkill 45 189 "Hunter's Volley" [ 25 ] True "Triggers 2 consecutive hits." (Just 5) (Just 1) (Just 15) Nothing (Just 10) (Just ( 2, 3 ))
    , MasterySkill 46 190 "Fierce Iron Fist" [ 26 ] True "Triggers 3 consecutive hits." (Just 5) (Just 1) Nothing Nothing (Just 10) (Just ( 1, 1 ))
    , MasterySkill 47 188 "Flickering Flower" [ 42 ] True "After combat, prevents foe from moving for 1 turn." (Just 3) (Just 10) (Just 10) (Just 10) Nothing (Just ( 1, 1 ))
    , MasterySkill 48 187 "Paraselene" [ 44 ] True "After combat, user moves 1 space backwards." (Just 3) (Just 10) Nothing Nothing (Just 10) (Just ( 1, 1 ))
    , MasterySkill 49 189 "Wind God" [ 46 ] True "" (Just 5) (Just 20) Nothing Nothing Nothing (Just ( 2, 3 ))
    , MasterySkill 50 186 "Assassinate" [ 20 ] True "Can kill enemies instantly." (Just 5) Nothing (Just 15) Nothing (Just 15) (Just ( 1, 1 ))
    , MasterySkill 51 186 "Astra" [ 18 ] True "5 consecutive hits at 30% Mt." (Just 9) Nothing (Just -10) Nothing Nothing (Just ( 1, 1 ))
    , MasterySkill 52 191 "Triangle Attack" [ 10 ] True "Can only be triggered when 3 allied Flying units (including the user) are adjacent to the same enemy. Only user needs to know Triangle Attack." (Just 3) (Just 8) (Just 30) (Just 40) Nothing (Just ( 1, 1 ))
    , MasterySkill 53 188 "War Master's Strike" [ 32 ] True "Effective against all foes." (Just 5) (Just 3) (Just 30) Nothing Nothing (Just ( 1, 1 ))
    ]
