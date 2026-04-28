module BuildView exposing (controlPanel, viewBuild)

import Character exposing (getCharacterById)
import CharacterView exposing (sectionCharacter)
import CustomTypes exposing (Build)
import Dict exposing (Dict(..))
import GlobalMessage exposing (BuildPanel(..), Msg(..))
import GlobalModel exposing (Model)
import Html exposing (Html, div, img)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Job exposing (getJobById)
import JobSkill exposing (getJobSkillsByJob)
import JobView exposing (buttonJob, viewJobSkill)
import ModelHandler exposing (getSkillByType)
import SkillView exposing (skillButton)


viewBuild : ( Int, Build ) -> Html Msg
viewBuild ( idx, build ) =
    let
        maybeCharacter =
            getCharacterById build.idCharacter
    in
    div [ class "item-a" ]
        [ sectionCharacter idx maybeCharacter
        , sectionPassiveSkills ( idx, build )
        , sectionActiveSkills ( idx, build )
        , sectionJob ( idx, build )
        , buttonBuildInfo build
        ]


sectionPassiveSkills : ( Int, Build ) -> Html Msg
sectionPassiveSkills ( buildIdx, build ) =
    let
        listPassiveSkill =
            build.listPassiveSkill
                |> List.map (\( idx, skillId, skillType ) -> ( idx, skillId, getSkillByType skillId skillType ))
                |> List.indexedMap Tuple.pair
                |> List.map (\( id, ( _, _, maybeSkill ) ) -> ( ( buildIdx, id ), maybeSkill, False ))
                |> List.take 5
    in
    div [ class "item-a2" ]
        (List.map (\e -> skillButton e) listPassiveSkill)


sectionActiveSkills : ( Int, Build ) -> Html Msg
sectionActiveSkills ( buildIdx, build ) =
    let
        listActiveSkill =
            build.listActiveSkill
                |> List.map (\( idx, skillId, skillType ) -> ( idx, skillId, getSkillByType skillId skillType ))
                |> List.indexedMap Tuple.pair
                |> List.map (\( id, ( _, _, maybeSkill ) ) -> ( ( buildIdx, id ), maybeSkill, True ))
                |> List.take 3
    in
    div [ class "item-a3" ]
        (List.map (\e -> skillButton e) listActiveSkill)


sectionJob : ( Int, Build ) -> Html Msg
sectionJob ( buildIdx, build ) =
    let
        job =
            getJobById build.jobId

        listJobSkill =
            job |> Maybe.map (\e -> getJobSkillsByJob e.id) |> Maybe.withDefault []
    in
    div [ class "item-a4" ]
        [ buttonJob buildIdx job
        , div [ class "item-a4b" ] (listJobSkill |> List.map (\e -> viewJobSkill e))
        ]


buttonBuildInfo : Build -> Html Msg
buttonBuildInfo build =
    let
        htmlAttribute =
            if build.hiddenInfo then
                src "resources/lib/octicons/chevron-down.svg"

            else
                src "resources/lib/octicons/chevron-up.svg"
    in
    div [ onClick (ToggleBuildInfo build.idCharacter), class "item-b1" ] [ img [ htmlAttribute ] [] ]


controlPanel : Model -> Int -> Html Msg
controlPanel model idx =
    let
        upCustomCss =
            if idx > 0 then
                "button-clickable"

            else
                "locked-controller"

        removeCustomCss =
            if Dict.size model.team > 1 then
                "button-clickable"

            else
                "locked-controller"

        downCustomCss =
            if idx < (Dict.size model.team - 1) then
                "button-clickable"

            else
                "locked-controller"
    in
    div [ class "c-panel" ]
        [ div [ class ("up-controller " ++ upCustomCss), onClick (BuildMsg (UpBuild idx)) ] []
        , div [ class ("remove-controller " ++ removeCustomCss), onClick (BuildMsg (DeleteBuild idx)) ] []
        , div [ class ("down-controller " ++ downCustomCss), onClick (BuildMsg (DownBuild idx)) ] []
        ]
