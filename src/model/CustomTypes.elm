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
    { id : Int, subject : Subject, rank : Rank }


type alias Proficiency =
    { subject : Subject, bonus : Int }


type alias JobCategory =
    { id : Int, category : CategoryUnionType, experience : Maybe Int, level : Maybe Int }


type alias Job =
    { id : Int, name : String, jobCategoryId : Int, proficiencyList : List Proficiency, studyIdList : List Int, gender : Maybe GenderUnionType, magicUsage : Maybe MagicUsage, note : Maybe String, customExperience : Maybe Int, customLevel : Maybe Int }


type alias JobSkill =
    { id : Int, name : String, combatArt : Bool }


type alias MasterySkill =
    { id : Int, name : String, jobIdList : List Int, combatArt : Bool }


type alias StandardSkill =
    { id : Int, name : String, studyId : Int, combatArt : Bool }


type alias Character =
    { id : Int, name : String }


type alias CharacterBuild =
    { idCharacter : Int, listJobSkillId : List Int, listMasterySkillId : List Int, listStandardSkillId : List Int }


type alias TeamBuilder =
    { builds : List CharacterBuild, link : String }
