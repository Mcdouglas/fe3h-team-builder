module CustomTypes exposing (..)


type Subject
    = Sword
    | Lance
    | Axe
    | Bow
    | Brawling
    | Reason
    | Faith
    | Authority
    | HeavyArmor
    | Riding
    | Flying


type Rank
    = E
    | Eplus
    | D
    | Dplus
    | C
    | Cplus
    | B
    | Bplus
    | A
    | Aplus
    | S
    | Splus


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


type CategoryUnionType
    = Starting
    | Beginner
    | Intermediate
    | Advanced
    | Master
    | Unique


type GenderUnionType
    = Male
    | Female


genderToString : GenderUnionType -> String
genderToString gender =
    case gender of
        Male ->
            "Male"

        Female ->
            "Female"


type MagicUsage
    = CanUseMagic
    | CanUseSomeMagic


magicUsageToString : MagicUsage -> String
magicUsageToString gender =
    case gender of
        CanUseMagic ->
            "Can use magic"

        CanUseSomeMagic ->
            "Can use some magic"


type alias Study =
    { id : Int
    , pictureId : Int
    , subject : Subject
    , rank : Rank
    }


type alias Proficiency =
    { subject : Subject
    , bonus : Int
    }


type alias JobCategory =
    { id : Int
    , category : CategoryUnionType
    , experience : Maybe Int
    , level : Maybe Int
    }


type alias Job =
    { id : Int
    , idPicture : Int
    , name : String
    , jobCategoryId : Int
    , proficiencyList : List Proficiency
    , studyIdList : List Int
    , gender : Maybe GenderUnionType
    , magicUsage : Maybe MagicUsage
    , note : Maybe String
    , customExperience : Maybe Int
    }


type CrestHolder
    = Major
    | Minor
    | NonOwner


type alias Crest =
    { id : Int
    , pictureId : Int
    , name : String
    , description : String
    }


type alias Character =
    { id : Int
    , name : String
    , gender : GenderUnionType
    , characterSkillId : Int
    , holderType : CrestHolder
    , crestId : Int
    , bannerId : Maybe Int
    }


type SkillType
    = MasteryType
    | StandardType
    | JobType
    | CharacterType
    | NoType


type alias Build =
    { idCharacter : Int
    , listPassiveSkill : List ( Int, Int, SkillType )
    , listActiveSkill : List ( Int, Int, SkillType )
    , jobId : Int
    , hiddenInfo : Bool
    }


type alias Skill =
    { id : Int
    , skillType : SkillType
    , combatArt : Bool
    , learnByJob : Bool
    , name : String
    , description : String
    , pictureId : Int
    , studyId : Maybe Int
    , jobIdList : List Int
    , charactersOnly : List Int
    , allExcept : Bool
    , durabilityCost : Maybe Int
    , might : Maybe Int
    , hit : Maybe Int
    , avoid : Maybe Int
    , criticalRate : Maybe Int
    , range : Maybe ( Int, Int )
    }


type alias JobSkill =
    { id : Int
    , pictureId : Int
    , name : String
    , jobIdList : List Int
    , combatArt : Bool
    , description : String
    , durabilityCost : Maybe Int
    , might : Maybe Int
    , hit : Maybe Int
    , avoid : Maybe Int
    , criticalRate : Maybe Int
    , range : Maybe ( Int, Int )
    }


type alias MasterySkill =
    { id : Int
    , pictureId : Int
    , name : String
    , jobIdList : List Int
    , combatArt : Bool
    , description : String
    , durabilityCost : Maybe Int
    , might : Maybe Int
    , hit : Maybe Int
    , avoid : Maybe Int
    , criticalRate : Maybe Int
    , range : Maybe ( Int, Int )
    }


type alias StandardSkill =
    { id : Int
    , pictureId : Int
    , name : String
    , studyId : Int
    , combatArt : Bool
    , charactersOnly : List Int
    , allExcept : Bool
    , description : String
    , durabilityCost : Maybe Int
    , might : Maybe Int
    , hit : Maybe Int
    , avoid : Maybe Int
    , criticalRate : Maybe Int
    , range : Maybe ( Int, Int )
    }


type alias CharacterSkill =
    { id : Int
    , pictureId : Int
    , name : String
    , description : String
    }


masterySkillToSkill : MasterySkill -> Skill
masterySkillToSkill m =
    Skill m.id MasteryType m.combatArt True m.name m.description m.pictureId Nothing m.jobIdList [] False m.durabilityCost m.might m.hit m.avoid m.criticalRate m.range


standardSkillToSkill : StandardSkill -> Skill
standardSkillToSkill s =
    Skill s.id StandardType s.combatArt False s.name s.description s.pictureId (Just s.studyId) [] s.charactersOnly s.allExcept s.durabilityCost s.might s.hit s.avoid s.criticalRate s.range


jobSkillToSkill : JobSkill -> Skill
jobSkillToSkill j =
    Skill j.id JobType j.combatArt False j.name j.description j.pictureId Nothing j.jobIdList [] False j.durabilityCost j.might j.hit j.avoid j.criticalRate j.range


characterSkillToSkill : CharacterSkill -> Skill
characterSkillToSkill c =
    Skill c.id CharacterType False False c.name c.description c.pictureId Nothing [] [] False Nothing Nothing Nothing Nothing Nothing Nothing
