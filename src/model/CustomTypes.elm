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
    { id : Int, name : String, jobCategoryId : Int, proficiencyList : List Proficiency, studyIdList : List Int, gender : Maybe GenderUnionType, magicUsage : Maybe MagicUsage, note : Maybe String, customExperience : Maybe Int }


type alias JobSkill =
    { id : Int, name : String, jobIdList : List Int, combatArt : Bool, description : String }


type alias MasterySkill =
    { id : Int, name : String, jobIdList : List Int, combatArt : Bool, description : String }


type alias StandardSkill =
    { id : Int, name : String, studyId : Int, combatArt : Bool, charactersOnly : List Int, allExcept : Bool, description : String }


type alias CharacterSkill =
    { id : Int, pictureId : Int, name : String, description : String }


type alias Character =
    { id : Int, name : String, gender : GenderUnionType, characterSkillId : Int }


type alias CharacterBuild =
    { idCharacter : Int, listMasterySkillId : List Int, listStandardSkillId : List Int, jobId : Int, hiddenInfo : Bool }


type alias Skill =
    { id : Int, name : String, description : String, combatArt : Bool }


type alias TeamBuilder =
    { builds : List CharacterBuild, link : String }
