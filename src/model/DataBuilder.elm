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


getJobCategory : ( List JobCategory, Int ) -> Maybe JobCategory
getJobCategory ( jobCategories, val ) =
    jobCategories
        |> List.filter (\x -> x.id == val)
        |> List.head


getJobs : List Job
getJobs =
    [ -- Starting
      Job 0 "Commoner" 0 [] [] [] Nothing (Just CanUseSomeMagic) Nothing Nothing Nothing
    , Job 1 "Noble" 0 [] [] [] Nothing (Just CanUseSomeMagic) Nothing Nothing Nothing
    , Job 2 "Myrmidon" 1 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 3 "Soldier" 1 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 4 "Fighter" 1 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 5 "Monk" 1 [] [] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Beginner
    , Job 6 "Lord" 2 [] [] [] Nothing Nothing (Just "Edelgard, Dimitri and Claude only") Nothing Nothing
    , Job 7 "Mercenary" 2 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 8 "Thief" 2 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 9 "Cavalier" 2 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 10 "Pegasus Knight" 12 [] [] [] (Just Female) Nothing Nothing Nothing Nothing
    , Job 11 "Brigand" 2 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 12 "Armored Knight" 12 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 13 "Archer" 2 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 14 "Brawler" 2 [] [] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 15 "Mage" 2 [] [] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 16 "Dark Mage" 12 [] [] [] (Just Male) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 17 "Priest" 2 [] [] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Advanced
    , Job 18 "Swordmaster" 3 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 19 "Hero" 3 [] [] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 20 "Assassin" 3 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 21 "Paladin" 3 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 22 "Warrior" 3 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 23 "Fortress Knight" 3 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 24 "Wyvern Rider" 3 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 25 "Sniper" 3 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 26 "Grappler" 3 [] [] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 27 "Warlock" 3 [] [] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 28 "Dark Bishop" 3 [] [] [] (Just Male) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 29 "Bishop" 3 [] [] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Master
    , Job 30 "Mortal Savant" 4 [] [] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 31 "Falcon Knight" 4 [] [] [] (Just Female) Nothing Nothing Nothing Nothing
    , Job 32 "War Master" 4 [] [] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 33 "Wyvern Lord" 4 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 34 "Great Knight" 4 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 35 "Bow Knight" 4 [] [] [] Nothing Nothing Nothing Nothing Nothing
    , Job 36 "Gremory" 4 [] [] [] (Just Female) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 37 "Dark Knight" 4 [] [] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 38 "Holy Knight" 4 [] [] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Unique
    , Job 39 "Dancer" 5 [] [] [] Nothing (Just CanUseMagic) Nothing (Just 100) Nothing
    , Job 40 "Enlightened One" 5 [] [] [] Nothing (Just CanUseMagic) (Just "Byleth only") (Just 100) Nothing
    , Job 41 "Armored Lord" 5 [] [] [] Nothing Nothing (Just "Edelgard only") (Just 150) Nothing
    , Job 42 "Emperor" 5 [] [] [] Nothing Nothing (Just "Edelgard only") (Just 200) Nothing
    , Job 43 "High Lord" 5 [] [] [] Nothing Nothing (Just "Dimitri only") (Just 150) Nothing
    , Job 44 "Great Lord" 5 [] [] [] Nothing Nothing (Just "Dimitri only") (Just 200) Nothing
    , Job 45 "Wyvern Master" 5 [] [] [] Nothing Nothing (Just "Claude only") (Just 150) Nothing
    , Job 46 "Barbarossa" 5 [] [] [] Nothing Nothing (Just "Claude only") (Just 200) Nothing
    ]
