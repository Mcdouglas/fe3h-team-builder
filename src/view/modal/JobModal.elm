module JobModal exposing (..)

import Character exposing (getCharacterById)
import CustomTypes exposing (..)
import Dict exposing (Dict)
import ElmUtils exposing (..)
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Job exposing (getJobByDefault, getJobsAvailableForCharacter)
import JobSkill exposing (getJobSkillsByJob)
import JobView exposing (getJobTile)
import Json.Decode as Json
import MasterySkill exposing (getMasterySkillsForJob)
import Maybe.Extra exposing (..)
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
            [ viewJobGrid model
            , viewSideBar model
            ]
        ]


viewJobGrid : Model -> Html Msg
viewJobGrid model =
    let
        ( buildIdx, maybeJob ) =
            model.view.jobPicker

        listJob =
            model.team
                |> Dict.get buildIdx
                |> Maybe.andThen (\build -> getCharacterById build.idCharacter)
                |> Maybe.map (\character -> getJobsAvailableForCharacter character)
                |> Maybe.withDefault model.data.jobs
                |> List.map (\j -> ( j.jobCategoryId, j ))
                |> List.foldl (\( i, j ) dict -> Dict.update i (\m -> Just (m |> Maybe.withDefault [] |> (::) j)) dict) Dict.empty
                |> Dict.map (\k v -> viewJobRow model ( buildIdx, maybeJob ) v)
                |> Dict.values
    in
    div [ class "jobs-grid" ] listJob


viewJobRow : Model -> ( Int, Maybe Job ) -> List Job -> Html Msg
viewJobRow model shift listJob =
    let
        customCss =
            if List.length listJob >= 8 then
                "jobs-two-columns"

            else
                ""
    in
    div
        [ class ("jobs-column " ++ customCss)
        ]
        (listJob |> List.map (\e -> viewJobTile model shift e))


viewJobTile : Model -> ( Int, Maybe Job ) -> Job -> Html Msg
viewJobTile model ( buildIdx, _ ) job =
    let
        lockedCss =
            if model.team |> Dict.filter (\k v -> k == buildIdx) |> Dict.map (\k v -> v.jobId) |> Dict.member job.id then
                "locked-picture"

            else
                ""
    in
    div
        [ class ("job-tile " ++ lockedCss)
        , onMouseOver (JModalMsg (UpdateJobPicker ( buildIdx, Just job )))
        , onClick (JModalMsg (UpdateBuild ( buildIdx, job )))
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
                |> Maybe.withDefault getJobByDefault

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
    div []
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
    div [ class "job-description list-study" ] ([ p [] [ text "Certificats req." ] ] ++ studyListDiv)


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
    div [ class "job-description list-jobskill" ] ([ p [] [ text "Job skills" ] ] ++ skillListDiv)


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
    div [ class "job-description list-jobskill" ] ([ p [] [ text "Skill learned" ] ] ++ skillListDiv)


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick (JModalMsg CloseJobModal)
        , class "close close-button"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
