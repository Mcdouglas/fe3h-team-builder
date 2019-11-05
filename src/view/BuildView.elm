module BuildView exposing (..)

import Character exposing (..)
import CharacterView exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (BuildInfo(..), CharacterModal(..), Msg(..))
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
viewBuild model ( idx, element ) =
    div [ class "item-a" ]
        [ sectionCharacter model ( idx, element )
        , sectionPassiveSkills model element
        , sectionActiveSkills model element
        , sectionJob model element
        , buttonBuildInfo element
        ]


sectionCharacter : Model -> ( Int, Build ) -> Html Msg
sectionCharacter model ( id, element ) =
    let
        character =
            getCharacterById element.idCharacter
                |> Maybe.withDefault (Character -1 "" Male 0 NonOwner 0 Nothing)
    in
    div
        [ class "item-a1" ]
        [ div [ onClick (CModalMsg (OpenCharacterModal ( id, character ))) ] [ viewPortraitTile character ]
        , div [ class "item-a1b" ]
            [ viewCharacterSkill model character.characterSkillId
            , viewCrestTile model character.crestId
            ]
        ]


sectionPassiveSkills : Model -> Build -> Html Msg
sectionPassiveSkills model build =
    let
        defaultValue idx = (idx, -1, Nothing)

        listPassiveSkill = build.listPassiveSkill
            |> List.map (\(idx, skillId, skillType) -> (idx, skillId, (getSkillByType skillId skillType)))
            |> List.foldr (::) [ (defaultValue 0), (defaultValue 1), (defaultValue 2), (defaultValue 3), (defaultValue 4)]
            |> List.take 5

    in
    div [ class "item-a2" ]
        (List.map (\e -> viewSkill model e) listPassiveSkill)


sectionActiveSkills : Model -> Build -> Html Msg
sectionActiveSkills model build =
    let
        defaultValue idx = (idx, -1, Nothing)

        listActiveSkill = build.listActiveSkill
            |> List.map (\(idx, skillId, skillType) -> (idx, skillId, (getSkillByType skillId skillType)))
            |> List.foldr (::) [ (defaultValue 0), (defaultValue 1), (defaultValue 2) ]
            |> List.take 3
    in
    div [ class "item-a3" ]
        (List.map (\e -> viewSkill model e) listActiveSkill)


sectionJob : Model -> Build -> Html Msg
sectionJob model build =
    let
        job =
            getJobById build.jobId

        listJobSkill =
            job |> Maybe.map (\e -> getJobSkillsByJob e.id) |> Maybe.withDefault []
    in
    div [ class "item-a4" ]
        [ viewJob model job
        , div [ class "item-a4b" ] (listJobSkill |> List.map (\e -> viewJobSkill e))
        ]


buttonBuildInfo : Build -> Html Msg
buttonBuildInfo build =
    let
        infoShown =
            not build.hiddenInfo
    in
    div
        [ onClick (BInfoMsg (ToggleBuildInfo build.idCharacter))
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
