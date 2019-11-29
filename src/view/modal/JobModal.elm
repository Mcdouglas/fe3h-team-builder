module JobModal exposing (..)

import Character exposing (getCharacterById)
import CustomTypes exposing (..)
import ElmUtils exposing (..)
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Job exposing (getJobByDefault, getJobsAvailableForCharacter)
import JobSkill exposing (getJobSkillsByJob)
import JobView exposing (getJobTile)
import MasterySkill exposing (getMasterySkillsForJob)
import Maybe.Extra exposing (..)
import ModelUtils exposing (jobSkillToSkill, jobToDescription, masterySkillToSkill)
import NoDataView exposing (viewNoData)
import SkillView exposing (viewSkill)
import Study exposing (getStudyById)
import StudyView exposing (viewStudy)


modalJobPicker : Model -> Html Msg
modalJobPicker model =
    div
        [ class "modal-j"
        , hidden (not model.view.jobModalIsOpen)
        ]
        [ div
            [ class "modal-content" ]
            [ viewJobGrid model
            , viewSideBar model
            ]
        ]


viewJobGrid : Model -> Html Msg
viewJobGrid model =
    let
        ( buildIdx, _ ) =
            model.view.jobPicker

        listJob =
            model.team
                |> List.filter (\( idx, build ) -> idx == buildIdx)
                |> List.head
                |> Maybe.map (\( idx, build ) -> build.idCharacter)
                |> Maybe.andThen (\id -> getCharacterById id)
                |> Maybe.map (\character -> getJobsAvailableForCharacter character)
                |> Maybe.withDefault model.data.jobs
    in
    div [ class "jobs-grid" ] (List.map (\e -> viewJobTile model e) listJob)


viewJobTile : Model -> Job -> Html Msg
viewJobTile model job =
    let
        ( buildIdx, _ ) =
            model.view.jobPicker
    in
    div
        [ class "job-tile"
        , onMouseOver (JModalMsg (UpdateJobPicker ( buildIdx, Just job )))
        , onClick (JModalMsg (UpdateBuild ( buildIdx, job )))
        ]
        [ getJobTile job.idPicture ]


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
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
