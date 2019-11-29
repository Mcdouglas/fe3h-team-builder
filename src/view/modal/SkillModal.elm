module SkillModal exposing (..)

import CustomTypes exposing (Job, Skill)
import GlobalMessage exposing (Msg(..), SkillModal(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Job exposing (getJobById)
import JobView exposing (viewJob)
import Maybe.Extra exposing (..)
import ModelHandler exposing (getSkillList)
import NoDataView exposing (viewNoData)
import Study exposing (getStudyById)
import StudyView exposing (viewStudy)


modalSkillPicker : Model -> Html Msg
modalSkillPicker model =
    let
        ( ( buildPosition, skillPosition ), maybeSkill, isCombatArt ) =
            model.view.skillPicker

        modalCss =
            if isCombatArt then
                "active-skill-modal"

            else
                "passive-skill-modal"
    in
    div
        [ class "modal-s"
        , hidden (not model.view.skillModalIsOpen)
        ]
        [ div [ class ("modal-content " ++ modalCss) ]
            [ viewSkillGrid model model.view.skillPicker
            , viewSideBar model
            ]
        ]


viewSkillGrid : Model -> ( ( Int, Int ), Maybe Skill, Bool ) -> Html Msg
viewSkillGrid model ( ( buildPosition, skillPosition ), maybeSkill, isCombatArt ) =
    let
        listSkills =
            model.team
                |> List.filter (\( idx, build ) -> idx == buildPosition)
                |> List.map (\( _, build ) -> build.idCharacter)
                |> List.head
                |> Maybe.andThen (\id -> Just (getSkillList id isCombatArt model.data))
                |> Maybe.withDefault []
    in
    div [ class "skills-grid" ]
        (listSkills
            |> List.map (\e -> viewSkillPicker model.view.skillPicker e)
        )


viewSkillPicker : ( ( Int, Int ), Maybe Skill, Bool ) -> Skill -> Html Msg
viewSkillPicker ( positions, _, isCombatArt ) skill =
    div
        [ class "tile"
        , onMouseOver (SModalMsg (UpdateSkillPicker ( positions, Just skill, isCombatArt )))
        , onClick (SModalMsg (UpdateBuildWithSkill ( positions, skill, isCombatArt )))
        ]
        [ img
            [ src ("resources/img/skills/" ++ String.fromInt skill.pictureId ++ ".png") ]
            []
        , p [] [ text skill.name ]
        , div [ class "tile-overlay " ] []
        ]


viewSideBar : Model -> Html Msg
viewSideBar model =
    let
        ( ( idx, skillId ), maybeSkill, isCombatArt ) =
            model.view.skillPicker
    in
    case maybeSkill of
        Just skill ->
            div [ class "sidebar" ]
                [ buttonCloseModal
                , viewSkillDetail skill
                ]

        Nothing ->
            div [ class "sidebar" ]
                [ buttonCloseModal ]


viewSkillDetail : Skill -> Html Msg
viewSkillDetail skill =
    let
        cssClass =
            case skill.combatArt of
                True ->
                    "combat-art"

                False ->
                    ""

        viewDescription =
            case skill.combatArt of
                True ->
                    viewActiveSkillDescription

                False ->
                    viewPassiveSkillDescription
    in
    div [ class ("skill-detail " ++ cssClass) ]
        [ div [ class "skill-title" ]
            [ div
                [ class "title-picture"
                , style "content" ("url(\"resources/img/skills/" ++ String.fromInt skill.pictureId ++ ".png\")")
                ]
                []
            , p [ class "title-text" ] [ text skill.name ]
            ]
        , viewDescription skill
        ]


viewPassiveSkillDescription : Skill -> Html Msg
viewPassiveSkillDescription skill =
    let
        description =
            if (skill.description |> String.trim |> String.length) > 0 then
                p [] [ text skill.description ]

            else
                viewNoData
    in
    div []
        [ div [ class "skill-description" ] [ p [] [ text "Effect" ], description ]
        , viewStudyDescription skill
        , viewJobToMaster skill
        , viewJobsDescription skill
        ]


viewActiveSkillDescription : Skill -> Html Msg
viewActiveSkillDescription skill =
    let
        description =
            if (skill.description |> String.trim |> String.length) > 0 then
                p [] [ text skill.description ]

            else
                viewNoData
    in
    div []
        [ viewCombatArtDescription skill
        , div [ class "skill-description" ] [ p [] [ text "Effect" ], description ]
        , viewStudyDescription skill
        , viewJobToMaster skill
        , viewJobsDescription skill
        ]


viewStudyDescription : Skill -> Html Msg
viewStudyDescription skill =
    let
        maybeStudy =
            skill.studyId |> Maybe.andThen getStudyById
    in
    case maybeStudy of
        Just study ->
            div [ class "skill-description list-study" ] [ p [] [ text "Certificats req." ], viewStudy study ]

        Nothing ->
            div [ class "skill-description list-study" ] [ p [] [ text "Certificats req." ], viewNoData ]


viewJobToMaster : Skill -> Html Msg
viewJobToMaster skill =
    let
        maybeJobs =
            skill.jobIdList
                |> List.map (\id -> getJobById id)
                |> Maybe.Extra.values
    in
    if (maybeJobs |> List.length) > 0 then
        div [ class "skill-description job-description" ] ([ p [] [ text "Class to master" ] ] ++ List.map (\j -> viewJob j) maybeJobs)

    else
        div [ class "skill-description job-description" ] [ p [] [ text "Class to master" ], viewNoData ]


viewJobsDescription : Skill -> Html Msg
viewJobsDescription skill =
    let
        jobToMasterList =
            skill.jobIdList
                |> List.map (\id -> getJobById id)
                |> List.map (\mj -> viewJobDescription mj)
                |> List.concat
    in
    if List.length jobToMasterList > 0 then
        div [ class "skill-description list-study" ] ([ p [] [ text "Class's certif." ] ] ++ jobToMasterList)

    else
        div [ class "skill-description list-study" ] [ p [] [ text "Class's certif." ], viewNoData ]


viewJobDescription : Maybe Job -> List (Html Msg)
viewJobDescription maybeJob =
    let
        listStudyToReach =
            maybeJob
                |> Maybe.map (\e -> e.studyIdList)
                |> Maybe.withDefault []
                |> List.map (\id -> getStudyById id)
                |> Maybe.Extra.combine
                |> Maybe.withDefault []
    in
    List.map (\s -> viewStudy s) listStudyToReach


viewCombatArtDescription : Skill -> Html Msg
viewCombatArtDescription skill =
    let
        durabilityCost =
            skill.durabilityCost
                |> Maybe.map (\e -> "-" ++ String.fromInt e)
                |> Maybe.withDefault "-"

        might =
            skill.might
                |> Maybe.map (\e -> String.fromInt e)
                |> Maybe.withDefault "-"

        hit =
            skill.hit
                |> Maybe.map (\e -> String.fromInt e)
                |> Maybe.withDefault "-"

        avoid =
            skill.avoid
                |> Maybe.map (\e -> String.fromInt e)
                |> Maybe.withDefault "-"

        criticalRate =
            skill.criticalRate
                |> Maybe.map (\e -> String.fromInt e)
                |> Maybe.withDefault "-"

        rangeInString ( start, end ) =
            if start == end then
                String.fromInt start

            else
                String.fromInt start ++ "~" ++ String.fromInt end

        range =
            skill.range
                |> Maybe.map (\e -> rangeInString e)
                |> Maybe.withDefault "-"
    in
    div [ class "skill-description art-description" ]
        [ p [] [ text "Art" ]
        , div [ class "art-table" ]
            [ div [ class "art-table-row art-table-header" ] [ p [] [ text "Cost" ], p [] [ text "Mt" ], p [] [ text "Hit" ], p [] [ text "Avo" ], p [] [ text "Crit" ], p [] [ text "Range" ] ]
            , div [ class "art-table-row" ] [ p [] [ text durabilityCost ], p [] [ text might ], p [] [ text hit ], p [] [ text avoid ], p [] [ text criticalRate ], p [] [ text range ] ]
            ]
        ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick (SModalMsg CloseSkillModal)
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
