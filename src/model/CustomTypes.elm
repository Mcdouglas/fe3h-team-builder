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
    | None


type alias Study =
    { id : Int, subject : Subject, rank : Rank }


type alias Proficiency =
    { id : Int, subject : Subject, bonus : Int }


type alias JobCategory =
    { id : Int, category : CategoryUnionType, experience : Int, level : Int }


type alias Job =
    { id : Int, name : String, jobCategoryId : Int, proficiencyIdList : List Int, certificationIdList : List Int, masteryIdList : List Int, gender : GenderUnionType, note : String }


type alias JobSkill =
    { id : Int, name : String, learningJob : Job }


type alias StudySkill =
    { id : Int, name : String, study : Study }


type alias PassiveSkill =
    { id : Int }


type alias ActiveSkill =
    { id : Int }


type alias Character =
    { id : Int, name : String }


type alias CharacterBuild =
    { idCharacter : Int, listPassiveSkill : List PassiveSkill, listActiveSkill : List ActiveSkill }


type alias TeamBuilder =
    { builds : List CharacterBuild, link : String }
