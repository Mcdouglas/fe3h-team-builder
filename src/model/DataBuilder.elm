module DataBuilder exposing (..)

import CustomTypes exposing (..)


type Msg
    = InitStaticData


getJobCategories : List JobCategory
getJobCategories =
    [ JobCategory 0 Starting 20 0
    , JobCategory 1 Beginner 60 5
    , JobCategory 2 Intermediate 100 10
    , JobCategory 3 Advanced 150 20
    , JobCategory 4 Master 200 30
    , JobCategory 5 Unique 0 0
    ]


getJobs : List Job
getJobs =
    [ Job 0 "Commoner" 0 [] [] [] None (Just "Can use some magic")
    , Job 1 "Noble" 0 [] [] [] None (Just "Can use some magic")
    , Job 2 "Myrmidon" 1 [] [] [] None Nothing
    , Job 3 "Soldier" 1 [] [] [] None Nothing
    , Job 4 "Fighter" 1 [] [] [] None Nothing
    , Job 5 "Monk" 1 [] [] [] None Nothing
    , Job 6 "Lord" 2 [] [] [] None "Edelgard, Dimitri and Claude only"
    , Job 7 "Mercenary" 2 [] [] [] None
    , Job 8 "Thief" 2 [] [] [] None
    , Job 9 "Cavalier" 2 [] [] [] None
    , Job 10 "Pegasus Knight"12 [] [] [] None
    , Job 11 "Brigand" 2 [] [] [] None
    , Job 12 "Armored Knight"12 [] [] [] None
    , Job 13 "Archer" 2 [] [] [] None
    , Job 14 "Brawler" 2 [] [] [] None
    , Job 15 "Mage" 2 [] [] [] None
    , Job 16 "Dark Mage"12 [] [] [] None
    , Job 17 "Priest" 2 [] [] [] None
    , Job 18 "Swordmaster" 3 [] [] [] None
    , Job 19 "Hero" 3 [] [] [] None
    , Job 20 "Assassin" 3 [] [] [] None
    , Job 21 "Paladin" 3 [] [] [] None
    , Job 22 "Warrior" 3 [] [] [] None
    , Job 23 "Fortress Knight" 3 [] [] [] None
    , Job 24 "Wyvern Rider" 3 [] [] [] None
    , Job 25 "Sniper" 3 [] [] [] None
    , Job 26 "Grappler" 3 [] [] [] None
    , Job 27 "Warlock" 3 [] [] [] None
    , Job 28 "Dark Bishop" 3 [] [] [] None
    , Job 29 "Bishop" 3 [] [] [] None
    , Job 30 "Mortal Savant" 4 [] [] [] None (Just "Can use magic")
    , Job 31 "Falcon Knight" 4 [] [] [] None
    , Job 32 "War Master" 4 [] [] [] None
    , Job 33 "Wyvern Lord" 4 [] [] [] None
    , Job 34 "Great Knight" 4 [] [] [] None
    , Job 35 "Bow Knight" 4 [] [] [] None
    , Job 36 "Gremory" 4 [] [] [] None
    , Job 37 "Dark Knight" 4 [] [] [] None
    , Job 38 "Holy Knight" 4 [] [] [] None
    ]
