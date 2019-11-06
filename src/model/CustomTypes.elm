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
    { id : Int, subject : Subject, rank : Rank }


type alias Proficiency =
    { subject : Subject, bonus : Int }


type alias JobCategory =
    { id : Int, category : CategoryUnionType, experience : Maybe Int, level : Maybe Int }


type alias Job =
    { id : Int, idPicture : Int, name : String, jobCategoryId : Int, proficiencyList : List Proficiency, studyIdList : List Int, gender : Maybe GenderUnionType, magicUsage : Maybe MagicUsage, note : Maybe String, customExperience : Maybe Int }


type alias JobSkill =
    { id : Int, pictureId : Int, name : String, jobIdList : List Int, combatArt : Bool, description : String }


type alias MasterySkill =
    { id : Int, pictureId : Int, name : String, jobIdList : List Int, combatArt : Bool, description : String }


type alias StandardSkill =
    { id : Int, pictureId : Int, name : String, studyId : Int, combatArt : Bool, charactersOnly : List Int, allExcept : Bool, description : String }


type alias CharacterSkill =
    { id : Int, pictureId : Int, name : String, description : String }


type CrestHolder
    = Major
    | Minor
    | NonOwner


type alias Crest =
    { id : Int, pictureId : Int, name : String, description : String }


type alias Character =
    { id : Int, name : String, gender : GenderUnionType, characterSkillId : Int, holderType : CrestHolder, crestId : Int, bannerId : Maybe Int }


type SkillType
    = Mastery
    | Standard
    | None


type alias Build =
    { idCharacter : Int, listPassiveSkill : List ( Int, Int, SkillType ), listActiveSkill : List ( Int, Int, SkillType ), jobId : Int, hiddenInfo : Bool }


type alias Skill =
    { id : Int, pictureId : Int, name : String, description : String, combatArt : Bool, skillT : SkillType, byJob : Bool }
