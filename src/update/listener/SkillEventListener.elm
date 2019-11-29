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
            closeModal (updateBuild value model)


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
                        |> updateSkillInListIfNoCopy skillIdx skill
            in
            { build | listActiveSkill = newListSkill }

        False ->
            let
                newListSkill =
                    build.listPassiveSkill
                        |> List.foldr (::) (List.repeat 3 ( -1, -1, NoType ))
                        |> List.take 5
                        |> updateSkillInListIfNoCopy skillIdx skill
            in
            { build | listPassiveSkill = newListSkill }


updateSkillInListIfNoCopy : Int -> Skill -> List ( Int, Int, SkillType ) -> List ( Int, Int, SkillType )
updateSkillInListIfNoCopy skillIdx skill list =
    -- if the skill wasn't already present ( same id & same type )
    let
        doUpdate =
            list
                |> List.filter (\( _, skillId, skillType ) -> skillId == skill.id && skillType == skill.skillType)
                |> List.isEmpty
    in
    case doUpdate of
        True ->
            list |> List.map (\e -> updateSkillAndKeepOther e skillIdx skill)

        False ->
            list


updateSkillAndKeepOther : ( Int, Int, SkillType ) -> Int -> Skill -> ( Int, Int, SkillType )
updateSkillAndKeepOther ( idx, oldSkillId, skillType ) skillIdx skill =
    -- To improve ?
    if idx == skillIdx then
        ( idx, skill.id, skill.skillType )

    else
        ( idx, oldSkillId, skillType )
