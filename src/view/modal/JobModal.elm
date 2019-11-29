module JobModal exposing (..)

import Character exposing (getCharacterById)
import CustomTypes exposing (..)
import ElmUtils exposing (..)
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Job exposing (getJobsAvailableForCharacter)
import JobSkill exposing (getJobSkillsByJob)
import JobView exposing (getJobPicture)
import Maybe.Extra exposing (..)
import ModelUtils exposing (jobSkillToSkill, jobToDescription)
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
        [ getJobPicture job.idPicture
        , text job.name
        ]


viewSideBar : Model -> Html Msg
viewSideBar model =
    div [ class "sidebar" ]
        [ buttonCloseModal
        , viewJobDetail model
        ]


viewJobDetail : Model -> Html Msg
viewJobDetail model =
    let
        ( _, maybeJob ) =
            model.view.jobPicker
    in
    case maybeJob of
        Just currentJob ->
            div []
                [ viewTitleDetail currentJob
                , viewJobDescription currentJob
                , viewCertificationRequirement currentJob
                , viewSkillMastery currentJob
                ]

        Nothing ->
            div [] [ text "No data" ]


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


viewJobDescription : Job -> Html Msg
viewJobDescription job =
    let
        description =
            jobToDescription job

        maybeExperience =
            if description.experience /= Nothing then
                description.experience

            else
                description.customExperience

        noteText =
            appendMaybeText description.note Nothing |> appendMaybeText description.magicUsage
    in
    div []
        [ maybeExperience |> Maybe.map (\e -> div [ class "job-description" ] [ p [] [ text "Experience to master" ], p [] [ text (e ++ " class xp") ] ]) |> Maybe.withDefault (div [] [])
        , description.level |> Maybe.map (\l -> div [ class "job-description" ] [ p [] [ text "Level minimum" ], p [] [ text ("Available at level " ++ l) ] ]) |> Maybe.withDefault (div [] [])
        , description.gender |> Maybe.map (\g -> div [ class "job-description" ] [ p [] [ text "Gender restriction" ], p [] [ text (g ++ " only") ] ]) |> Maybe.withDefault (div [] [])
        , noteText |> Maybe.map (\n -> div [ class "job-description" ] [ p [] [ text "Note" ], p [] [ text n ] ]) |> Maybe.withDefault (div [] [])
        ]


viewCertificationRequirement : Job -> Html Msg
viewCertificationRequirement job =
    let
        studyList =
            job.studyIdList
                |> List.map getStudyById
                |> Maybe.Extra.values
    in
    if List.length studyList > 0 then
        div [ class "job-description" ] ([ p [] [ text "Certificats" ] ] ++ List.map viewStudy studyList)

    else
        div [] []


viewSkillMastery : Job -> Html Msg
viewSkillMastery job =
    let
        skillList =
            getJobSkillsByJob job.id
                |> List.map (\s -> viewSkill (jobSkillToSkill s))
    in
    if List.length skillList > 0 then
        div [ class "job-description list-jobskill" ] ([ p [] [ text "Job skills" ] ] ++ skillList)
    else
        div [] []
    


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick (JModalMsg CloseJobModal)
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
