module JobView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Job exposing (..)
import JobCategory exposing (getJobCategoryById)
import JobSkill exposing (..)


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


buttonJob : Model -> Int -> Maybe Job -> Html Msg
buttonJob model buildIdx maybeJob =
    case maybeJob of
        Just job ->
            let
                note =
                    job.note |> Maybe.map (\e -> text e)

                maybeJobCategory =
                    getJobCategoryById job.jobCategoryId

                level =
                    maybeJobCategory |> Maybe.andThen (\e -> e.level) |> Maybe.map (\e -> "Lvl req. " ++ String.fromInt e) |> Maybe.map (\e -> text e)

                experience =
                    maybeJobCategory |> Maybe.andThen (\e -> e.experience) |> Maybe.map (\e -> "Exp req. " ++ String.fromInt e) |> Maybe.map (\e -> text e)

                customExperience =
                    job.customExperience |> Maybe.map (\e -> "Exp req. " ++ String.fromInt e) |> Maybe.map (\e -> text e)

                gender =
                    job.gender |> Maybe.map (\e -> genderToString e ++ " only") |> Maybe.map (\e -> text e)

                magicUsage =
                    job.magicUsage |> Maybe.map (\e -> magicUsageToString e) |> Maybe.map (\e -> text e)

                appendMaybe maybe list =
                    Maybe.map List.singleton maybe
                        |> Maybe.withDefault []
                        |> (++) list

                listHtml =
                    appendMaybe note []
                        |> appendMaybe level
                        |> appendMaybe customExperience
                        |> appendMaybe experience
                        |> appendMaybe gender
                        |> appendMaybe magicUsage
                        |> List.intersperse (br [] [])

                onClickEvent =
                    onClick (JModalMsg (OpenJobModal ( buildIdx, maybeJob )))
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
            p [] [ text "No data" ]


getJobButton : Attribute Msg -> Int -> Html Msg
getJobButton onClickEvent id =
    div
        [ class "job-picture job-button qs button-clickable"
        , style "content" ("url(\"resources/img/jobs/" ++ String.fromInt id ++ ".gif\")")
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
