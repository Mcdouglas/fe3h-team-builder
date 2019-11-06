module SkillEventListener exposing (..)

import Array exposing (Array)
import CustomTypes exposing (..)
import GlobalMessage exposing (SkillModal(..))
import GlobalModel exposing (..)
import ModelHandler exposing (..)


handle : SkillModal -> Model -> Model
handle msg model =
    case msg of
        OpenSkillModal value ->
            openModal value model

        CloseSkillModal ->
            closeModal model

        UpdateSkillPicker value ->
            updateModal value model

        UpdateBuildWithSkill value ->
            closeModal (updateBuild (Debug.log "value" value) model)


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


updateModal : ( ( Int, Int ), Maybe Skill, Bool ) -> Model -> Model
updateModal skillPicker model =
    let
        oldView =
            model.view

        newView =
            { oldView | skillPicker = skillPicker }
    in
    { model | view = newView }


updateBuild : ( ( Int, Int ), Skill, Bool ) -> Model -> Model
updateBuild tuple model =
    let
        newTeam =
            model.team
                |> List.map (\e -> updateBuildIf e tuple)
    in
    { model | team = newTeam }


updateBuildIf : ( Int, Build ) -> ( ( Int, Int ), Skill, Bool ) -> ( Int, Build )
updateBuildIf ( buildIdx, build ) ( ( idx, skillId ), skill, isCombatArt ) =
    if buildIdx == idx then
        Debug.log "build" ( buildIdx, updateSkillInBuild build ( ( idx, skillId ), skill, isCombatArt ) )

    else
        ( buildIdx, build )


updateSkillInBuild : Build -> ( ( Int, Int ), Skill, Bool ) -> Build
updateSkillInBuild build ( ( _, skillId ), skill, isCombatArt ) =
    let
        listSkills =
            case isCombatArt of
                True ->
                    build.listActiveSkill

                False ->
                    build.listPassiveSkill

        newListSkill =
            listSkills
                |> List.map (\e -> updateSkillIf e skillId skill)
    in
    case isCombatArt of
        True ->
            { build | listActiveSkill = newListSkill }

        False ->
            { build | listPassiveSkill = newListSkill }


updateSkillIf : ( Int, Int, SkillType ) -> Int -> Skill -> ( Int, Int, SkillType )
updateSkillIf ( idx, oldId, skillType ) skillIdx skill =
    if idx == skillIdx then
        Debug.log "newSkill" ( idx, skill.id, skill.skillT )

    else
        Debug.log "sameSkill" ( idx, oldId, skillType )
