module ViewJob exposing (..)

import CustomTypes exposing (..)
import JobSkill exposing (..)
import Html exposing (..)
import DataBuilder exposing (Msg(..))

viewJobSkill : CharacterBuild -> Html Msg
viewJobSkill element = 
    let
        jobSkill = getJobSkillById element.jobId
    in
    div [] [
        jobSkill |> Maybe.map (\e -> e.name) |> Maybe.withDefault "No data" |> text
    ]