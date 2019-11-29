module BuildView exposing (..)

import Character exposing (..)
import CharacterView exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (BuildPanel(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Job exposing (..)
import JobSkill exposing (..)
import JobView exposing (..)
import ModelHandler exposing (..)
import SkillView exposing (..)


viewBuild : Model -> ( Int, Build ) -> Html Msg
viewBuild model ( idx, build ) =
    let
        maybeCharacter =
            getCharacterById build.idCharacter

        buildLockDiv =
            case maybeCharacter of
                Just _ ->
                    div [] []

                Nothing ->
                    div [ class "item-a-locked" ] []
    in
    div [ class "item-a" ]
        [ sectionCharacter model idx maybeCharacter
        , sectionPassiveSkills model ( idx, build )
        , sectionActiveSkills model ( idx, build )
        , sectionJob model ( idx, build )
        , buttonBuildInfo build
        , buildLockDiv
        ]


sectionPassiveSkills : Model -> ( Int, Build ) -> Html Msg
sectionPassiveSkills model ( buildIdx, build ) =
    let
        listPassiveSkill =
            build.listPassiveSkill
                |> List.map (\( idx, skillId, skillType ) -> ( idx, skillId, getSkillByType skillId skillType ))
                |> List.indexedMap Tuple.pair
                |> List.map (\( id, ( idx, idSkill, maybeSkill ) ) -> ( ( buildIdx, id ), maybeSkill, False ))
                |> List.take 5
    in
    div [ class "item-a2" ]
        (List.map (\e -> skillButton model e) listPassiveSkill)


sectionActiveSkills : Model -> ( Int, Build ) -> Html Msg
sectionActiveSkills model ( buildIdx, build ) =
    let
        listActiveSkill =
            build.listActiveSkill
                |> List.map (\( idx, skillId, skillType ) -> ( idx, skillId, getSkillByType skillId skillType ))
                |> List.indexedMap Tuple.pair
                |> List.map (\( id, ( idx, idSkill, maybeSkill ) ) -> ( ( buildIdx, id ), maybeSkill, True ))
                |> List.take 3
    in
    div [ class "item-a3" ]
        (List.map (\e -> skillButton model e) listActiveSkill)


sectionJob : Model -> ( Int, Build ) -> Html Msg
sectionJob model ( buildIdx, build ) =
    let
        job =
            getJobById build.jobId

        listJobSkill =
            job |> Maybe.map (\e -> getJobSkillsByJob e.id) |> Maybe.withDefault []
    in
    div [ class "item-a4" ]
        [ buttonJob model buildIdx job
        , div [ class "item-a4b" ] (listJobSkill |> List.map (\e -> viewJobSkill e))
        ]


buttonBuildInfo : Build -> Html Msg
buttonBuildInfo build =
    let
        infoShown =
            not build.hiddenInfo
    in
    div
        [ onClick (ToggleBuildInfo build.idCharacter)
        , class "item-b1"
        ]
        [ img
            [ if build.hiddenInfo == True then
                src "resources/lib/octicons/chevron-down.svg"

              else
                src "resources/lib/octicons/chevron-up.svg"
            ]
            []
        ]


controlPanel : Model -> Int -> Html Msg
controlPanel model idx =
    div [ class "c-panel" ]
        [ div [ class "up-controller button-clickable", onClick (BuildMsg (UpBuild idx)) ] []
        , div [ class "remove-controller button-clickable", onClick (BuildMsg (DeleteBuild idx)) ] []
        , div [ class "down-controller button-clickable", onClick (BuildMsg (DownBuild idx)) ] []
        ]
