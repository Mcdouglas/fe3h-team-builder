module BuildInfoView exposing (..)

import Character exposing (getCharacterByDefault, getCharacterById)
import CustomTypes exposing (..)
import Dict exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Job exposing (getJobById)
import JobView exposing (viewJob)
import MasterySkill exposing (..)
import NoDataView exposing (viewNoData)
import StandardSkill exposing (..)
import Study exposing (..)
import StudyView exposing (..)


sectionBuildInfo : Model -> ( Int, Build ) -> Html Msg
sectionBuildInfo model ( idx, build ) =
    let
        character =
            getCharacterById build.idCharacter
                |> Maybe.withDefault getCharacterByDefault
    in
    div
        [ class "item-b2 build-info"
        , hidden build.hiddenInfo
        , id ("info-" ++ String.fromInt build.idCharacter)
        ]
        [ sectionCharacter model character
        , sectionPassiveSkill model build
        , sectionActiveSkill model build
        , sectionJob model build
        ]


sectionCharacter : Model -> Character -> Html Msg
sectionCharacter model character =
    let
        academicSkills =
            getAcademicSkills character.id
    in
    div [ class "character-section" ]
        [ div [ class "study-table" ]
            [ div [ class "study-table-row study-table-header" ] (Dict.toList academicSkills |> List.map (\( k, v ) -> k |> stringToSubject |> subjectToId) |> List.sort |> List.map getStudyPicture)
            , div [ class "study-table-row" ] (Dict.values academicSkills |> List.map getAcademicSkill)
            ]
        ]


sectionPassiveSkill : Model -> Build -> Html Msg
sectionPassiveSkill model build =
    let
        skillIdToView skillId skillType =
            if skillType == CustomTypes.MasteryType then
                let
                    firstDiv =
                        getMasterySkill skillId |> Maybe.andThen (\m -> getJobById (List.head m.jobIdList |> Maybe.withDefault 0)) |> Maybe.map (\j -> j.studyIdList) |> Maybe.withDefault [] |> List.map getStudyById |> List.map (\s -> Maybe.map viewStudy s |> Maybe.withDefault viewNoData)

                    secondDiv =
                        div [ class "arrow-down" ] []

                    thirdDiv =
                        getMasterySkill skillId |> Maybe.andThen (\m -> getJobById (List.head m.jobIdList |> Maybe.withDefault 0)) |> Maybe.map viewJob |> Maybe.withDefault viewNoData
                in
                firstDiv ++ [ secondDiv, thirdDiv ]
            else if skillType == CustomTypes.StandardType then
                getStandardSkill skillId |> Maybe.andThen (\s -> getStudyById s.studyId) |> Maybe.map viewStudy |> Maybe.withDefault viewNoData |> List.singleton
            else 
                p[][] |> List.singleton

    in
    div [ class "passive-skill-section" ] (build.listPassiveSkill |> List.map (\( _, skillId, skillType ) -> div [ class "skill-info" ] (skillIdToView skillId skillType)))


sectionActiveSkill : Model -> Build -> Html Msg
sectionActiveSkill model build =
    let
        skillIdToView skillId skillType =

            if skillType == CustomTypes.MasteryType then
                let
                    firstDiv =
                        getMasterySkill skillId |> Maybe.andThen (\m -> getJobById (List.head m.jobIdList |> Maybe.withDefault 0)) |> Maybe.map (\j -> j.studyIdList) |> Maybe.withDefault [] |> List.map getStudyById |> List.map (\s -> Maybe.map viewStudy s |> Maybe.withDefault viewNoData)

                    secondDiv =
                        div [ class "arrow-down" ] []

                    thirdDiv =
                        getMasterySkill skillId |> Maybe.andThen (\m -> getJobById (List.head m.jobIdList |> Maybe.withDefault 0)) |> Maybe.map viewJob |> Maybe.withDefault viewNoData
                in
                firstDiv ++ [ secondDiv, thirdDiv ]
            else if skillType == StandardType then
                getStandardSkill skillId |> Maybe.andThen (\s -> getStudyById s.studyId) |> Maybe.map viewStudy |> Maybe.withDefault viewNoData |> List.singleton
            else
                p[][] |> List.singleton

    in
    div [ class "active-skill-section" ] (build.listActiveSkill |> List.map (\( _, skillId, skillType ) -> div [ class "skill-info" ] (skillIdToView skillId skillType)))


sectionJob : Model -> Build -> Html Msg
sectionJob model build =
    div [ class "job-section" ] (getJobById build.jobId |> Maybe.map (\j -> j.studyIdList) |> Maybe.withDefault [] |> List.map getStudyById |> List.map (\s -> Maybe.map viewStudy s |> Maybe.withDefault viewNoData))
