module Study exposing (getAcademicSkills, getStudyById, initStudies, rankToId, stringToSubject, subjectToId)

import CustomTypes exposing (Rank(..), Study, StudyCapacity(..), Subject(..))
import Dict exposing (Dict)


getStudyById : Int -> Maybe Study
getStudyById val =
    initStudies
        |> List.filter (\e -> e.id == val)
        |> List.head


subjectToString : Subject -> String
subjectToString s =
    case s of
        Sword ->
            "Sword"

        Lance ->
            "Lance"

        Axe ->
            "Axe"

        Bow ->
            "Bow"

        Brawling ->
            "Brawling"

        Reason ->
            "Reason"

        Faith ->
            "Faith"

        Authority ->
            "Authority"

        HeavyArmor ->
            "HeavyArmor"

        Riding ->
            "Riding"

        Flying ->
            "Flying"


stringToSubject : String -> Subject
stringToSubject s =
    case s of
        "Sword" ->
            Sword

        "Lance" ->
            Lance

        "Axe" ->
            Axe

        "Bow" ->
            Bow

        "Brawling" ->
            Brawling

        "Reason" ->
            Reason

        "Faith" ->
            Faith

        "Authority" ->
            Authority

        "HeavyArmor" ->
            HeavyArmor

        "Riding" ->
            Riding

        _ ->
            Flying


subjectToId : Subject -> Int
subjectToId s =
    case s of
        Sword ->
            0

        Lance ->
            1

        Axe ->
            2

        Bow ->
            3

        Brawling ->
            4

        Reason ->
            5

        Faith ->
            6

        Authority ->
            7

        HeavyArmor ->
            8

        Riding ->
            9

        Flying ->
            10


rankToId : Rank -> Int
rankToId rank =
    case rank of
        E ->
            0

        Eplus ->
            1

        D ->
            2

        Dplus ->
            3

        C ->
            4

        Cplus ->
            5

        B ->
            6

        Bplus ->
            7

        A ->
            8

        Aplus ->
            9

        S ->
            10

        Splus ->
            11


initStudies : List Study
initStudies =
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
    , Study 84 Authority E
    , Study 85 Authority Eplus
    , Study 86 Authority D
    , Study 87 Authority Dplus
    , Study 88 Authority C
    , Study 89 Authority Cplus
    , Study 90 Authority B
    , Study 91 Authority Bplus
    , Study 92 Authority A
    , Study 93 Authority Aplus
    , Study 94 Authority S
    , Study 95 Authority Splus

    -- Heavy Armor
    , Study 96 HeavyArmor E
    , Study 97 HeavyArmor Eplus
    , Study 98 HeavyArmor D
    , Study 99 HeavyArmor Dplus
    , Study 100 HeavyArmor C
    , Study 101 HeavyArmor Cplus
    , Study 102 HeavyArmor B
    , Study 103 HeavyArmor Bplus
    , Study 104 HeavyArmor A
    , Study 105 HeavyArmor Aplus
    , Study 106 HeavyArmor S
    , Study 107 HeavyArmor Splus

    -- Riding
    , Study 108 Riding E
    , Study 109 Riding Eplus
    , Study 110 Riding D
    , Study 111 Riding Dplus
    , Study 112 Riding C
    , Study 113 Riding Cplus
    , Study 114 Riding B
    , Study 115 Riding Bplus
    , Study 116 Riding A
    , Study 117 Riding Aplus
    , Study 118 Riding S
    , Study 119 Riding Splus

    -- Flying
    , Study 120 Flying E
    , Study 121 Flying Eplus
    , Study 122 Flying D
    , Study 123 Flying Dplus
    , Study 124 Flying C
    , Study 125 Flying Cplus
    , Study 126 Flying B
    , Study 127 Flying Bplus
    , Study 128 Flying A
    , Study 129 Flying Aplus
    , Study 130 Flying S
    , Study 131 Flying Splus
    ]


defaultAcademicSkills : Dict String StudyCapacity
defaultAcademicSkills =
    Dict.singleton (subjectToString Sword) NoTalent
        |> Dict.insert (subjectToString Lance) NoTalent
        |> Dict.insert (subjectToString Axe) NoTalent
        |> Dict.insert (subjectToString Bow) NoTalent
        |> Dict.insert (subjectToString Brawling) NoTalent
        |> Dict.insert (subjectToString Reason) NoTalent
        |> Dict.insert (subjectToString Faith) NoTalent
        |> Dict.insert (subjectToString Authority) NoTalent
        |> Dict.insert (subjectToString HeavyArmor) NoTalent
        |> Dict.insert (subjectToString Riding) NoTalent
        |> Dict.insert (subjectToString Flying) NoTalent


initAcademicSkillsList : Dict Int (Dict String StudyCapacity)
initAcademicSkillsList =
    Dict.singleton 0 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Brawling, Authority ] |> setupAcademicSkills BuddingTalent [ Faith ])
        |> Dict.insert 1 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Brawling, Authority ] |> setupAcademicSkills BuddingTalent [ Faith ])
        |> Dict.insert 2 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Axe, Authority, HeavyArmor ] |> setupAcademicSkills BuddingTalent [ Reason ] |> setupAcademicSkills Weakness [ Bow, Faith ])
        |> Dict.insert 3 (defaultAcademicSkills |> setupAcademicSkills Strength [ Bow, Reason, Authority ] |> setupAcademicSkills BuddingTalent [ Lance ] |> setupAcademicSkills Weakness [ Axe, Faith, Flying ])
        |> Dict.insert 4 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Lance, Axe, Riding ] |> setupAcademicSkills BuddingTalent [ HeavyArmor ])
        |> Dict.insert 5 (defaultAcademicSkills |> setupAcademicSkills Strength [ Reason, Faith ] |> setupAcademicSkills Weakness [ Axe, Brawling ])
        |> Dict.insert 6 (defaultAcademicSkills |> setupAcademicSkills Strength [ Axe, Brawling ] |> setupAcademicSkills Weakness [ Bow, Reason, Authority ])
        |> Dict.insert 7 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Bow ] |> setupAcademicSkills BuddingTalent [ Riding ] |> setupAcademicSkills Weakness [ Sword, Axe, Brawling, HeavyArmor ])
        |> Dict.insert 8 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Reason ] |> setupAcademicSkills BuddingTalent [ Faith ] |> setupAcademicSkills Weakness [ Riding, Flying ])
        |> Dict.insert 9 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Axe, Bow, Flying ] |> setupAcademicSkills Weakness [ Reason, Faith ])
        |> Dict.insert 10 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Lance, Authority ] |> setupAcademicSkills BuddingTalent [ Riding ] |> setupAcademicSkills Weakness [ Axe, Reason ])
        |> Dict.insert 11 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Axe, Brawling, HeavyArmor ] |> setupAcademicSkills Weakness [ Faith, Riding, Flying ])
        |> Dict.insert 12 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Bow, Brawling ] |> setupAcademicSkills BuddingTalent [ Faith ] |> setupAcademicSkills Weakness [ Authority ])
        |> Dict.insert 13 (defaultAcademicSkills |> setupAcademicSkills Strength [ Axe, Bow ] |> setupAcademicSkills BuddingTalent [ Lance ] |> setupAcademicSkills Weakness [ Reason ])
        |> Dict.insert 14 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Axe, Riding ] |> setupAcademicSkills BuddingTalent [ Reason ] |> setupAcademicSkills Weakness [ Bow ])
        |> Dict.insert 15 (defaultAcademicSkills |> setupAcademicSkills Strength [ Reason, Faith ] |> setupAcademicSkills BuddingTalent [ Bow ] |> setupAcademicSkills Weakness [ Sword, Lance, Axe, HeavyArmor ])
        |> Dict.insert 16 (defaultAcademicSkills |> setupAcademicSkills Strength [ Axe, Reason, Authority ] |> setupAcademicSkills Weakness [ Bow, HeavyArmor ])
        |> Dict.insert 17 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Lance, Riding, Flying ])
        |> Dict.insert 18 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Bow, Authority, Riding, Flying ] |> setupAcademicSkills BuddingTalent [ Axe ] |> setupAcademicSkills Weakness [ Lance, Faith ])
        |> Dict.insert 19 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Reason, Riding ] |> setupAcademicSkills Weakness [ Brawling ])
        |> Dict.insert 20 (defaultAcademicSkills |> setupAcademicSkills Strength [ Axe, Brawling, HeavyArmor ] |> setupAcademicSkills Weakness [ Bow, Reason, Riding ])
        |> Dict.insert 21 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Bow, Authority ] |> setupAcademicSkills BuddingTalent [ Reason ] |> setupAcademicSkills Weakness [ Flying ])
        |> Dict.insert 22 (defaultAcademicSkills |> setupAcademicSkills Strength [ Reason, Faith, Authority ] |> setupAcademicSkills BuddingTalent [ Sword ] |> setupAcademicSkills Weakness [ Lance, Axe, HeavyArmor ])
        |> Dict.insert 23 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Faith, Riding, Flying ] |> setupAcademicSkills BuddingTalent [ Lance ] |> setupAcademicSkills Weakness [ Brawling, HeavyArmor ])
        |> Dict.insert 24 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Axe ] |> setupAcademicSkills BuddingTalent [ HeavyArmor ] |> setupAcademicSkills Weakness [ Faith, Authority ])
        |> Dict.insert 25 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Bow, Riding ])
        |> Dict.insert 26 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Lance, Axe, Authority, Flying ] |> setupAcademicSkills Weakness [ Riding ])
        |> Dict.insert 27 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Faith ] |> setupAcademicSkills BuddingTalent [ Reason ] |> setupAcademicSkills Weakness [ HeavyArmor, Riding ])
        |> Dict.insert 28 (defaultAcademicSkills |> setupAcademicSkills Strength [ Bow, Reason, Riding ] |> setupAcademicSkills Weakness [ HeavyArmor, Flying ])
        |> Dict.insert 29 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Faith, Flying ] |> setupAcademicSkills Weakness [ Reason ])
        |> Dict.insert 30 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Axe, HeavyArmor, Riding ])
        |> Dict.insert 31 (defaultAcademicSkills |> setupAcademicSkills Strength [ Axe, Brawling, HeavyArmor ] |> setupAcademicSkills Weakness [ Reason, Flying ])
        |> Dict.insert 32 (defaultAcademicSkills |> setupAcademicSkills Strength [ Sword, Brawling ] |> setupAcademicSkills Weakness [ Reason ])
        |> Dict.insert 33 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Bow ] |> setupAcademicSkills Weakness [ Faith ])
        |> Dict.insert 34 (defaultAcademicSkills |> setupAcademicSkills Strength [ Lance, Axe, Bow, Riding, Flying ] |> setupAcademicSkills Weakness [ Reason, Faith ])


setupAcademicSkills : StudyCapacity -> List Subject -> Dict String StudyCapacity -> Dict String StudyCapacity
setupAcademicSkills sc list dict =
    Dict.union (list |> List.map (\v -> ( subjectToString v, sc )) |> Dict.fromList) dict


getAcademicSkills : Int -> Dict String StudyCapacity
getAcademicSkills key =
    Dict.get key initAcademicSkillsList |> Maybe.withDefault defaultAcademicSkills
