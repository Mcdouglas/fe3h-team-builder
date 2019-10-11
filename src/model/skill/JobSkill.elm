module JobSkill exposing (..)

import CustomTypes exposing (..)


getJobSkillById : Int -> Maybe JobSkill
getJobSkillById val =
    initJobSkills
        |> List.filter (\e -> e.id == val)
        |> List.head


initJobSkills : List JobSkill
initJobSkills =
    [ JobSkill 0 "Charm" False
    , JobSkill 1 "Canto" False
    , JobSkill 2 "Unarmed Combat" False
    , JobSkill 3 "Fire" False
    , JobSkill 4 "Miasma Δ" False
    , JobSkill 5 "Heartseeker" False
    , JobSkill 6 "Steal" False
    , JobSkill 7 "Locktouch" False
    , JobSkill 8 "Avoid +10" False
    , JobSkill 9 "Bowrange +1" False
    , JobSkill 10 "Bowrange +2" False
    , JobSkill 11 "Heal" False
    , JobSkill 12 "White Magic Heal +5" False
    , JobSkill 13 "White Magic Heal +10" False
    , JobSkill 14 "Swordfaire" False
    , JobSkill 15 "Axefaire" False
    , JobSkill 16 "Lancefaire" False
    , JobSkill 17 "Bowfaire" False
    , JobSkill 18 "Fistfaire" False
    , JobSkill 19 "Black Tomefaire" False
    , JobSkill 20 "Dark Tomefaire" False
    , JobSkill 21 "White Tomefaire" False
    , JobSkill 22 "Vantage" False
    , JobSkill 23 "Weight -5" False
    , JobSkill 24 "Terrain Resistance" False
    , JobSkill 25 "Black Magic Uses x2" False
    , JobSkill 26 "Dark Magic uses x2" False
    , JobSkill 27 "White Magic uses x2" False
    , JobSkill 28 "Sword Critical +10" False
    , JobSkill 29 "Stealth" False
    , JobSkill 30 "Axe Critical +10" False
    , JobSkill 31 "Critical +20" False
    , JobSkill 32 "Fiendish Blow" False
    , JobSkill 33 "Flickering Flower" True
    , JobSkill 34 "Paraselene" True
    , JobSkill 35 "Wind God" True
    , JobSkill 36 "Assassinate" True
    , JobSkill 37 "Astra" True
    , JobSkill 38 "Triangle Attack" True
    , JobSkill 39 "War Master's Strike" True
    , JobSkill 40 "Hunter's Volley" True
    , JobSkill 41 "Fierce Iron Fist" True
    ]
