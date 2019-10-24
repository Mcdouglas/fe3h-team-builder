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
    div []
        [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTable model
        ]


viewTable : Model -> Html Msg
viewTable model =
    div []
        (List.map (\( id, e ) -> viewSelector ( model, e )) model.team)


viewSelector : ( Model, Maybe CharacterBuild ) -> Html Msg
viewSelector ( model, element ) =
    case element of
        Just value ->
            div [ class "c-container" ] [ viewRow ( model, value )
                , div [ class "item-b" ] [text "TODO" ]]

        Nothing ->
            div [ class "item-a" ] [ text "TODO Add new player" ]


viewRow : ( Model, CharacterBuild ) -> Html Msg
viewRow ( model, element ) =
    div [ class "item-a" ]
        [ div []
            [ div []
                [ viewPortrait ( model, element )
                , viewPassiveSkills ( model, element )
                , viewActiveSkills ( model, element )
                , viewJobSkills ( model, element )
                ]
            , toggleBuildInfo element
            ]
        , viewBuildInfo element
        ]
