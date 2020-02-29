module BuildInfoView exposing (sectionBuildInfo)

import Character exposing (getCharacterByDefault, getCharacterById)
import CustomTypes exposing (Build, Character, SkillType(..))
import Dict exposing (Dict(..))
import GlobalMessage exposing (Msg(..))
import Html exposing (Html, div, p)
import Html.Attributes exposing (class, hidden, id)
import Job exposing (getJobById)
import JobView exposing (viewJob)
import MasterySkill exposing (getMasterySkill)
import NoDataView exposing (viewNoData)
import StandardSkill exposing (getStandardSkill)
import Study exposing (getAcademicSkills, getStudyById, stringToSubject, subjectToId)
import StudyView exposing (getAcademicSkill, getStudyPicture, viewStudy)


sectionBuildInfo : Build -> Html Msg
sectionBuildInfo build =
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
        [ sectionCharacter character
        , sectionPassiveSkill build
        , sectionActiveSkill build
        , sectionJob build
        ]


sectionCharacter : Character -> Html Msg
sectionCharacter character =
    let
        academicSkills =
            getAcademicSkills character.id
    in
    div [ class "character-section" ]
        [ div [ class "study-table" ]
            [ div [ class "study-table-row study-table-header" ] (Dict.toList academicSkills |> List.map (\( k, _ ) -> k |> stringToSubject |> subjectToId) |> List.sort |> List.map getStudyPicture)
            , div [ class "study-table-row" ] (Dict.values academicSkills |> List.map getAcademicSkill)
            ]
        ]


sectionPassiveSkill : Build -> Html Msg
sectionPassiveSkill build =
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
                p [] [] |> List.singleton
    in
    div [ class "passive-skill-section" ] (build.listPassiveSkill |> List.map (\( _, skillId, skillType ) -> div [ class "skill-info" ] (skillIdToView skillId skillType)))


sectionActiveSkill : Build -> Html Msg
sectionActiveSkill build =
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
                p [] [] |> List.singleton
    in
    div [ class "active-skill-section" ] (build.listActiveSkill |> List.map (\( _, skillId, skillType ) -> div [ class "skill-info" ] (skillIdToView skillId skillType)))


sectionJob : Build -> Html Msg
sectionJob build =
    div [ class "job-section" ] (getJobById build.jobId |> Maybe.map (\j -> j.studyIdList) |> Maybe.withDefault [] |> List.map getStudyById |> List.map (\s -> Maybe.map viewStudy s |> Maybe.withDefault viewNoData))
