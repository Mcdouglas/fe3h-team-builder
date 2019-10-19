module ViewJob exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Job exposing (..)
import JobSkill exposing (..)


viewJobSkills : CharacterBuild -> Html Msg
viewJobSkills element =
    let
        job =
            getJobById element.jobId

        listJobSkill =
            job |> Maybe.map (\e -> getJobSkillsByJob e.id) |> Maybe.withDefault []
    in
    div []
        [ text (job |> Maybe.map (\e -> e.name) |> Maybe.withDefault "No data")
        , div [] (listJobSkill |> List.map (\e -> viewJobSkill e))
        ]


viewJobSkill : JobSkill -> Html Msg
viewJobSkill element =
    case element.combatArt of
        True ->
            div []
                [ getSkillJobActivePicture element.id
                , text element.name
                ]

        False ->
            div []
                [ getSkillJobPassivePicture element.id
                , text element.name
                ]


getSkillJobPassivePicture : Int -> Html Msg
getSkillJobPassivePicture id =
    img [ src ("resources/img/skill_job/" ++ String.fromInt id ++ ".png"), width 50, height 50 ] []


getSkillJobActivePicture : Int -> Html Msg
getSkillJobActivePicture id =
    img [ src ("resources/img/portraits/" ++ String.fromInt id ++ ".png"), width 50, height 50 ] []
