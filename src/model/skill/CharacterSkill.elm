module CharacterSkill exposing (..)

import CustomTypes exposing (..)


getCharacterSkillById : Int -> Maybe CharacterSkill
getCharacterSkillById val =
    initCharacterSkills
        |> List.filter (\e -> e.id == val)
        |> List.head


initCharacterSkills : List CharacterSkill
initCharacterSkills =
    [ CharacterSkill 0 0 "Professor's Guidance" "+20% Experience Gained to user and adjacent ally"
    , CharacterSkill 1 1 "Professor's Guidance+" "+20% Experience Gained to user and adjacent ally, +2 Damage Dealt"
    , CharacterSkill 2 2 "Imperial Lineage" "+20% Experience Gained"
    , CharacterSkill 3 3 "Imperial Lineage+" "+20% Experience Gained, If unit takes no action except Wait, grants Res +4 for 1 turn."
    , CharacterSkill 4 4 "Royal Lineage" "+20% Experience Gained"
    , CharacterSkill 5 5 "Royal Lineage+" "+20% Experience Gained, Grants Avo +20 while unit is at full HP."
    , CharacterSkill 6 6 "Leicester Lineage" "+20% Experience Gained"
    , CharacterSkill 7 7 "Leicester Lineage+" "+20% Experience Gained, grants unit effects of Pass"
    , CharacterSkill 8 8 "Officer Duty" "Boosts Gambit Might by 5."
    , CharacterSkill 9 9 "Songstress" "At the start of each turn, restores adjacent allies’ HP by 10%."
    , CharacterSkill 10 10 "Confidence" "When HP is full, unit gains +15 Hit and Avoid"
    , CharacterSkill 11 10 "Persecution Complex" "When HP is not full, unit gains +5 Damage"
    , CharacterSkill 12 11 "Born Fighter" "Adjacent foes receive Avoid -10 during combat."
    , CharacterSkill 13 12 "Catnap" "If unit waits without performing an action, restores 10% HP."
    , CharacterSkill 14 10 "Hunter's Boon" "When foe has less than 50% HP, Critical rate +20"
    , CharacterSkill 15 13 "Live to Serve" "When healing allies with White Magic, unit is healed by the same amount"
    , CharacterSkill 16 10 "Staunch Shield" "If user waits without acting, Defense +4 for one turn."
    , CharacterSkill 17 10 "Lone Wolf" "When a Battalion is not deployed or when battalion health is zero, damage dealt +5"
    , CharacterSkill 18 14 "Lockpick" "Unit can open locks and chests without keys"
    , CharacterSkill 19 15 "Perseverance" "When Rally command is used on ally, grants Strength +4."
    , CharacterSkill 20 16 "Philanderer" "When adjacent to a female ally, damage dealt to foe +2, damage received from foe -2."
    , CharacterSkill 21 8 "Lady Knight" "When using a Gambit, Might +3 and Hit Rate +5."
    , CharacterSkill 22 17 "Distinguished House" "When a battalion is deployed, damage dealt +2"
    , CharacterSkill 23 18 "Advocate" "When an adjacent male ally enters battle, ally’s damage dealt +3"
    , CharacterSkill 24 12 "Goody Basket" "At the start of a turn, unit has Luck% chance of regaining 10% of HP"
    , CharacterSkill 25 16 "Mastermind" "Unit gains 2x skill EXP from combat"
    , CharacterSkill 26 20 "Watchful Eye" "Hit rate +20."
    , CharacterSkill 27 12 "Animal Friend" "When adjacent to a horseback or flying ally, restores 20% HP at the start of the turn."
    , CharacterSkill 28 15 "Rivalry" "When adjacent to a male ally, damage dealt to foe +2, damage received from foe -2."
    , CharacterSkill 29 12 "Infirmary Master" "Adjacent allies gain Crit Avoid +10 during combat"
    , CharacterSkill 30 21 "Crest Scholar" "Use Rally to grant Mag +4 to an ally"
    , CharacterSkill 31 10 "Fighting Spirit" "Unit takes 5 less damage when no battalion is assigned or when battalion endurance is 0."
    , CharacterSkill 32 22 "Compassion" "Use Rally to grant Lck +8 to an ally."
    , CharacterSkill 33 18 "Guardian" "Adjacent female allies deal 3 extra damage during combat"
    , CharacterSkill 34 18 "Lily's Poise" "Adjacent allies take 3 less damage during combat."
    , CharacterSkill 35 17 "Veteran Knight" "Unit takes 2 less damage while in formation with a battalion."
    , CharacterSkill 36 10 "Survival Instinct" "If unit initiates combat and defeats foe, grants Str/Mag/Dex/Spd +4 for one turn."
    , CharacterSkill 37 23 "Aptitude" "Makes each stat 20% more likely to increase on level up."
    ]
