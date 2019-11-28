module TeamBuilder exposing (..)

import BuildInfoView exposing (..)
import BuildView exposing (..)
import CharacterModal exposing (modalCharacterPicker)
import CustomTypes exposing (..)
import GlobalMessage exposing (BuildPanel(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import JobModal exposing (modalJobPicker)
import SkillModal exposing (modalSkillPicker)


viewBuilder : Model -> Html Msg
viewBuilder model =
    div []
        [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTeam model
        , modalCharacterPicker model
        , modalSkillPicker model
        , modalJobPicker model
        ]


viewTeam : Model -> Html Msg
viewTeam model =
    let
        addBuildButton =
            if (model.team |> List.length) < 12 then
                div [ class "add-build", onClick (BuildMsg AddBuild) ] []

            else
                div [] []
    in
    div [ class "c-table" ]
        ((model.team
            |> List.sortWith (\t1 t2 -> compare (Tuple.first t1) (Tuple.first t2))
            |> List.map (\e -> viewRow model e)
         )
            ++ [ addBuildButton ]
        )


viewRow : Model -> ( Int, Build ) -> Html Msg
viewRow model ( idx, build ) =
    div [ class "c-container" ]
        [ viewBuild model ( idx, build )
        , sectionBuildInfo build
        , controlPanel model idx
        ]
