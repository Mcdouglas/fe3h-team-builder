module TeamBuilder exposing (..)

import CharacterSelector exposing (..)
import CharacterView exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import HiddenInfo exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import JobView exposing (..)
import SkillView exposing (..)


viewBuilder : Model -> Html Msg
viewBuilder model =
    div []
        [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTeam model
        , viewCharacterSelector model
        ]


viewTeam : Model -> Html Msg
viewTeam model =
    div [ class "c-table" ]
        (model.team
            |> List.sortWith (\t1 t2 -> compare (Tuple.first t1) (Tuple.first t2))
            |> List.map (\e -> viewRow model e)
        )


viewRow : Model -> ( Int, CharacterBuild ) -> Html Msg
viewRow model ( position, element ) =
    div [ class "c-container" ]
        [ viewBuild model ( position, element )
        , viewBuildInfo element
        , div [ class "item-c" ] [ text "TODO" ]
        ]


viewBuild : Model -> ( Int, CharacterBuild ) -> Html Msg
viewBuild model ( position, element ) =
    div [ class "item-a" ]
        [ viewPortrait model ( position, element )
        , viewPassiveSkills model element
        , viewActiveSkills model element
        , viewJobSkills model element
        , buttonBuildInfo element
        ]
