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


viewTable : List (Maybe CharacterBuild) -> Html Msg
viewTable team =
    ul [ class "list-group mx-2" ]
        (List.map (\e -> viewSelector ( team, e )) team)


viewSelector : ( List (Maybe CharacterBuild), Maybe CharacterBuild ) -> Html Msg
viewSelector ( model, element ) =
    case element of
        Just value ->
            viewRow value

        Nothing ->
            li [ class "list-group-item mt-3 list-group-item-secondary" ] [ text "TODO" ]


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
            ]
        , toggleBuildInfo element
        , viewBuildInfo element
        ]
