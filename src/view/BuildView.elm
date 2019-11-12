module BuildView exposing (..)

import Character exposing (..)
import CharacterView exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (BuildInfo(..), Msg(..))
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
    div [ class "item-a" ]
        [ sectionCharacter model ( idx, build )
        , sectionPassiveSkills model ( idx, build )
        , sectionActiveSkills model ( idx, build )
        , sectionJob model build
        , buttonBuildInfo build
        ]


sectionCharacter : Model -> ( Int, Build ) -> Html Msg
sectionCharacter model ( idx, build ) =
    let
        character =
            getCharacterById build.idCharacter
                |> Maybe.withDefault (Character -1 "" Male 0 NonOwner 0 Nothing)
    in
    div
        [ class "item-a1" ]
        [ viewCharacterTile idx character
        , div [ class "item-a1b" ]
            [ viewCharacterSkillTile model character.characterSkillId
            , viewCrestTile model character.crestId
            ]
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
        (List.map (\e -> viewSkill model e) listPassiveSkill)


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
        [ buttonJob model job
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
