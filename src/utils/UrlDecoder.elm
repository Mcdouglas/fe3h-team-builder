module UrlDecoder exposing (..)

import CustomTypes exposing (..)
import Dict exposing (..)
import GlobalModel exposing (..)
import Hex exposing (..)
import Maybe.Extra exposing (..)
import Url exposing (..)


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
            "c" ++ intToHex build.idCharacter

        listPassiveSkillHex =
            "s"
                ++ (build.listPassiveSkill
                        |> List.map (\( _, skillId, _ ) -> intToHex (skillId + 1))
                        |> List.foldr (++) ""
                   )

        listActiveSkillHex =
            "a"
                ++ (build.listActiveSkill
                        |> List.map (\( _, skillId, _ ) -> intToHex (skillId + 1))
                        |> List.foldr (++) ""
                   )

        jobInHex =
            "j" ++ intToHex (build.jobId + 1)
    in
    "#h" ++ charInHex ++ listPassiveSkillHex ++ listActiveSkillHex ++ jobInHex


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
