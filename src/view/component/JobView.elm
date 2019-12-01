module JobView exposing (..)

import CustomTypes exposing (..)
import ElmUtils exposing (appendMaybe)
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Job exposing (..)
import JobCategory exposing (getJobCategoryById)
import JobSkill exposing (..)
import ModelUtils exposing (jobToDescription)


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


getJobTile : String -> Int -> Html Msg
getJobTile customCss id =
    img
        [ class ("job-big-picture " ++ customCss)
        , src ("resources/img/jobs/" ++ String.fromInt id ++ ".gif")
        ]
        []


buttonJob : Model -> Int -> Maybe Job -> Html Msg
buttonJob model buildIdx maybeJob =
    let
        onClickEvent =
            onClick (JModalMsg (OpenJobModal ( buildIdx, maybeJob )))
    in
    case maybeJob of
        Just job ->
            let
                jobDescription =
                    jobToDescription job

                listHtml =
                    appendMaybe (jobDescription.level |> Maybe.map (\e -> "Lvl req. " ++ e)) []
                        |> appendMaybe (jobDescription.customExperience |> Maybe.map (\e -> "Exp req. " ++ e))
                        |> appendMaybe (jobDescription.experience |> Maybe.map (\e -> "Exp req. " ++ e))
                        |> appendMaybe jobDescription.note
                        |> appendMaybe (jobDescription.gender |> Maybe.map (\t -> t ++ " only"))
                        |> appendMaybe jobDescription.magicUsage
                        |> List.intersperse (br [] [])
            in
            div [ class "item-a4a" ]
                [ getJobButton onClickEvent job.idPicture
                , p [] [ text job.name ]
                , div
                    [ class "custom-popover above" ]
                    [ p [ class "popover-title" ] [ text ("[" ++ job.name ++ "]") ]
                    , p [ class "popover-text" ] listHtml
                    , p [ class "popover-instruction" ] [ text "Click to change " ]
                    ]
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
viewJobSkill element =
    let
        getSkillPicture =
            case element.combatArt of
                True ->
                    getSkillJobActivePicture

                False ->
                    getSkillJobPassivePicture
    in
    div []
        [ getSkillPicture element.pictureId
        , p [] [ text element.name ]
        , div
            [ class "custom-popover above" ]
            [ p [ class "popover-title" ] [ text ("[" ++ element.name ++ "]") ]
            , p [ class "popover-text" ] [ text element.description ]
            ]
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
