module SkillEventListener exposing (handle)

import Array exposing (Array(..))
import CustomTypes exposing (Build, Skill, SkillType(..))
import Dict exposing (Dict(..))
import GlobalMessage exposing (SkillModal(..))
import GlobalModel exposing (Model)
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
            closeModal model

        UpdateSkillFilter value ->
            updateSearchSkillFilter value model

        CleanSearchSkillFilter ->
            updateSearchSkillFilter "" model

        ChangeSortType value ->
            updateSortTypeFilter value model


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
updateBuildWithSkill shift model =
    let
        ( ( buildIdx, _ ), skill, isCombatArt ) =
            shift

        doUpdate =
            model.team
                |> Dict.get buildIdx
                |> Maybe.map
                    (\build ->
                        if isCombatArt == True then
                            build.listActiveSkill

                        else
                            build.listPassiveSkill
                    )
                |> Maybe.withDefault []
                |> List.filter (\( _, skillId, skillType ) -> (skillId == skill.id) && (skillType == skill.skillType))
                |> List.isEmpty
    in
    if doUpdate then
        closeModal (updateBuild shift model)

    else
        model


updateBuild : ( ( Int, Int ), Skill, Bool ) -> Model -> Model
updateBuild shift model =
    let
        ( ( buildIdx, _ ), _, _ ) =
            shift

        newTeam =
            model.team
                |> Dict.update buildIdx (\build -> updateSkillInBuild build shift)
    in
    { model | team = newTeam }


updateSkillInBuild : Maybe Build -> ( ( Int, Int ), Skill, Bool ) -> Maybe Build
updateSkillInBuild maybeBuild ( ( _, skillIdx ), skill, isCombatArt ) =
    maybeBuild
        |> Maybe.andThen
            (\build ->
                if isCombatArt then
                    let
                        newListSkill =
                            build.listActiveSkill
                                |> List.foldr (::) (List.repeat 3 ( -1, 0, NoType ))
                                |> List.take 3
                                |> List.map (\l -> updateSkillAndKeepOther l skillIdx skill)
                    in
                    Just { build | listActiveSkill = newListSkill }

                else
                    let
                        newListSkill =
                            build.listPassiveSkill
                                |> List.foldr (::) (List.repeat 3 ( -1, 0, NoType ))
                                |> List.take 5
                                |> List.map (\l -> updateSkillAndKeepOther l skillIdx skill)
                    in
                    Just { build | listPassiveSkill = newListSkill }
            )


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
    { model | view = { oldView | skillListSortBy = stringToSortType value } }
