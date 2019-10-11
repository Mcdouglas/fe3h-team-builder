module JobSkill exposing (..)

import CustomTypes exposing (..)


getJobSkillById : Int -> Maybe JobSkill
getJobSkillById val =
    initJobSkills
        |> List.filter (\e -> e.id == val)
        |> List.head


initJobSkills : List JobSkill
initJobSkills =
    [ JobSkill 0 "Charm" [ 6, 41, 42, 43, 44, 45, 46 ] False
    , JobSkill 1 "Canto" [ 9, 10, 21, 24, 31, 33, 34, 35, 37, 38, 45, 46 ] False
    , JobSkill 2 "Unarmed Combat" [ 14, 26 ] False
    , JobSkill 3 "Fire" [ 15 ] False
    , JobSkill 4 "Miasma Δ" [ 16, 28 ] False
    , JobSkill 5 "Heartseeker" [ 16, 28 ] False
    , JobSkill 6 "Steal" [ 8 ] False
    , JobSkill 7 "Locktouch" [ 8, 20 ] False
    , JobSkill 8 "Avoid +10" [ 10, 31, 33 ] False
    , JobSkill 9 "Bowrange +1" [ 13, 25 ] False
    , JobSkill 10 "Bowrange +2" [ 35 ] False
    , JobSkill 11 "Heal" [ 17 ] False
    , JobSkill 12 "White Magic Heal +5" [ 17 ] False
    , JobSkill 13 "White Magic Heal +10" [ 29 ] False
    , JobSkill 14 "Swordfaire" [ 18, 19, 20, 30, 40 ] False
    , JobSkill 15 "Axefaire" [ 22, 23, 24, 32, 33, 34, 41, 42 ] False
    , JobSkill 16 "Lancefaire" [ 21, 31, 34, 43, 44 ] False
    , JobSkill 17 "Bowfaire" [ 25, 35, 45, 46 ] False
    , JobSkill 18 "Fistfaire" [ 26, 32 ] False
    , JobSkill 19 "Black Tomefaire" [ 27, 30, 37 ] False
    , JobSkill 20 "Dark Tomefaire" [ 37 ] False
    , JobSkill 21 "White Tomefaire" [ 38 ] False
    , JobSkill 22 "Vantage" [ 19 ] False
    , JobSkill 23 "Weight -5" [ 23 ] False
    , JobSkill 24 "Terrain Resistance" [ 21, 29, 38, 40 ] False
    , JobSkill 25 "Black Magic Uses x2" [ 27, 36 ] False
    , JobSkill 26 "Dark Magic uses x2" [ 36 ] False
    , JobSkill 27 "White Magic uses x2" [ 27, 36 ] False
    , JobSkill 28 "Sword Critical +10" [ 18 ] False
    , JobSkill 29 "Stealth" [ 8, 20 ] False
    , JobSkill 30 "Axe Critical +10" [ 22 ] False
    , JobSkill 31 "Critical +20" [ 32 ] False
    , JobSkill 32 "Fiendish Blow" [ 29 ] False
    , JobSkill 33 "Flickering Flower" [ 42 ] True
    , JobSkill 34 "Paraselene" [ 44 ] True
    , JobSkill 35 "Wind God" [ 46 ] True
    , JobSkill 36 "Assassinate" [ 20 ] True
    , JobSkill 37 "Astra" [ 18 ] True
    , JobSkill 38 "Triangle Attack" [ 10 ] True
    , JobSkill 39 "War Master's Strike" [ 32 ] True
    , JobSkill 40 "Hunter's Volley" [ 25 ] True
    , JobSkill 41 "Fierce Iron Fist" [ 26 ] True
    ]
