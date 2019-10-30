module TeamBuilder exposing (..)

import CharacterSelector exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import HiddenInfo exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import JobView exposing (..)
import PortraitView exposing (..)
import SkillView exposing (..)


viewPlanner : Model -> Html Msg
viewPlanner model =
    div []
        [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTable model
        , viewCharacterSelector model
        ]


viewTable : Model -> Html Msg
viewTable model =
    div [ class "c-table" ]
        (model.team
            |> List.sortWith (\t1 t2 -> compare (Tuple.first t1) (Tuple.first t2))
            |> List.map (\e -> viewSelector ( model, e ))
        )


viewSelector : ( Model, ( Int, CharacterBuild ) ) -> Html Msg
viewSelector ( model, ( position, element ) ) =
    div [ class "c-container" ]
        [ viewRow ( model, ( position, element ) )
        , viewBuildInfo element
        , div [ class "item-c" ] [ text "TODO" ]
        ]


viewRow : ( Model, ( Int, CharacterBuild ) ) -> Html Msg
viewRow ( model, ( position, element ) ) =
    div [ class "item-a" ]
        [ viewPortrait ( model, ( position, element ) )
        , viewPassiveSkills ( model, element )
        , viewActiveSkills ( model, element )
        , viewJobSkills ( model, element )
        , toggleBuildInfo element
        ]
