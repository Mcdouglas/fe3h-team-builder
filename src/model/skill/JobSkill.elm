module JobSkill exposing (..)

import CustomTypes exposing (..)


getJobSkillById : Int -> Maybe JobSkill
getJobSkillById val =
    initJobSkills
        |> List.filter (\e -> e.id == val)
        |> List.head


getJobSkillsByJob : Int -> List JobSkill
getJobSkillsByJob id =
    initJobSkills
        |> List.filter (\e -> List.member id e.jobIdList)


initJobSkills : List JobSkill
initJobSkills =
    [ JobSkill 0 "Charm" [ 6, 41, 42, 43, 44, 45, 46 ] False "When allies adjacent to unit enter combat, allies gain +3 Damage."
    , JobSkill 1 "Canto" [ 9, 10, 21, 24, 31, 33, 34, 35, 37, 38, 45, 46 ] False "After performing an action, user can use their leftover movement."
    , JobSkill 2 "Unarmed Combat" [ 14, 26 ] False "User can fight without a weapon equipped."
    , JobSkill 3 "Fire" [ 15 ] False "Enables the use of Fire. If already learned, doubles the number of uses."
    , JobSkill 4 "Miasma Δ" [ 16, 28 ] False "Enables the use of Miasma Δ. If already learned, doubles the number of uses."
    , JobSkill 5 "Heartseeker" [ 16, 28 ] False "Reduces Avoid of adjacent foes by 20."
    , JobSkill 6 "Steal" [ 8 ] False "Unit can steal non-weapon items from enemies with lower Spd than self."
    , JobSkill 7 "Locktouch" [ 8, 20 ] False "Unit can open locks and chests without keys."
    , JobSkill 8 "Avoid +10" [ 10, 31, 33 ] False "Increases Avoid by 10."
    , JobSkill 9 "Bowrange +1" [ 13, 25 ] False "Increases range of Bows by 1."
    , JobSkill 10 "Bowrange +2" [ 35 ] False "Increases range of Bows by 2."
    , JobSkill 11 "Heal" [ 17 ] False "Unit can use Heal. If it has already been learnt, the number of times it can be used is doubled."
    , JobSkill 12 "White Magic Heal +5" [ 17 ] False "White Magic heals +5 more HP."
    , JobSkill 13 "White Magic Heal +10" [ 29 ] False "White Magic heals +10 more HP."
    , JobSkill 14 "Swordfaire" [ 18, 19, 20, 30, 40 ] False "Might +5 when a sword is equipped."
    , JobSkill 15 "Axefaire" [ 22, 23, 24, 32, 33, 34, 41, 42 ] False "Might +5 when an axe is equipped."
    , JobSkill 16 "Lancefaire" [ 21, 31, 34, 43, 44 ] False "Might +5 when a lance is equipped."
    , JobSkill 17 "Bowfaire" [ 25, 35, 45, 46 ] False "Might +5 when a bow is equipped."
    , JobSkill 18 "Fistfaire" [ 26, 32 ] False "Might +5 when a gauntlet is equipped."
    , JobSkill 19 "Black Tomefaire" [ 27, 30, 37 ] False "Might +5 when Black Magic is equipped."
    , JobSkill 20 "Dark Tomefaire" [ 37 ] False "Might +5 when Dark Magic is equipped."
    , JobSkill 21 "White Tomefaire" [ 38 ] False "Might +5 when White Magic is equipped."
    , JobSkill 22 "Vantage" [ 19 ] False "Always attack first when under 50% HP.\u{FEFF}"
    , JobSkill 23 "Weight -5" [ 23 ] False "The combined weight of equipment is reduced by 5."
    , JobSkill 24 "Terrain Resistance" [ 21, 29, 38, 40 ] False "Unit does not receive terrain damage."
    , JobSkill 25 "Black Magic Uses x2" [ 27, 36 ] False "Doubles the number of uses of Black Magic spells."
    , JobSkill 26 "Dark Magic uses x2" [ 36 ] False "Doubles the number of uses of Dark Magic spells."
    , JobSkill 27 "White Magic uses x2" [ 27, 36 ] False "Doubles the number of uses of White Magic spells."
    , JobSkill 28 "Sword Critical +10" [ 18 ] False "Critical +10 when equipped with a sword."
    , JobSkill 29 "Stealth" [ 8, 20 ] False "Unit is less likely to be targeted by enemies."
    , JobSkill 30 "Axe Critical +10" [ 22 ] False "Critical +10 when equipped with an axe."
    , JobSkill 31 "Critical +20" [ 32 ] False "Critical +20."
    , JobSkill 32 "Fiendish Blow" [ 29 ] False "Mag +6 when initiating attack."
    , JobSkill 33 "Flickering Flower" [ 42 ] True "After combat, prevents foe from moving for 1 turn."
    , JobSkill 34 "Paraselene" [ 44 ] True "After combat, user moves 1 space backwards."
    , JobSkill 35 "Wind God" [ 46 ] True ""
    , JobSkill 36 "Assassinate" [ 20 ] True "Can kill enemies instantly."
    , JobSkill 37 "Astra" [ 18 ] True "5 consecutive hits at 30% Mt."
    , JobSkill 38 "Triangle Attack" [ 10 ] True "Can only be triggered when 3 allied Flying units (including the user) are adjacent to the same enemy. Only user needs to know Triangle Attack."
    , JobSkill 39 "War Master's Strike" [ 32 ] True "Effective against all foes."
    , JobSkill 40 "Hunter's Volley" [ 25 ] True "2 consecutive hits."
    , JobSkill 41 "Fierce Iron Fist" [ 26 ] True "3 consecutive hits."
    ]
