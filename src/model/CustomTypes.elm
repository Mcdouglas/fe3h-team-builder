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


getJobCategory : ( List JobCategory, Int ) -> Maybe JobCategory
getJobCategory ( jobCategories, val ) =
    jobCategories
        |> List.filter (\x -> x.id == val)
        |> List.head


type alias Job =
    { id : Int, name : String, jobCategoryId : Int, proficiencyList : List Proficiency, studyIdList : List Int, masteryIdList : List Int, gender : Maybe GenderUnionType, magicUsage : Maybe MagicUsage, note : Maybe String, customExperience : Maybe Int, customLevel : Maybe Int }


getJob : ( List Job, Int ) -> Maybe Job
getJob ( jobs, val ) =
    jobs
        |> List.filter (\x -> x.id == val)
        |> List.head


type alias JobSkill =
    { id : Int, name : String }


getJobByJobSkillId : ( List Job, Int ) -> Maybe Job
getJobByJobSkillId ( jobs, val ) =
    jobs
        |> List.filter (\x -> List.member val x.masteryIdList)
        |> List.head


type alias StandardSkill =
    { id : Int, name : String, studyId : Int }


type alias JobSKill =
    { id : Int, name : String }


type alias MasteringSkill =
    { id : Int, name : String }


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
