module DataBuilder exposing (..)

import CustomTypes exposing (..)
import GlobalModel exposing (..)


type Msg
    = InitStaticData


loadAllStaticData : Model
loadAllStaticData =
    Model getJobCategories getJobs Nothing


getJobCategories : List JobCategory
getJobCategories =
    [ JobCategory 0 Starting (Just 20) (Just 0)
    , JobCategory 1 Beginner (Just 60) (Just 5)
    , JobCategory 2 Intermediate (Just 100) (Just 10)
    , JobCategory 3 Advanced (Just 150) (Just 20)
    , JobCategory 4 Master (Just 200) (Just 30)
    , JobCategory 5 Unique Nothing Nothing
    ]


getJobs : List Job
getJobs =
    [ -- Starting
      Job 0 "Commoner" 0 [] [] [] Nothing (Just CanUseSomeMagic) Nothing Nothing Nothing
    , Job 1 "Noble" 0 [] [] [] Nothing (Just CanUseSomeMagic) Nothing Nothing Nothing

    -- Beginner
    , Job 2 "Myrmidon" 1 [ Proficiency Sword 1 ] [ 2 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 3 "Soldier" 1 [ Proficiency Lance 1 ] [ 14 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 4 "Fighter" 1 [ Proficiency Axe 1, Proficiency Bow 1, Proficiency Brawling 1 ] [ 26, 38, 50 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 5 "Monk" 1 [ Proficiency Reason 1, Proficiency Faith 1 ] [ 62, 74 ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Intermediate
    , Job 6 "Lord" 2 [ Proficiency Sword 2, Proficiency Lance 1, Proficiency Authority 2 ] [ 3, 89 ] [] Nothing Nothing (Just "Edelgard, Dimitri and Claude only") Nothing Nothing
    , Job 7 "Mercenary" 2 [ Proficiency Sword 2, Proficiency Axe 1 ] [ 4 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 8 "Thief" 2 [ Proficiency Sword 2, Proficiency Bow 1 ] [ 4 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 9 "Cavalier" 2 [ Proficiency Sword 1, Proficiency Lance 2, Proficiency Riding 2 ] [ 16, 111 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 10 "Pegasus Knight" 12 [ Proficiency Sword 1, Proficiency Lance 2, Proficiency Flying 2 ] [ 16, 123 ] [] (Just Female) Nothing Nothing Nothing Nothing
    , Job 11 "Brigand" 2 [ Proficiency Axe 2, Proficiency Brawling 1 ] [ 28 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 12 "Armored Knight" 12 [ Proficiency Lance 1, Proficiency Axe 2, Proficiency HeavyArmor 1 ] [ 28, 99 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 13 "Archer" 2 [ Proficiency Sword 1, Proficiency Bow 2 ] [ 40 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 14 "Brawler" 2 [ Proficiency Axe 1, Proficiency Brawling 1 ] [ 52 ] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 15 "Mage" 2 [ Proficiency Reason 2, Proficiency Faith 1 ] [ 64 ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 16 "Dark Mage" 12 [ Proficiency Reason 2, Proficiency Faith 1 ] [ 64 ] [] (Just Male) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 17 "Priest" 2 [ Proficiency Reason 1, Proficiency Faith 2 ] [ 76 ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Advanced
    , Job 18 "Swordmaster" 3 [ Proficiency Sword 3 ] [ 8 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 19 "Hero" 3 [ Proficiency Sword 3, Proficiency Axe 2 ] [ 6, 28 ] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 20 "Assassin" 3 [ Proficiency Sword 2, Proficiency Bow 2 ] [ 6, 40 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 21 "Paladin" 3 [ Proficiency Sword 2, Proficiency Lance 3, Proficiency Riding 3 ] [ 18, 115 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 22 "Warrior" 3 [ Proficiency Axe 3 ] [ 32 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 23 "Fortress Knight" 3 [ Proficiency Lance 2, Proficiency Axe 3, Proficiency HeavyArmor 3 ] [ 30, 103 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 24 "Wyvern Rider" 3 [ Proficiency Lance 2, Proficiency Axe 3, Proficiency Flying 2 ] [ 30, 125 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 25 "Sniper" 3 [ Proficiency Bow 3 ] [ 44 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 26 "Grappler" 3 [ Proficiency Brawling 3 ] [ 56 ] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 27 "Warlock" 3 [ Proficiency Reason 3, Proficiency Faith 2 ] [ 68 ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 28 "Dark Bishop" 3 [ Proficiency Reason 3, Proficiency Faith 2 ] [ 68 ] [] (Just Male) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 29 "Bishop" 3 [ Proficiency Reason 2, Proficiency Faith 3 ] [ 80 ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Master
    , Job 30 "Mortal Savant" 4 [ Proficiency Sword 3, Proficiency Reason 3 ] [ 8, 67 ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 31 "Falcon Knight" 4 [ Proficiency Sword 3, Proficiency Lance 3, Proficiency Flying 3 ] [ 4, 20, 128 ] [] (Just Female) Nothing Nothing Nothing Nothing
    , Job 32 "War Master" 4 [ Proficiency Axe 3, Proficiency Brawling 3 ] [ 32, 54 ] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 33 "Wyvern Lord" 4 [ Proficiency Lance 3, Proficiency Axe 3, Proficiency Flying 3 ] [ 16, 32, 129 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 34 "Great Knight" 4 [ Proficiency Lance 3, Proficiency Axe 3, Proficiency HeavyArmor 3 ] [ 31, 105, 116 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 35 "Bow Knight" 4 [ Proficiency Lance 3, Proficiency Bow 3, Proficiency Riding 3 ] [ 16, 44, 117 ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 36 "Gremory" 4 [ Proficiency Reason 3, Proficiency Faith 3 ] [ 68, 80 ] [] (Just Female) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 37 "Dark Knight" 4 [ Proficiency Lance 3, Proficiency Reason 3, Proficiency Riding 3 ] [ 16, 67, 117 ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 38 "Holy Knight" 4 [ Proficiency Lance 3, Proficiency Faith 3, Proficiency Riding 3 ] [ 16, 79, 117 ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Unique
    , Job 39 "Dancer" 5 [ Proficiency Sword 2, Proficiency Authority 3 ] [] [] Nothing (Just CanUseMagic) Nothing (Just 100) Nothing
    , Job 40 "Enlightened One" 5 [ Proficiency Sword 3, Proficiency Brawling 2, Proficiency Faith 3, Proficiency Authority 3 ] [] [] Nothing (Just CanUseMagic) (Just "Byleth only") (Just 100) Nothing
    , Job 41 "Armored Lord" 5 [ Proficiency Axe 3, Proficiency Authority 3, Proficiency HeavyArmor 3 ] [] [] Nothing Nothing (Just "Edelgard only") (Just 150) Nothing
    , Job 42 "Emperor" 5 [ Proficiency Axe 3, Proficiency Authority 3, Proficiency HeavyArmor 3 ] [] [] Nothing Nothing (Just "Edelgard only") (Just 200) Nothing
    , Job 43 "High Lord" 5 [ Proficiency Sword 3, Proficiency Lance 3, Proficiency Authority 3 ] [] [] Nothing Nothing (Just "Dimitri only") (Just 150) Nothing
    , Job 44 "Great Lord" 5 [ Proficiency Sword 3, Proficiency Lance 3, Proficiency Authority 3 ] [] [] Nothing Nothing (Just "Dimitri only") (Just 200) Nothing
    , Job 45 "Wyvern Master" 5 [ Proficiency Bow 3, Proficiency Authority 3, Proficiency Flying 3 ] [] [] Nothing Nothing (Just "Claude only") (Just 150) Nothing
    , Job 46 "Barbarossa" 5 [ Proficiency Bow 3, Proficiency Authority 3, Proficiency Flying 3 ] [] [] Nothing Nothing (Just "Claude only") (Just 200) Nothing
    ]


getJobSkills : List JobSkill
getJobSkills =
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


getStudyById : Int -> Maybe Study
getStudyById val =
    getStudies
        |> List.filter (\e -> e.id == val)
        |> List.head


getStudies : List Study
getStudies =
    [ -- Sword
      Study 0 Sword E
    , Study 1 Sword Eplus
    , Study 2 Sword D
    , Study 3 Sword Dplus
    , Study 4 Sword C
    , Study 5 Sword Cplus
    , Study 6 Sword B
    , Study 7 Sword Bplus
    , Study 8 Sword A
    , Study 9 Sword Aplus
    , Study 10 Sword S
    , Study 11 Sword Splus

    -- Lance
    , Study 12 Lance E
    , Study 13 Lance Eplus
    , Study 14 Lance D
    , Study 15 Lance Dplus
    , Study 16 Lance C
    , Study 17 Lance Cplus
    , Study 18 Lance B
    , Study 19 Lance Bplus
    , Study 20 Lance A
    , Study 21 Lance Aplus
    , Study 22 Lance S
    , Study 23 Lance Splus

    -- Axe
    , Study 24 Axe E
    , Study 25 Axe Eplus
    , Study 26 Axe D
    , Study 27 Axe Dplus
    , Study 28 Axe C
    , Study 29 Axe Cplus
    , Study 30 Axe B
    , Study 31 Axe Bplus
    , Study 32 Axe A
    , Study 33 Axe Aplus
    , Study 34 Axe S
    , Study 35 Axe Splus

    -- Bow
    , Study 36 Bow E
    , Study 37 Bow Eplus
    , Study 38 Bow D
    , Study 39 Bow Dplus
    , Study 40 Bow C
    , Study 41 Bow Cplus
    , Study 42 Bow B
    , Study 43 Bow Bplus
    , Study 44 Bow A
    , Study 45 Bow Aplus
    , Study 46 Bow S
    , Study 47 Bow Splus

    -- Brawl
    , Study 48 Brawling E
    , Study 49 Brawling Eplus
    , Study 50 Brawling D
    , Study 51 Brawling Dplus
    , Study 52 Brawling C
    , Study 53 Brawling Cplus
    , Study 54 Brawling B
    , Study 55 Brawling Bplus
    , Study 56 Brawling A
    , Study 57 Brawling Aplus
    , Study 58 Brawling S
    , Study 59 Brawling Splus

    -- Reason
    , Study 60 Reason E
    , Study 61 Reason Eplus
    , Study 62 Reason D
    , Study 63 Reason Dplus
    , Study 64 Reason C
    , Study 65 Reason Cplus
    , Study 66 Reason B
    , Study 67 Reason Bplus
    , Study 68 Reason A
    , Study 69 Reason Aplus
    , Study 70 Reason S
    , Study 71 Reason Splus

    -- Faith
    , Study 72 Faith E
    , Study 73 Faith Eplus
    , Study 74 Faith D
    , Study 75 Faith Dplus
    , Study 76 Faith C
    , Study 77 Faith Cplus
    , Study 78 Faith B
    , Study 79 Faith Bplus
    , Study 80 Faith A
    , Study 81 Faith Aplus
    , Study 82 Faith S
    , Study 83 Faith Splus

    -- Authority
    , Study 85 Authority E
    , Study 86 Authority Eplus
    , Study 87 Authority D
    , Study 88 Authority Dplus
    , Study 89 Authority C
    , Study 90 Authority Cplus
    , Study 91 Authority B
    , Study 92 Authority Bplus
    , Study 93 Authority A
    , Study 94 Authority Aplus
    , Study 95 Authority S
    , Study 96 Authority Splus

    -- Heavy Armor
    , Study 97 HeavyArmor E
    , Study 98 HeavyArmor Eplus
    , Study 99 HeavyArmor D
    , Study 100 HeavyArmor Dplus
    , Study 101 HeavyArmor C
    , Study 102 HeavyArmor Cplus
    , Study 103 HeavyArmor B
    , Study 104 HeavyArmor Bplus
    , Study 105 HeavyArmor A
    , Study 106 HeavyArmor Aplus
    , Study 107 HeavyArmor S
    , Study 108 HeavyArmor Splus

    -- Riding
    , Study 109 Riding E
    , Study 110 Riding Eplus
    , Study 111 Riding D
    , Study 112 Riding Dplus
    , Study 113 Riding C
    , Study 114 Riding Cplus
    , Study 115 Riding B
    , Study 116 Riding Bplus
    , Study 117 Riding A
    , Study 118 Riding Aplus
    , Study 119 Riding S
    , Study 120 Riding Splus

    -- Flying
    , Study 121 Flying E
    , Study 122 Flying Eplus
    , Study 123 Flying D
    , Study 124 Flying Dplus
    , Study 125 Flying C
    , Study 126 Flying Cplus
    , Study 127 Flying B
    , Study 128 Flying Bplus
    , Study 129 Flying A
    , Study 130 Flying Aplus
    , Study 131 Flying S
    , Study 132 Flying Splus
    ]


getStandardSkills : List StandardSkill
getStandardSkills =
    [ StandardSkill 0 "Coucou" 0 ]
