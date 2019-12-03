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


type MagicUsage
    = CanUseMagic
    | CanUseSomeMagic


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
    , onlyCharacters : List Int
    , canFly : Bool
    }


type alias JobDescription =
    { level : Maybe String
    , experience : Maybe String
    , customExperience : Maybe String
    , note : Maybe String
    , gender : Maybe String
    , magicUsage : Maybe String
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


type SortType
    = SortByType
    | SortByName