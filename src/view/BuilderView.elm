module BuilderView exposing (..)

import BuilderExpandedView exposing (..)
import CharacterModalView exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import JobView exposing (..)
import PortraitView exposing (..)
import SkillView exposing (..)
import Stringable exposing (..)


viewPlanner : Model -> Html Msg
viewPlanner model =
    div []
        [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTable model
        , viewCharacterModal model
        ]


viewTable : Model -> Html Msg
viewTable model =
    div [ class "c-table" ]
        (model.team
            |> List.sortWith (\t1 t2 -> compare (Tuple.first t1) (Tuple.first t2))
            |> List.map (\( id, e ) -> viewSelector ( model, e ))
        )


viewSelector : ( Model, CharacterBuild ) -> Html Msg
viewSelector ( model, element ) =
    div [ class "c-container" ]
        [ viewRow ( model, element )
        , viewBuildInfo element
        , div [ class "item-c" ] [ text "TODO" ]
        ]


viewRow : ( Model, CharacterBuild ) -> Html Msg
viewRow ( model, element ) =
    div [ class "item-a" ]
        [ viewPortrait ( model, element )
        , viewPassiveSkills ( model, element )
        , viewActiveSkills ( model, element )
        , viewJobSkills ( model, element )
        , toggleBuildInfo element
        ]
