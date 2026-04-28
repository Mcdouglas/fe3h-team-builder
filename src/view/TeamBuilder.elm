module TeamBuilder exposing (viewBuilder)

import BuildInfoView exposing (sectionBuildInfo)
import BuildView exposing (controlPanel, viewBuild)
import CharacterModal exposing (modalCharacterPicker)
import CustomTypes exposing (Build)
import Dict exposing (Dict(..))
import GlobalMessage exposing (BuildPanel(..), Msg(..))
import GlobalModel exposing (Model)
import Html exposing (Html, button, div, h3, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import JobModal exposing (modalJobPicker)
import SkillModal exposing (modalSkillPicker)

viewBuilder : Model -> Html Msg
viewBuilder model =
    div []
        [ div [ style "display" "flex", style "justify-content" "space-between", style "align-items" "center" ] 
            [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
            , viewSaveLoad
            ]
        , viewTeam model
        , modalCharacterPicker model
        , modalSkillPicker model
        , modalJobPicker model
        ]


viewSaveLoad : Html Msg
viewSaveLoad =
    div [ style "margin-bottom" "1rem" ]
        [ button [ class "btn btn-primary", style "margin-right" "0.5rem", onClick SaveTeam ] [ text "Sauvegarder" ]
        , button [ class "btn btn-secondary", onClick LoadTeamRequest ] [ text "Charger" ]
        ]


viewTeam : Model -> Html Msg
viewTeam model =
    let
        addBuildButton =
            if Dict.size model.team < 15 then
                div [ class "add-build", onClick (BuildMsg AddBuild) ] []

            else
                div [] []
    in
    div [ class "c-table" ]
        ((model.team
            |> Dict.toList
            |> List.sortWith (\t1 t2 -> compare (Tuple.first t1) (Tuple.first t2))
            |> List.map (\e -> viewRow model e)
         )
            ++ [ addBuildButton ]
        )


viewRow : Model -> ( Int, Build ) -> Html Msg
viewRow model ( idx, build ) =
    div [ class "c-container" ]
        [ viewBuild ( idx, build )
        , sectionBuildInfo build
        , controlPanel model idx
        ]
