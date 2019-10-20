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
        [ h3 [] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTable model.team
        ]


viewTable : List ( Int, Maybe CharacterBuild ) -> Html Msg
viewTable team =
    ul [ class "list-group mx-2" ]
        (List.map (\( id, e ) -> viewSelector e) team)


viewSelector : Maybe CharacterBuild -> Html Msg
viewSelector element =
    case element of
        Just value ->
            viewRow value

        Nothing ->
            div [ class "container mt-3" ]
                [ li [ class "list-group-item list-group-item-secondary" ] [ text "TODO Add new player" ] ]


viewRow : CharacterBuild -> Html Msg
viewRow element =
    div [ class "container mt-3" ]
        [ div [ class "list-group-item" ]
            [ li [ class "row" ]
                [ viewPortrait element
                , viewPassiveSkills element
                , viewActiveSkills element
                , viewJobSkills element
                ]
            , toggleBuildInfo element
            ]
        , viewBuildInfo element
        ]
