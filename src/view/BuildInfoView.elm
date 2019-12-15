module BuildInfoView exposing (..)

import Character exposing (getCharacterByDefault, getCharacterById)
import CustomTypes exposing (..)
import Dict exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
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
        [ sectionCharacter model idx character ]


sectionCharacter : Model -> Int -> Character -> Html Msg
sectionCharacter model idx character =
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
