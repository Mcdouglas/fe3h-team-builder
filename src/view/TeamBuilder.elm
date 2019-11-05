module TeamBuilder exposing (..)

import BuildInfoView exposing (..)
import BuildView exposing (..)
import CharacterModal exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import SkillModal exposing (..)


viewBuilder : Model -> Html Msg
viewBuilder model =
    div []
        [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTeam model
        , modalCharacterPicker model
        , modalSkillPicker model
        ]


viewTeam : Model -> Html Msg
viewTeam model =
    div [ class "c-table" ]
        (model.team
            |> List.sortWith (\t1 t2 -> compare (Tuple.first t1) (Tuple.first t2))
            |> List.map (\e -> viewRow model e)
        )


viewRow : Model -> ( Int, Build ) -> Html Msg
viewRow model ( idx, element ) =
    div [ class "c-container" ]
        [ viewBuild model ( idx, element )
        , sectionBuildInfo element
        , div [ class "item-c" ] [ text "TODO" ]
        ]
