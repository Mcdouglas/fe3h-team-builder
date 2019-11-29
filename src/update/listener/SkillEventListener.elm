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
            updatePicker value model

        UpdateBuildWithSkill value ->
            updateBuildWithSkill value model


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
                |> List.filter (\( id, build ) -> id == buildIdx)
                |> List.head
                |> Maybe.map
                    (\( _, b ) ->
                        if isCombatArt == True then
                            b.listActiveSkill

                        else
                            b.listPassiveSkill
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
updateBuild shift model =
    let
        newTeam =
            model.team
                |> List.map (\e -> updateBuildAndKeepOther e shift)
    in
    { model | team = newTeam }


updateBuildAndKeepOther : ( Int, Build ) -> ( ( Int, Int ), Skill, Bool ) -> ( Int, Build )
updateBuildAndKeepOther ( idx, build ) ( ( buildIdx, skillIdx ), skill, isCombatArt ) =
    if idx == buildIdx then
        ( idx, updateSkillInBuild build ( ( idx, skillIdx ), skill, isCombatArt ) )

    else
        ( idx, build )


updateSkillInBuild : Build -> ( ( Int, Int ), Skill, Bool ) -> Build
updateSkillInBuild build ( ( _, skillIdx ), skill, isCombatArt ) =
    case isCombatArt of
        True ->
            let
                newListSkill =
                    build.listActiveSkill
                        |> List.foldr (::) (List.repeat 3 ( -1, -1, NoType ))
                        |> List.take 3
                        |> List.map (\l -> updateSkillAndKeepOther l skillIdx skill)
            in
            { build | listActiveSkill = newListSkill }

        False ->
            let
                newListSkill =
                    build.listPassiveSkill
                        |> List.foldr (::) (List.repeat 3 ( -1, -1, NoType ))
                        |> List.take 5
                        |> List.map (\l -> updateSkillAndKeepOther l skillIdx skill)
            in
            { build | listPassiveSkill = newListSkill }


updateSkillAndKeepOther : ( Int, Int, SkillType ) -> Int -> Skill -> ( Int, Int, SkillType )
updateSkillAndKeepOther ( idx, oldSkillId, skillType ) skillIdx skill =
    -- To improve ?
    if idx == skillIdx then
        ( idx, skill.id, skill.skillType )

    else
        ( idx, oldSkillId, skillType )
