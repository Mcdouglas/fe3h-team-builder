module ModelUtils exposing (characterSkillToSkill, jobCategoryIdToString, jobSkillToSkill, jobToDescription, listSortType, masterySkillToSkill, skillTypeToString, sortTypeToKeyValue, standardSkillToSkill, stringToSortType)

import CustomTypes exposing (CharacterSkill, GenderUnionType(..), Job, JobDescription, JobSkill, MagicUsage(..), MasterySkill, Skill, SkillType(..), SortType(..), StandardSkill)
import JobCategory exposing (getJobCategoryById)


jobToDescription : Job -> JobDescription
jobToDescription job =
    let
        maybeJobCategory =
            getJobCategoryById job.jobCategoryId

        level =
            maybeJobCategory
                |> Maybe.andThen (\e -> e.level)
                |> Maybe.map (\e -> String.fromInt e)

        experience =
            maybeJobCategory
                |> Maybe.andThen (\e -> e.experience)
                |> Maybe.map (\e -> String.fromInt e)

        customExperience =
            job.customExperience
                |> Maybe.map (\e -> String.fromInt e)

        gender =
            job.gender |> Maybe.map (\e -> genderToString e)

        magicUsage =
            job.magicUsage |> Maybe.map (\e -> magicUsageToString e)
    in
    JobDescription level experience customExperience job.note gender magicUsage


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


jobCategoryIdToString : Int -> String
jobCategoryIdToString id =
    case id of
        0 ->
            "Starting"

        1 ->
            "Beginner"

        2 ->
            "Intermediate"

        3 ->
            "Advanced"

        4 ->
            "Master"

        _ ->
            "Unique"


genderToString : GenderUnionType -> String
genderToString gender =
    case gender of
        Male ->
            "Male"

        Female ->
            "Female"


magicUsageToString : MagicUsage -> String
magicUsageToString gender =
    case gender of
        CanUseMagic ->
            "Can use magic"

        CanUseSomeMagic ->
            "Can use some magic"


skillTypeToString : SkillType -> String
skillTypeToString skillType =
    case skillType of
        MasteryType ->
            "MasteryType"

        StandardType ->
            "StandardType"

        JobType ->
            "JobType"

        CharacterType ->
            "CharacterType"

        NoType ->
            "NoType"


listSortType : List SortType
listSortType =
    [ SortByType
    , SortByName
    ]


sortTypeToKeyValue : SortType -> ( String, String )
sortTypeToKeyValue sortType =
    case sortType of
        SortByType ->
            ( "SortByType", "Type" )

        SortByName ->
            ( "SortByName", "Name" )


stringToSortType : String -> SortType
stringToSortType value =
    case value of
        "SortByType" ->
            SortByType

        _ ->
            SortByName
