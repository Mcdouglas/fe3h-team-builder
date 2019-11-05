module JobView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Job exposing (..)
import JobCategory exposing (getJobCategoryById)
import JobSkill exposing (..)


viewJob : Model -> Maybe Job -> Html Msg
viewJob model element =
    case element of
        Just value ->
            let
                maybeJobCategory =
                    getJobCategoryById value.jobCategoryId

                note =
                    value.note |> Maybe.map (\e -> text e)

                level =
                    maybeJobCategory |> Maybe.andThen (\e -> e.level) |> Maybe.map (\e -> "Lvl req. " ++ String.fromInt e) |> Maybe.map (\e -> text e)

                customExperience =
                    value.customExperience |> Maybe.map (\e -> "Exp req. " ++ String.fromInt e) |> Maybe.map (\e -> text e)

                experience =
                    maybeJobCategory |> Maybe.andThen (\e -> e.experience) |> Maybe.map (\e -> "Exp req. " ++ String.fromInt e) |> Maybe.map (\e -> text e)

                gender =
                    value.gender |> Maybe.map (\e -> genderToString e ++ " only") |> Maybe.map (\e -> text e)

                magicUsage =
                    value.magicUsage |> Maybe.map (\e -> magicUsageToString e) |> Maybe.map (\e -> text e)

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
            in
            div [ class "item-a4a" ]
                [ getJobPicture value.idPicture
                , p [] [ text value.name ]
                , div
                    [ class "custom-popover above" ]
                    [ p [ class "popover-title" ] [ text ("[" ++ value.name ++ "]") ]
                    , p [ class "popover-text" ] listHtml
                    , p [ class "popover-instruction" ] [ text "Click to change " ]
                    ]
                ]

        Nothing ->
            p [] [ text "No data" ]


getJobPicture : Int -> Html Msg
getJobPicture id =
    div
        [ class "job-picture qs button-clickable"
        , style "content" ("url(\"resources/img/jobs/" ++ String.fromInt id ++ ".gif\")")
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
