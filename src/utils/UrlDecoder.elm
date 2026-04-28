module UrlDecoder exposing (decodeUrlInTeam, encodeTeamInUrl)

import CustomTypes exposing (Build, SkillType(..))
import Dict exposing (Dict(..))
import GlobalModel exposing (Model)
import Hex exposing (fromString)


decodeUrlInTeam : String -> Dict Int Build
decodeUrlInTeam url =
    String.split "#" url
        |> List.tail
        |> Maybe.withDefault []
        |> List.map (\s -> decodeUrlInBuild s)
        |> List.indexedMap Tuple.pair
        |> Dict.fromList


decodeUrlInBuild : String -> Build
decodeUrlInBuild segment =
    let
        characterId =
            segment |> String.slice 0 2 |> Hex.fromString |> Result.withDefault 0

        listPassiveSkillId =
            String.slice 3 22 segment |> String.split "%" |> List.map (\s -> decodeUrlInSkill s) |> List.indexedMap Tuple.pair |> List.map (\( id, ( skillId, skillType ) ) -> ( id, skillId, skillType ))

        listActiveSkillId =
            String.slice 23 34 segment |> String.split "%" |> List.map (\s -> decodeUrlInSkill s) |> List.indexedMap Tuple.pair |> List.map (\( id, ( skillId, skillType ) ) -> ( id, skillId, skillType ))

        jobId =
            String.slice 35 37 segment |> Hex.fromString |> Result.withDefault 0

        buildHidden =
            String.slice 37 38 segment == "h"
    in
    Build characterId listPassiveSkillId listActiveSkillId jobId buildHidden


decodeUrlInSkill : String -> ( Int, SkillType )
decodeUrlInSkill segment =
    let
        skillType =
            case String.slice 0 1 segment of
                "m" ->
                    MasteryType

                "s" ->
                    StandardType

                _ ->
                    NoType

        skillId =
            String.slice 1 3 segment |> Hex.fromString |> Result.withDefault 0
    in
    ( skillId, skillType )


encodeTeamInUrl : Model -> String
encodeTeamInUrl model =
    model.team
        |> Dict.values
        |> List.map (\v -> encodeBuildInQuerySegment v)
        |> List.foldr (++) ""


encodeBuildInQuerySegment : Build -> String
encodeBuildInQuerySegment build =
    let
        charInHex =
            intToHex build.idCharacter ++ "%"

        listPassiveSkillHex =
            build.listPassiveSkill
                |> List.map (\( _, skillId, skillType ) -> encodeSkillTypeToString skillType ++ (intToHex skillId ++ "%"))
                |> List.foldr (++) ""

        listActiveSkillHex =
            build.listActiveSkill
                |> List.map (\( _, skillId, skillType ) -> encodeSkillTypeToString skillType ++ (intToHex skillId ++ "%"))
                |> List.foldr (++) ""

        jobInHex =
            intToHex build.jobId

        buildHidden =
            if build.hiddenInfo then
                "h"

            else
                "s"
    in
    "#" ++ charInHex ++ listPassiveSkillHex ++ listActiveSkillHex ++ jobInHex ++ buildHidden


encodeSkillTypeToString : SkillType -> String
encodeSkillTypeToString skillType =
    case skillType of
        MasteryType ->
            "m"

        StandardType ->
            "s"

        _ ->
            "a"


intToHex : Int -> String
intToHex value =
    let
        hexValue =
            Hex.toString value
    in
    if String.length hexValue > 1 then
        hexValue

    else
        "0" ++ hexValue
