module JobView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Job exposing (..)
import JobSkill exposing (..)


viewJobSkills : ( Model, CharacterBuild ) -> Html Msg
viewJobSkills ( model, element ) =
    let
        job =
            getJobById element.jobId

        listJobSkill =
            job |> Maybe.map (\e -> getJobSkillsByJob e.id) |> Maybe.withDefault []
    in
    div [ class "item-a4" ]
        [ text (job |> Maybe.map (\e -> e.name) |> Maybe.withDefault "No data")
        , div [] (listJobSkill |> List.map (\e -> viewJobSkill e))
        ]


viewJobSkill : JobSkill -> Html Msg
viewJobSkill element =
    case element.combatArt of
        True ->
            div []
                [ getSkillJobActivePicture element.pictureId
                , text element.name
                ]

        False ->
            div []
                [ getSkillJobPassivePicture element.pictureId
                , text element.name
                ]


getSkillJobPassivePicture : Int -> Html Msg
getSkillJobPassivePicture id =
    img [ src ("resources/img/skills/" ++ String.fromInt id ++ ".png"), width 50, height 50 ] []


getSkillJobActivePicture : Int -> Html Msg
getSkillJobActivePicture id =
    img [ src ("resources/img/skills/" ++ String.fromInt id ++ ".png"), width 50, height 50 ] []
