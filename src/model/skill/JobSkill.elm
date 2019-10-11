module JobSkill exposing (..)

import CustomTypes exposing (..)


getJobSkillById : Int -> Maybe JobSkill
getJobSkillById val =
    initJobSkills
        |> List.filter (\e -> e.id == val)
        |> List.head


initJobSkills : List JobSkill
initJobSkills =
    [ JobSkill 0 "Charm"
    , JobSkill 1 "Canto"
    , JobSkill 2 "Unarmed Combat"
    , JobSkill 3 "Fire"
    , JobSkill 4 "Miasma Δ"
    , JobSkill 5 "Heartseeker"
    , JobSkill 6 "Steal"
    , JobSkill 7 "Locktouch"
    , JobSkill 8 "Avoid +10"
    , JobSkill 9 "Bowrange +1"
    , JobSkill 10 "Bowrange +2"
    , JobSkill 11 "Heal"
    , JobSkill 12 "White Magic Heal +5"
    , JobSkill 13 "White Magic Heal +10"
    , JobSkill 14 "Swordfaire"
    , JobSkill 15 "Axefaire"
    , JobSkill 16 "Lancefaire"
    , JobSkill 17 "Bowfaire"
    , JobSkill 18 "Fistfaire"
    , JobSkill 19 "Black Tomefaire"
    , JobSkill 20 "Dark Tomefaire"
    , JobSkill 21 "White Tomefaire"
    , JobSkill 22 "Vantage"
    , JobSkill 23 "Weight -5"
    , JobSkill 24 "Terrain Resistance"
    , JobSkill 25 "Black Magic Uses x2"
    , JobSkill 26 "Dark Magic uses x2"
    , JobSkill 27 "White Magic uses x2"
    , JobSkill 28 "Sword Critical +10"
    , JobSkill 29 "Stealth"
    , JobSkill 30 "Axe Critical +10"
    , JobSkill 31 "Critical +20"
    , JobSkill 32 "Fiendish Blow"
    ]
