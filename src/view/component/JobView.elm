module JobView exposing (buttonJob, getJobTile, oldGetJobTile, viewJob, viewJobSkill)

import CustomTypes exposing (Job, JobSkill)
import ElmUtils exposing (appendMaybe)
import GlobalMessage exposing (JobModal(..), Msg(..))
import Html exposing (Attribute, Html, div, img, p, text)
import Html.Attributes exposing (class, src, style)
import Html.Events exposing (onClick)
import Job exposing (getJobByDefault)
import ModelUtils exposing (jobToDescription)
import Popover exposing (viewPopover, viewPopoverMultiline)


viewJob : Job -> Html Msg
viewJob job =
    div [ class "job-view" ]
        [ getJobPicture job.idPicture
        , p [] [ text job.name ]
        ]


getJobPicture : Int -> Html Msg
getJobPicture id =
    img
        [ class "job-picture"
        , src ("resources/img/jobs/" ++ String.fromInt id ++ ".gif")
        ]
        []


getJobTile : String -> Job -> Html Msg
getJobTile customCss job =
    div [ class ("job-background-tile " ++ customCss) ]
        (getJobPictureWithBackground job)


getJobPictureWithBackground : Job -> List (Html Msg)
getJobPictureWithBackground job =
    let
        categoryId =
            if job.canFly == True then
                6

            else
                job.jobCategoryId
    in
    [ img
        [ class "job-background"
        , src ("resources/img/background/" ++ String.fromInt categoryId ++ ".png")
        ]
        []
    , img
        [ class "job-picture"
        , src ("resources/img/jobs/" ++ String.fromInt job.idPicture ++ ".gif")
        ]
        []
    ]


oldGetJobTile : String -> Int -> Html Msg
oldGetJobTile customCss id =
    img
        [ class ("job-big-picture " ++ customCss)
        , src ("resources/img/jobs/" ++ String.fromInt id ++ ".gif")
        ]
        []


buttonJob : Int -> Maybe Job -> Html Msg
buttonJob buildIdx maybeJob =
    let
        jobOrDefault =
            maybeJob |> Maybe.withDefault getJobByDefault

        onClickEvent =
            onClick (JModalMsg (OpenJobModal ( buildIdx, jobOrDefault )))
    in
    case maybeJob of
        Just job ->
            let
                jobDescription =
                    jobToDescription job

                descriptionMultiline =
                    appendMaybe (jobDescription.level |> Maybe.map (\e -> "Lvl req. " ++ e)) []
                        |> appendMaybe (jobDescription.customExperience |> Maybe.map (\e -> "Exp req. " ++ e))
                        |> appendMaybe (jobDescription.experience |> Maybe.map (\e -> "Exp req. " ++ e))
                        |> appendMaybe jobDescription.note
                        |> appendMaybe (jobDescription.gender |> Maybe.map (\t -> t ++ " only"))
                        |> appendMaybe jobDescription.magicUsage
            in
            div [ class "item-a4a" ]
                [ getJobButton onClickEvent job.idPicture
                , p [] [ text job.name ]
                , viewPopoverMultiline job.name descriptionMultiline "Click to change"
                ]

        Nothing ->
            div [ class "item-a4a" ]
                [ addJobButton onClickEvent ]


getJobButton : Attribute Msg -> Int -> Html Msg
getJobButton onClickEvent id =
    div
        [ class "job-picture job-button qs button-clickable"
        , style "content" ("url(\"resources/img/jobs/" ++ String.fromInt id ++ ".gif\")")
        , onClickEvent
        ]
        []


addJobButton : Attribute Msg -> Html Msg
addJobButton onClickEvent =
    div
        [ class "add-job"
        , onClickEvent
        ]
        []


viewJobSkill : JobSkill -> Html Msg
viewJobSkill skill =
    let
        getSkillPicture =
            if skill.combatArt then
                getSkillJobActivePicture

            else
                getSkillJobPassivePicture
    in
    div []
        [ getSkillPicture skill.pictureId
        , p [] [ text skill.name ]
        , viewPopover skill.name skill.description
        ]


getSkillJobPassivePicture : Int -> Html Msg
getSkillJobPassivePicture id =
    div
        [ class "skill-picture qs"
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt id ++ ".png\"")
        ]
        []


getSkillJobActivePicture : Int -> Html Msg
getSkillJobActivePicture id =
    div
        [ class "art-picture qs"
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt id ++ ".png\"")
        ]
        []
