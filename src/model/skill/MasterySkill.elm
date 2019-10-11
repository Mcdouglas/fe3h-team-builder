module MasterySkill exposing (..)

import CustomTypes exposing (..)


getMasterySkill : Int -> Maybe MasterySkill
getMasterySkill val =
    initMasterySkills
        |> List.filter (\e -> e.id == val)
        |> List.head


initMasterySkills : List MasterySkill
initMasterySkills =
    [ MasterySkill 0 "HP +5" [ 0, 1 ] False
    , MasterySkill 1 "Speed +2" [ 2 ] False
    , MasterySkill 2 "Defense +2" [ 3 ] False
    , MasterySkill 3 "Reposition" [ 3 ] True
    , MasterySkill 4 "Strength +2" [ 4 ] False
    , MasterySkill 5 "Shove" [ 4 ] True
    , MasterySkill 6 "Magic +2" [ 5 ] False
    , MasterySkill 7 "Draw Back" [ 5 ] True
    , MasterySkill 8 "Resistance +2" [ 6 ] False
    , MasterySkill 9 "Subdue" [ 6 ] True
    , MasterySkill 10 "Vantage" [ 7 ] False
    , MasterySkill 11 "Steal" [ 8 ] False
    , MasterySkill 12 "Desperation" [ 9 ] False
    , MasterySkill 13 "Darting Blow" [ 10 ] False
    , MasterySkill 14 "Death Blow" [ 11 ] False
    , MasterySkill 15 "Armored Blow" [ 12 ] False
    , MasterySkill 16 "Hit +20" [ 13 ] False
    , MasterySkill 17 "Unarmed Combat" [ 14 ] False
    , MasterySkill 18 "Fiendish Blow" [ 15 ] False
    , MasterySkill 19 "Poison Strike" [ 16 ] False
    , MasterySkill 20 "Miracle" [ 17 ] False
    , MasterySkill 21 "Swap" [ 18 ] True
    , MasterySkill 22 "Defiant Str" [ 19 ] False
    , MasterySkill 23 "Lethality" [ 20 ] False
    , MasterySkill 24 "Aegis" [ 21 ] False
    , MasterySkill 25 "Wrath" [ 22 ] False
    , MasterySkill 26 "Pavise" [ 23 ] False
    , MasterySkill 27 "Seal Defense" [ 24 ] False
    , MasterySkill 28 "Tomebreaker" [ 26 ] False
    , MasterySkill 29 "Bowbreaker" [ 27 ] False
    , MasterySkill 30 "Lifetaker" [ 28 ] False
    , MasterySkill 31 "Renewal" [ 29 ] False
    , MasterySkill 32 "Warding Blow" [ 30 ] False
    , MasterySkill 33 "Defiant Avo" [ 31 ] False
    , MasterySkill 34 "Quick Riposte" [ 32 ] False
    , MasterySkill 35 "Defiant Crit" [ 33 ] False
    , MasterySkill 36 "Defiant Def" [ 34 ] False
    , MasterySkill 37 "Defiant Spd" [ 35 ] False
    , MasterySkill 38 "Defiant Mag" [ 36 ] False
    , MasterySkill 39 "Seal Resistance" [ 37 ] False
    , MasterySkill 40 "Defiant Res" [ 38 ] False
    , MasterySkill 41 "Special Dance" [ 39 ] False
    , MasterySkill 42 "Sword Dance" [ 39 ] True
    , MasterySkill 43 "Sacred Power" [ 40 ] False
    , MasterySkill 44 "Pomp & Circumstance" [ 41, 43, 45 ] False
    ]
