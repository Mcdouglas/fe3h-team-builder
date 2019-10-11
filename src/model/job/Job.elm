module Job exposing (..)

import CustomTypes exposing (..)


getJobById : Int -> Maybe Job
getJobById val =
    initJobs
        |> List.filter (\x -> x.id == val)
        |> List.head


initJobs : List Job
initJobs =
    [ -- Starting
      Job 0 "Commoner" 0 [] [] Nothing (Just CanUseSomeMagic) Nothing Nothing Nothing
    , Job 1 "Noble" 0 [] [] Nothing (Just CanUseSomeMagic) Nothing Nothing Nothing

    -- Beginner
    , Job 2 "Myrmidon" 1 [ Proficiency Sword 1 ] [ 2 ] Nothing Nothing Nothing Nothing Nothing
    , Job 3 "Soldier" 1 [ Proficiency Lance 1 ] [ 14 ] Nothing Nothing Nothing Nothing Nothing
    , Job 4 "Fighter" 1 [ Proficiency Axe 1, Proficiency Bow 1, Proficiency Brawling 1 ] [ 26, 38, 50 ] Nothing Nothing Nothing Nothing Nothing
    , Job 5 "Monk" 1 [ Proficiency Reason 1, Proficiency Faith 1 ] [ 62, 74 ] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Intermediate
    , Job 6 "Lord" 2 [ Proficiency Sword 2, Proficiency Lance 1, Proficiency Authority 2 ] [ 3, 89 ] Nothing Nothing (Just "Edelgard, Dimitri and Claude only") Nothing Nothing
    , Job 7 "Mercenary" 2 [ Proficiency Sword 2, Proficiency Axe 1 ] [ 4 ] Nothing Nothing Nothing Nothing Nothing
    , Job 8 "Thief" 2 [ Proficiency Sword 2, Proficiency Bow 1 ] [ 4 ] Nothing Nothing Nothing Nothing Nothing
    , Job 9 "Cavalier" 2 [ Proficiency Sword 1, Proficiency Lance 2, Proficiency Riding 2 ] [ 16, 111 ] Nothing Nothing Nothing Nothing Nothing
    , Job 10 "Pegasus Knight" 12 [ Proficiency Sword 1, Proficiency Lance 2, Proficiency Flying 2 ] [ 16, 123 ] (Just Female) Nothing Nothing Nothing Nothing
    , Job 11 "Brigand" 2 [ Proficiency Axe 2, Proficiency Brawling 1 ] [ 28 ] Nothing Nothing Nothing Nothing Nothing
    , Job 12 "Armored Knight" 12 [ Proficiency Lance 1, Proficiency Axe 2, Proficiency HeavyArmor 1 ] [ 28, 99 ] Nothing Nothing Nothing Nothing Nothing
    , Job 13 "Archer" 2 [ Proficiency Sword 1, Proficiency Bow 2 ] [ 40 ] Nothing Nothing Nothing Nothing Nothing
    , Job 14 "Brawler" 2 [ Proficiency Axe 1, Proficiency Brawling 1 ] [ 52 ] (Just Male) Nothing Nothing Nothing Nothing
    , Job 15 "Mage" 2 [ Proficiency Reason 2, Proficiency Faith 1 ] [ 64 ] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 16 "Dark Mage" 12 [ Proficiency Reason 2, Proficiency Faith 1 ] [ 64 ] (Just Male) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 17 "Priest" 2 [ Proficiency Reason 1, Proficiency Faith 2 ] [ 76 ] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Advanced
    , Job 18 "Swordmaster" 3 [ Proficiency Sword 3 ] [ 8 ] Nothing Nothing Nothing Nothing Nothing
    , Job 19 "Hero" 3 [ Proficiency Sword 3, Proficiency Axe 2 ] [ 6, 28 ] (Just Male) Nothing Nothing Nothing Nothing
    , Job 20 "Assassin" 3 [ Proficiency Sword 2, Proficiency Bow 2 ] [ 6, 40 ] Nothing Nothing Nothing Nothing Nothing
    , Job 21 "Paladin" 3 [ Proficiency Sword 2, Proficiency Lance 3, Proficiency Riding 3 ] [ 18, 115 ] Nothing Nothing Nothing Nothing Nothing
    , Job 22 "Warrior" 3 [ Proficiency Axe 3 ] [ 32 ] Nothing Nothing Nothing Nothing Nothing
    , Job 23 "Fortress Knight" 3 [ Proficiency Lance 2, Proficiency Axe 3, Proficiency HeavyArmor 3 ] [ 30, 103 ] Nothing Nothing Nothing Nothing Nothing
    , Job 24 "Wyvern Rider" 3 [ Proficiency Lance 2, Proficiency Axe 3, Proficiency Flying 2 ] [ 30, 125 ] Nothing Nothing Nothing Nothing Nothing
    , Job 25 "Sniper" 3 [ Proficiency Bow 3 ] [ 44 ] Nothing Nothing Nothing Nothing Nothing
    , Job 26 "Grappler" 3 [ Proficiency Brawling 3 ] [ 56 ] (Just Male) Nothing Nothing Nothing Nothing
    , Job 27 "Warlock" 3 [ Proficiency Reason 3, Proficiency Faith 2 ] [ 68 ] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 28 "Dark Bishop" 3 [ Proficiency Reason 3, Proficiency Faith 2 ] [ 68 ] (Just Male) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 29 "Bishop" 3 [ Proficiency Reason 2, Proficiency Faith 3 ] [ 80 ] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Master
    , Job 30 "Mortal Savant" 4 [ Proficiency Sword 3, Proficiency Reason 3 ] [ 8, 67 ] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 31 "Falcon Knight" 4 [ Proficiency Sword 3, Proficiency Lance 3, Proficiency Flying 3 ] [ 4, 20, 128 ] (Just Female) Nothing Nothing Nothing Nothing
    , Job 32 "War Master" 4 [ Proficiency Axe 3, Proficiency Brawling 3 ] [ 32, 54 ] (Just Male) Nothing Nothing Nothing Nothing
    , Job 33 "Wyvern Lord" 4 [ Proficiency Lance 3, Proficiency Axe 3, Proficiency Flying 3 ] [ 16, 32, 129 ] Nothing Nothing Nothing Nothing Nothing
    , Job 34 "Great Knight" 4 [ Proficiency Lance 3, Proficiency Axe 3, Proficiency HeavyArmor 3 ] [ 31, 105, 116 ] Nothing Nothing Nothing Nothing Nothing
    , Job 35 "Bow Knight" 4 [ Proficiency Lance 3, Proficiency Bow 3, Proficiency Riding 3 ] [ 16, 44, 117 ] Nothing Nothing Nothing Nothing Nothing
    , Job 36 "Gremory" 4 [ Proficiency Reason 3, Proficiency Faith 3 ] [ 68, 80 ] (Just Female) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 37 "Dark Knight" 4 [ Proficiency Lance 3, Proficiency Reason 3, Proficiency Riding 3 ] [ 16, 67, 117 ] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 38 "Holy Knight" 4 [ Proficiency Lance 3, Proficiency Faith 3, Proficiency Riding 3 ] [ 16, 79, 117 ] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Unique
    , Job 39 "Dancer" 5 [ Proficiency Sword 2, Proficiency Authority 3 ] [] Nothing (Just CanUseMagic) Nothing (Just 100) Nothing
    , Job 40 "Enlightened One" 5 [ Proficiency Sword 3, Proficiency Brawling 2, Proficiency Faith 3, Proficiency Authority 3 ] [] Nothing (Just CanUseMagic) (Just "Byleth only") (Just 100) Nothing
    , Job 41 "Armored Lord" 5 [ Proficiency Axe 3, Proficiency Authority 3, Proficiency HeavyArmor 3 ] [] Nothing Nothing (Just "Edelgard only") (Just 150) Nothing
    , Job 42 "Emperor" 5 [ Proficiency Axe 3, Proficiency Authority 3, Proficiency HeavyArmor 3 ] [] Nothing Nothing (Just "Edelgard only") (Just 200) Nothing
    , Job 43 "High Lord" 5 [ Proficiency Sword 3, Proficiency Lance 3, Proficiency Authority 3 ] [] Nothing Nothing (Just "Dimitri only") (Just 150) Nothing
    , Job 44 "Great Lord" 5 [ Proficiency Sword 3, Proficiency Lance 3, Proficiency Authority 3 ] [] Nothing Nothing (Just "Dimitri only") (Just 200) Nothing
    , Job 45 "Wyvern Master" 5 [ Proficiency Bow 3, Proficiency Authority 3, Proficiency Flying 3 ] [] Nothing Nothing (Just "Claude only") (Just 150) Nothing
    , Job 46 "Barbarossa" 5 [ Proficiency Bow 3, Proficiency Authority 3, Proficiency Flying 3 ] [] Nothing Nothing (Just "Claude only") (Just 200) Nothing
    ]
