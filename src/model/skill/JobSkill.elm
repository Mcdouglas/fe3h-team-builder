module JobSkill exposing (getJobSkillById, getJobSkillsByJob, initJobSkills)

import CustomTypes exposing (JobSkill)


getJobSkillById : Int -> Maybe JobSkill
getJobSkillById id =
    initJobSkills
        |> List.filter (\e -> e.id == id)
        |> List.head


getJobSkillsByJob : Int -> List JobSkill
getJobSkillsByJob jobId =
    initJobSkills
        |> List.filter (\e -> List.member jobId e.jobIdList)


initJobSkills : List JobSkill
initJobSkills =
    [ -- Perks
      JobSkill 0 140 "Charm" [ 6, 41, 42, 43, 44, 45, 46 ] False "When allies adjacent to unit enter combat, allies gain +3 Damage." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 1 151 "Canto" [ 9, 10, 21, 24, 31, 33, 34, 35, 37, 38, 45, 46 ] False "After performing an action, user can use their leftover movement." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 2 180 "Unarmed Combat" [ 14, 26 ] False "User can fight without a weapon equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 3 164 "Fire" [ 15 ] False "Enables the use of Fire. If already learned, doubles the number of uses." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 4 166 "Miasma Δ" [ 16, 28 ] False "Enables the use of Miasma Δ. If already learned, doubles the number of uses." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 5 165 "Heartseeker" [ 16, 28 ] False "Reduces Avoid of adjacent foes by 20." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 6 179 "Steal" [ 8 ] False "Unit can steal non-weapon items from enemies with lower Spd than self." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 7 142 "Locktouch" [ 8, 20 ] False "Unit can open locks and chests without keys." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 8 71 "Avoid +10" [ 10, 31, 33 ] False "Increases Avoid by 10." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 9 95 "Bowrange +1" [ 13, 25 ] False "Increases range of Bows by 1." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 10 96 "Bowrange +2" [ 35 ] False "Increases range of Bows by 2." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 11 145 "Heal" [ 17 ] False "Unit can use Heal. If it has already been learnt, the number of times it can be used is doubled." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 12 146 "White Magic Heal +5" [ 17 ] False "White Magic heals +5 more HP." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 13 147 "White Magic Heal +10" [ 29 ] False "White Magic heals +10 more HP." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 14 73 "Swordfaire" [ 18, 19, 20, 30, 40 ] False "Might +5 when a sword is equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 15 74 "Axefaire" [ 22, 23, 24, 32, 33, 34, 41, 42 ] False "Might +5 when an axe is equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 16 75 "Lancefaire" [ 21, 31, 34, 43, 44 ] False "Might +5 when a lance is equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 17 76 "Bowfaire" [ 25, 35, 45, 46 ] False "Might +5 when a bow is equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 18 77 "Fistfaire" [ 26, 32 ] False "Might +5 when a gauntlet is equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 19 78 "Black Tomefaire" [ 27, 30, 37 ] False "Might +5 when Black Magic is equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 20 79 "Dark Tomefaire" [ 37 ] False "Might +5 when Dark Magic is equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 21 80 "White Tomefaire" [ 38 ] False "Might +5 when White Magic is equipped." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 22 157 "Vantage" [ 19 ] False "Always attack first when under 50% HP.\u{FEFF}" Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 23 178 "Weight -5" [ 23 ] False "The combined weight of equipment is reduced by 5." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 24 181 "Terrain Resistance" [ 21, 29, 38, 40 ] False "Unit does not receive terrain damage." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 25 97 "Black Magic Uses x2" [ 27, 36 ] False "Doubles the number of uses of Black Magic spells." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 26 98 "Dark Magic uses x2" [ 36 ] False "Doubles the number of uses of Dark Magic spells." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 27 99 "White Magic uses x2" [ 27, 36 ] False "Doubles the number of uses of White Magic spells." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 28 52 "Sword Critical +10" [ 18 ] False "Critical +10 when equipped with a sword." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 29 182 "Stealth" [ 8, 20 ] False "Unit is less likely to be targeted by enemies." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 30 54 "Axe Critical +10" [ 22 ] False "Critical +10 when equipped with an axe." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 31 60 "Critical +20" [ 32 ] False "Critical +20." Nothing Nothing Nothing Nothing Nothing Nothing
    , JobSkill 32 109 "Fiendish Blow" [ 29 ] False "Mag +6 when initiating attack." Nothing Nothing Nothing Nothing Nothing Nothing
    ]
