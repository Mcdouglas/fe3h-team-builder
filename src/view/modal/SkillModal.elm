module SkillModal exposing (modalSkillPicker)

import CustomTypes exposing (Job, Skill, SortType(..))
import Dict exposing (Dict(..))
import ElmUtils exposing (boolToInt)
import GlobalMessage exposing (Msg(..), SkillModal(..))
import GlobalModel exposing (Model)
import Html exposing (Html, div, img, input, option, p, select, text)
import Html.Attributes exposing (class, hidden, placeholder, src, style, value)
import Html.Events exposing (onClick, onInput, onMouseOver, stopPropagationOn)
import Job exposing (getJobById)
import JobView exposing (viewJob)
import Json.Decode as Json
import Maybe.Extra exposing (values)
import ModelHandler exposing (getActiveSkillByDefault, getPassiveSkillByDefault, getSkillList)
import ModelUtils exposing (listSortType, skillTypeToString, sortTypeToKeyValue)
import NoDataView exposing (viewNoData)
import Study exposing (getStudyById)
import StudyView exposing (viewStudy)


modalSkillPicker : Model -> Html Msg
modalSkillPicker model =
    let
        ( ( _, _ ), _, isCombatArt ) =
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
        , onClick (SModalMsg CloseSkillModal)
        ]
        [ div
            [ class ("modal-content " ++ modalCss)
            , stopPropagationOn "click" (Json.succeed ( NoOp, True ))
            ]
            [ viewModalContent model
            , viewSideBar model
            ]
        ]


viewModalContent : Model -> Html Msg
viewModalContent model =
    div
        [ class "modal-table" ]
        [ viewSearchFilter model
        , viewSortFilter
        , viewSkillGrid model
        ]


viewSearchFilter : Model -> Html Msg
viewSearchFilter model =
    div
        [ class "filter search-filter" ]
        [ p [] [ text "Search :" ]
        , input
            [ placeholder "Skill name", value model.view.skillSearch, onInput (\msg -> SModalMsg (UpdateSkillFilter msg)) ]
            []
        , div
            [ onClick (SModalMsg CleanSearchSkillFilter)
            , class "close close-button"
            , style "content" "url(\"resources/lib/octicons/x.svg\")"
            ]
            []
        ]


viewSortFilter : Html Msg
viewSortFilter =
    div [ class "filter sort-filter" ]
        [ p [] [ text "Sort by :" ]
        , select [ onInput (\e -> SModalMsg (ChangeSortType e)) ] (listSortType |> List.map (\e -> sortTypeToKeyValue e) |> List.map (\( v, t ) -> option [ value v ] [ text t ]))
        ]


viewSkillGrid : Model -> Html Msg
viewSkillGrid model =
    let
        ( ( buildIdx, _ ), _, isCombatArt ) =
            model.view.skillPicker

        listSkill =
            model.team
                |> Dict.get buildIdx
                |> Maybe.andThen (\build -> Just (getSkillList build.idCharacter isCombatArt model.data))
                |> Maybe.withDefault []
                |> listSortBy model
                |> searchTermInList model.view.skillSearch
                |> List.map (\s -> viewSkillTile model s)
    in
    div [ class "skills-grid" ] listSkill


searchTermInList : String -> List Skill -> List Skill
searchTermInList term list =
    if (term |> String.trim |> String.length) > 0 then
        list |> List.filter (\s -> String.contains (String.toLower term) (String.toLower s.name))

    else
        list


listSortBy : Model -> List Skill -> List Skill
listSortBy model list =
    case model.view.skillListSortBy of
        SortByType ->
            list |> List.sortBy (\e -> skillTypeToString e.skillType) |> List.sortBy (\e -> boolToInt e.learnByJob)

        SortByName ->
            list |> List.sortBy .name


viewSkillTile : Model -> Skill -> Html Msg
viewSkillTile model skill =
    let
        ( ( buildIdx, skillIdx ), _, isCombatArt ) =
            model.view.skillPicker

        lockedCss =
            if
                (model.team
                    |> Dict.get buildIdx
                    |> Maybe.map
                        (\build ->
                            if isCombatArt then
                                build.listActiveSkill

                            else
                                build.listPassiveSkill
                        )
                    |> Maybe.withDefault []
                    |> List.filter (\( _, skillId, skillType ) -> skill.id == skillId && skill.skillType == skillType)
                    |> List.length
                )
                    > 0
            then
                "locked-picture"

            else
                ""
    in
    div
        [ class ("tile " ++ lockedCss)
        , onMouseOver (SModalMsg (UpdateSkillPicker ( ( buildIdx, skillIdx ), Just skill, isCombatArt )))
        , onClick (SModalMsg (UpdateBuildWithSkill ( ( buildIdx, skillIdx ), skill, isCombatArt )))
        ]
        [ img
            [ src ("resources/img/skills/" ++ String.fromInt skill.pictureId ++ ".png")
            , class lockedCss
            ]
            []
        , p [] [ text skill.name ]
        , div [ class "tile-overlay " ] []
        ]


viewSideBar : Model -> Html Msg
viewSideBar model =
    let
        ( ( _, _ ), maybeSkill, isCombatArt ) =
            model.view.skillPicker

        getSkillByDefault =
            if isCombatArt then
                getActiveSkillByDefault

            else
                getPassiveSkillByDefault
    in
    case maybeSkill of
        Just skill ->
            div [ class "sidebar" ]
                [ buttonCloseModal
                , viewSkillDetail skill
                ]

        Nothing ->
            div [ class "sidebar" ]
                [ buttonCloseModal
                , viewSkillDetail getSkillByDefault
                ]


viewSkillDetail : Skill -> Html Msg
viewSkillDetail skill =
    let
        cssClass =
            if skill.combatArt then
                "combat-art"

            else
                ""

        viewDescription =
            if skill.combatArt then
                viewActiveSkillDescription

            else
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
        div [ class "skill-description job-description" ] (p [] [ text "Class to master" ] :: List.map (\j -> viewJob j) maybeJobs)

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
        div [ class "skill-description list-study" ] (p [] [ text "Class's certif." ] :: jobToMasterList)

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
        , class "close close-button"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
