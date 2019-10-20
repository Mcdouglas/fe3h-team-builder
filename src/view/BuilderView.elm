module BuilderView exposing (..)

import BuilderExpandedView exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import JobView exposing (..)
import PortraitView exposing (..)
import SkillView exposing (..)
import Stringable exposing (..)


viewPlanner : Model -> Html Msg
viewPlanner model =
    div [ class "planner" ]
        [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTable model
        ]


viewTable : Model -> Html Msg
viewTable model =
    ul [ class "list-group mx-2" ]
        (List.map (\( id, e ) -> viewSelector ( model, e )) model.team)


viewSelector : ( Model, Maybe CharacterBuild ) -> Html Msg
viewSelector ( model, element ) =
    case element of
        Just value ->
            viewRow ( model, value )

        Nothing ->
            div [ class "container mt-3" ]
                [ li [ class "list-group-item list-group-item-secondary" ] [ text "TODO Add new player" ] ]


viewRow : ( Model, CharacterBuild ) -> Html Msg
viewRow ( model, element ) =
    div [ class "container mt-3" ]
        [ div [ class "list-group-item" ]
            [ li [ class "row" ]
                [ viewPortrait ( model, element )
                , viewPassiveSkills ( model, element )
                , viewActiveSkills ( model, element )
                , viewJobSkills ( model, element )
                ]
            , toggleBuildInfo element
            ]
        , viewBuildInfo element
        ]
