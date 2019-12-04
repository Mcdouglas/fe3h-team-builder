module SkillEventListener exposing (..)

import Array exposing (Array)
import CustomTypes exposing (..)
import Dict exposing (Dict)
import GlobalMessage exposing (SkillModal(..))
import GlobalModel exposing (..)
import ModelHandler exposing (..)
import ModelUtils exposing (stringToSortType)


handle : SkillModal -> Model -> Model
handle msg model =
    case msg of
        OpenSkillModal value ->
            openModal value model

        UpdateSkillPicker value ->
            updatePicker value model

        UpdateBuildWithSkill value ->
            updateBuildWithSkill value model

        CloseSkillModal ->
            handleDoubleClosure model

        IgnoreCloseSkillModal ->
            ignoreClosureInModal model

        UpdateSkillFilter value ->
            updateSearchSkillFilter value model

        CleanSearchSkillFilter ->
            updateSearchSkillFilter "" model

        ChangeSortType value ->
            updateSortTypeFilter value model


ignoreClosureInModal : Model -> Model
ignoreClosureInModal model =
    let
        oldView =
            model.view

        newView =
            { oldView | skipNextClosure = True }
    in
    { model | view = newView }


handleDoubleClosure : Model -> Model
handleDoubleClosure model =
    let
        oldView =
            model.view

        dontCloseModal =
            model.view.skipNextClosure
    in
    if dontCloseModal then
        { model | view = { oldView | skipNextClosure = False } }

    else
        closeModal model


openModal : ( ( Int, Int ), Maybe Skill, Bool ) -> Model -> Model
openModal skillPicker model =
    let
        oldView =
            model.view

        newView =
            { oldView | skillModalIsOpen = True, skillPicker = skillPicker }
    in
    { model | view = newView }


closeModal : Model -> Model
closeModal model =
    let
        oldView =
            model.view

        newView =
            { oldView | skillModalIsOpen = False }
    in
    { model | view = newView }


updatePicker : ( ( Int, Int ), Maybe Skill, Bool ) -> Model -> Model
updatePicker skillPicker model =
    let
        oldView =
            model.view

        newView =
            { oldView | skillPicker = skillPicker }
    in
    { model | view = newView }


updateBuildWithSkill : ( ( Int, Int ), Skill, Bool ) -> Model -> Model
updateBuildWithSkill ( ( buildIdx, skillIdx ), skill, isCombatArt ) model =
    let
        doUpdate =
            (model.team
                |> Dict.get buildIdx
                |> Maybe.map
                    (\build ->
                        if isCombatArt == True then
                            build.listActiveSkill

                        else
                            build.listPassiveSkill
                    )
                |> Maybe.withDefault []
                |> List.filter (\( idx, skillId, skillType ) -> skillId == skill.id)
                |> List.length
            )
                < 1
    in
    if doUpdate then
        closeModal (updateBuild ( ( buildIdx, skillIdx ), skill, isCombatArt ) model)

    else
        model


updateBuild : ( ( Int, Int ), Skill, Bool ) -> Model -> Model
updateBuild ( ( buildIdx, skillIdx ), skill, isCombatArt ) model =
    let
        newTeam =
            model.team
                |> Dict.update buildIdx (\build -> updateSkillInBuild build ( ( buildIdx, skillIdx ), skill, isCombatArt ))
    in
    { model | team = newTeam }


updateSkillInBuild : Maybe Build -> ( ( Int, Int ), Skill, Bool ) -> Maybe Build
updateSkillInBuild maybeBuild ( ( _, skillIdx ), skill, isCombatArt ) =
    case maybeBuild of
        Just build ->
            case isCombatArt of
                True ->
                    let
                        newListSkill =
                            build.listActiveSkill
                                |> List.foldr (::) (List.repeat 3 ( -1, -1, NoType ))
                                |> List.take 3
                                |> List.map (\l -> updateSkillAndKeepOther l skillIdx skill)
                    in
                    Just { build | listActiveSkill = newListSkill }

                False ->
                    let
                        newListSkill =
                            build.listPassiveSkill
                                |> List.foldr (::) (List.repeat 3 ( -1, -1, NoType ))
                                |> List.take 5
                                |> List.map (\l -> updateSkillAndKeepOther l skillIdx skill)
                    in
                    Just { build | listPassiveSkill = newListSkill }

        Nothing ->
            Nothing


updateSkillAndKeepOther : ( Int, Int, SkillType ) -> Int -> Skill -> ( Int, Int, SkillType )
updateSkillAndKeepOther ( idx, oldSkillId, skillType ) skillIdx skill =
    -- To improve ?
    if idx == skillIdx then
        ( idx, skill.id, skill.skillType )

    else
        ( idx, oldSkillId, skillType )


updateSearchSkillFilter : String -> Model -> Model
updateSearchSkillFilter value model =
    let
        oldView =
            model.view
    in
    { model | view = { oldView | skillSearch = value } }


updateSortTypeFilter : String -> Model -> Model
updateSortTypeFilter value model =
    let
        oldView =
            model.view
    in
    { model | view = { oldView | skillListSortBy = Debug.log "sortType " (stringToSortType value) } }
