module JobModal exposing (modalJobPicker)

import Character exposing (getCharacterById)
import CustomTypes exposing (Job)
import Dict exposing (Dict(..))
import ElmUtils exposing (appendMaybeText)
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (Model)
import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class, hidden, style)
import Html.Events exposing (onClick, stopPropagationOn)
import Job exposing (filterJobsAvailable, getJobsByCategory)
import JobCategory exposing (initJobCategories)
import JobSkill exposing (getJobSkillsByJob)
import JobView exposing (getJobTile)
import Json.Decode as Json
import MasterySkill exposing (getMasterySkillsForJob)
import Maybe.Extra exposing (values)
import ModelUtils exposing (jobCategoryIdToString, jobSkillToSkill, jobToDescription, masterySkillToSkill)
import NoDataView exposing (viewNoData)
import SkillView exposing (viewSkill)
import Study exposing (getStudyById)
import StudyView exposing (viewStudy)


modalJobPicker : Model -> Html Msg
modalJobPicker model =
    div
        [ class "modal-j"
        , hidden (not model.view.jobModalIsOpen)
        , onClick (JModalMsg CloseJobModal)
        ]
        [ div
            [ class "modal-content"
            , stopPropagationOn "click" (Json.succeed ( NoOp, True ))
            ]
            [ viewSideBar model
            , viewJobsGrid model
            ]
        ]


viewJobsGrid : Model -> Html Msg
viewJobsGrid model =
    let
        rowDiv =
            case model.view.categorySelected of
                Just categoryId ->
                    viewJobRow model categoryId

                Nothing ->
                    viewJobCategoryRow
    in
    div [ class "jobs-grid" ] rowDiv


viewJobCategoryRow : List (Html Msg)
viewJobCategoryRow =
    [ div [ class "jobs-row" ] (List.map (\jc -> viewJobCategoryTile jc.id) initJobCategories) ]


viewJobCategoryTile : Int -> Html Msg
viewJobCategoryTile id =
    let
        customCss =
            (case id of
                1 ->
                    "beginner"

                2 ->
                    "intermediate"

                3 ->
                    "advanced"

                4 ->
                    "master"

                _ ->
                    "unique"
            )
                ++ "-category"
    in
    div
        [ class "category-tile"
        , onClick (JModalMsg (UpdateCategory id))
        ]
        [ div [ class ("category-picture " ++ customCss) ] [] ]


viewJobRow : Model -> Int -> List (Html Msg)
viewJobRow model categoryId =
    let
        ( buildIdx, job ) =
            model.view.jobPicker

        jobsCategorized id =
            getJobsByCategory id |> List.foldr (::) []

        listJob =
            model.team
                |> Dict.get buildIdx
                |> Maybe.map (\b -> b.idCharacter)
                |> Maybe.andThen (\id -> getCharacterById id)
                |> Maybe.andThen (\c -> Just (filterJobsAvailable c (jobsCategorized categoryId)))
                |> Maybe.withDefault []
    in
    [ div [ class "return-button button", onClick (JModalMsg DeleteCategory) ] []
    , div [ class "jobs-row" ] (listJob |> List.map (\e -> viewJobTile model ( buildIdx, job ) e))
    , div [ class "valid-button button", onClick (JModalMsg (UpdateBuild ( buildIdx, job ))) ] []
    ]


viewJobTile : Model -> ( Int, Job ) -> Job -> Html Msg
viewJobTile model ( buildIdx, _ ) job =
    let
        lockedCss =
            if model.team |> Dict.filter (\k _ -> k == buildIdx) |> Dict.map (\_ v -> v.jobId) |> Dict.values |> List.member job.id then
                "locked-picture"

            else
                ""

        clickedCss =
            if (model.view.jobPicker |> Tuple.second) == job then
                "clicked-picture"

            else
                ""
    in
    div
        [ class ("job-tile " ++ lockedCss ++ " " ++ clickedCss)
        , onClick (JModalMsg (UpdateJobPicker ( buildIdx, job )))
        ]
        [ getJobTile lockedCss job ]


viewSideBar : Model -> Html Msg
viewSideBar model =
    div [ class "sidebar" ]
        [ buttonCloseModal
        , viewJobDetail model
        ]


viewJobDetail : Model -> Html Msg
viewJobDetail model =
    let
        currentJob =
            model.view.jobPicker
                |> Tuple.second

        category =
            jobCategoryIdToString currentJob.jobCategoryId

        description =
            jobToDescription currentJob

        maybeExperience =
            if description.experience /= Nothing then
                description.experience

            else
                description.customExperience

        noteText =
            appendMaybeText description.note Nothing |> appendMaybeText description.magicUsage
    in
    div [ class "job-menu" ]
        [ viewTitleDetail currentJob
        , div [ class "job-description" ] [ p [] [ text "Category" ], p [] [ text category ] ]
        , viewJobSkills currentJob
        , div [ class "job-description" ] [ p [] [ text "Level minimum" ], description.level |> Maybe.map (\l -> p [] [ text ("Available at level " ++ l) ]) |> Maybe.withDefault viewNoData ]
        , div [ class "job-description" ] [ p [] [ text "Note" ], noteText |> Maybe.map (\n -> p [] [ text n ]) |> Maybe.withDefault viewNoData ]
        , div [ class "job-description" ] [ p [] [ text "Gender restriction" ], description.gender |> Maybe.map (\g -> p [] [ text (g ++ " only") ]) |> Maybe.withDefault viewNoData ]
        , viewCertificationRequirement currentJob
        , div [ class "job-description" ] [ p [] [ text "Experience to master" ], maybeExperience |> Maybe.map (\e -> p [] [ text (e ++ " class xp") ]) |> Maybe.withDefault viewNoData ]
        , viewSkillMastery currentJob
        ]


viewTitleDetail : Job -> Html Msg
viewTitleDetail job =
    div [ class "job-title" ]
        [ div
            [ class "title-picture"
            , style "content" ("url(\"resources/img/jobs/" ++ String.fromInt job.idPicture ++ ".gif\")")
            ]
            []
        , div [ class "title-text" ] [ text job.name ]
        ]


viewCertificationRequirement : Job -> Html Msg
viewCertificationRequirement job =
    let
        studyList =
            job.studyIdList
                |> List.map getStudyById
                |> Maybe.Extra.values

        studyListDiv =
            if List.length studyList > 0 then
                List.map viewStudy studyList

            else
                [ div [ class "no-data" ] [] ]
    in
    div [ class "job-description" ] [ p [] [ text "Certificats req." ], div [ class "list-study" ] studyListDiv ]


viewJobSkills : Job -> Html Msg
viewJobSkills job =
    let
        skillList =
            getJobSkillsByJob job.id
                |> List.map (\s -> viewSkill (jobSkillToSkill s))

        skillListDiv =
            if List.length skillList > 0 then
                skillList

            else
                [ div [ class "no-data" ] [] ]
    in
    div [ class "job-description" ] [ p [] [ text "Job skills" ], div [ class "list-jobskill" ] skillListDiv ]


viewSkillMastery : Job -> Html Msg
viewSkillMastery job =
    let
        skillList =
            getMasterySkillsForJob job.id
                |> List.map (\s -> viewSkill (masterySkillToSkill s))

        skillListDiv =
            if List.length skillList > 0 then
                skillList

            else
                [ div [ class "no-data" ] [] ]
    in
    div [ class "job-description" ] [ p [] [ text "Skill learned" ], div [ class "list-jobskill" ] skillListDiv ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick (JModalMsg CloseJobModal)
        , class "close close-button"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
