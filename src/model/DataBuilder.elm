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
      -- { id : Int, name : String, jobCategoryId : Int, proficiencyList : List Int,
      -- certificationList : List Int, masteryIdList : List Int, gender : Maybe GenderUnionType,
      -- magicUsage : Maybe MagicUsage, note : Maybe String, customExperience : Maybe Int, customLevel : Maybe Int }
      Job 0 "Commoner" 0 [] [] [] Nothing (Just CanUseSomeMagic) Nothing Nothing Nothing
    , Job 1 "Noble" 0 [] [] [] Nothing (Just CanUseSomeMagic) Nothing Nothing Nothing

    -- Beginner
    , Job 2 "Myrmidon" 1 [ Proficiency Sword 1 ] [ Study Sword D ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 3 "Soldier" 1 [ Proficiency Lance 1 ] [ Study Lance D ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 4 "Fighter" 1 [ Proficiency Axe 1, Proficiency Bow 1, Proficiency Brawling 1 ] [ Study Axe D, Study Bow D, Study Brawling D ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 5 "Monk" 1 [ Proficiency Reason 1, Proficiency Faith 1 ] [ Study Reason D, Study Faith D ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Intermediate
    , Job 6 "Lord" 2 [ Proficiency Sword 2, Proficiency Lance 1, Proficiency Authority 2 ] [ Study Sword Dplus, Study Authority C ] [] Nothing Nothing (Just "Edelgard, Dimitri and Claude only") Nothing Nothing
    , Job 7 "Mercenary" 2 [ Proficiency Sword 2, Proficiency Axe 1 ] [ Study Sword C ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 8 "Thief" 2 [ Proficiency Sword 2, Proficiency Bow 1 ] [ Study Sword C ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 9 "Cavalier" 2 [ Proficiency Sword 1, Proficiency Lance 2, Proficiency Riding 2 ] [ Study Lance C, Study Riding D ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 10 "Pegasus Knight" 12 [ Proficiency Sword 1, Proficiency Lance 2, Proficiency Flying 2 ] [ Study Lance C, Study Flying D ] [] (Just Female) Nothing Nothing Nothing Nothing
    , Job 11 "Brigand" 2 [ Proficiency Axe 2, Proficiency Brawling 1 ] [ Study Axe C ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 12 "Armored Knight" 12 [ Proficiency Lance 1, Proficiency Axe 2, Proficiency HeavyArmor 1 ] [ Study Axe C, Study HeavyArmor D ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 13 "Archer" 2 [ Proficiency Sword 1, Proficiency Bow 2 ] [ Study Bow C ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 14 "Brawler" 2 [ Proficiency Axe 1, Proficiency Brawling 1 ] [ Study Brawling C ] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 15 "Mage" 2 [ Proficiency Reason 2, Proficiency Faith 1 ] [ Study Reason C ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 16 "Dark Mage" 12 [ Proficiency Reason 2, Proficiency Faith 1 ] [ Study Reason C ] [] (Just Male) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 17 "Priest" 2 [ Proficiency Reason 1, Proficiency Faith 2 ] [ Study Faith C ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Advanced
    , Job 18 "Swordmaster" 3 [ Proficiency Sword 3 ] [ Study Sword A ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 19 "Hero" 3 [ Proficiency Sword 3, Proficiency Axe 2 ] [ Study Sword B, Study Axe C ] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 20 "Assassin" 3 [ Proficiency Sword 2, Proficiency Bow 2 ] [ Study Sword B, Study Bow C ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 21 "Paladin" 3 [ Proficiency Sword 2, Proficiency Lance 3, Proficiency Riding 3 ] [ Study Lance B, Study Riding B ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 22 "Warrior" 3 [ Proficiency Axe 3 ] [ Study Axe A ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 23 "Fortress Knight" 3 [ Proficiency Lance 2, Proficiency Axe 3, Proficiency HeavyArmor 3 ] [ Study Axe B, Study HeavyArmor B ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 24 "Wyvern Rider" 3 [ Proficiency Lance 2, Proficiency Axe 3, Proficiency Flying 2 ] [ Study Axe B, Study Flying C ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 25 "Sniper" 3 [ Proficiency Bow 3 ] [ Study Bow A ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 26 "Grappler" 3 [ Proficiency Brawling 3 ] [ Study Brawling A ] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 27 "Warlock" 3 [ Proficiency Reason 3, Proficiency Faith 2 ] [ Study Reason A ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 28 "Dark Bishop" 3 [ Proficiency Reason 3, Proficiency Faith 2 ] [ Study Reason A ] [] (Just Male) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 29 "Bishop" 3 [ Proficiency Reason 2, Proficiency Faith 3 ] [ Study Faith A ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

    -- Master
    , Job 30 "Mortal Savant" 4 [ Proficiency Sword 3, Proficiency Reason 3 ] [ Study Sword A, Study Reason Bplus ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 31 "Falcon Knight" 4 [ Proficiency Sword 3, Proficiency Lance 3, Proficiency Flying 3 ] [ Study Sword C, Study Lance A, Study Flying Bplus ] [] (Just Female) Nothing Nothing Nothing Nothing
    , Job 32 "War Master" 4 [ Proficiency Axe 3, Proficiency Brawling 3 ] [ Study Axe A, Study Brawling B ] [] (Just Male) Nothing Nothing Nothing Nothing
    , Job 33 "Wyvern Lord" 4 [ Proficiency Lance 3, Proficiency Axe 3, Proficiency Flying 3 ] [ Study Lance C, Study Axe A, Study Flying A ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 34 "Great Knight" 4 [ Proficiency Lance 3, Proficiency Axe 3, Proficiency HeavyArmor 3 ] [ Study Axe Bplus, Study HeavyArmor A, Study Riding Bplus ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 35 "Bow Knight" 4 [ Proficiency Lance 3, Proficiency Bow 3, Proficiency Riding 3 ] [ Study Lance C, Study Bow A, Study Riding A ] [] Nothing Nothing Nothing Nothing Nothing
    , Job 36 "Gremory" 4 [ Proficiency Reason 3, Proficiency Faith 3 ] [ Study Reason A, Study Faith A ] [] (Just Female) (Just CanUseMagic) Nothing Nothing Nothing
    , Job 37 "Dark Knight" 4 [ Proficiency Lance 3, Proficiency Reason 3, Proficiency Riding 3 ] [ Study Lance C, Study Reason Bplus, Study Riding A ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing
    , Job 38 "Holy Knight" 4 [ Proficiency Lance 3, Proficiency Faith 3, Proficiency Riding 3 ] [ Study Lance C, Study Faith Bplus, Study Riding A ] [] Nothing (Just CanUseMagic) Nothing Nothing Nothing

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
