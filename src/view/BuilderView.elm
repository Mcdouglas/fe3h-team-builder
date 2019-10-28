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
        (List.map (\( id, e ) -> viewSelector ( model, e )) model.team)


viewSelector : ( Model, Maybe CharacterBuild ) -> Html Msg
viewSelector ( model, element ) =
    case element of
        Just value ->
            div [ class "c-container" ]
                [ viewRow ( model, value )
                , viewBuildInfo value
                , div [ class "item-c" ] [ text "TODO" ]
                ]

        Nothing ->
            div [ class "item-a" ] [ text "TODO Add new player" ]


viewRow : ( Model, CharacterBuild ) -> Html Msg
viewRow ( model, element ) =
    div [ class "item-a" ]
        [ viewPortrait ( model, element )
        , viewPassiveSkills ( model, element )
        , viewActiveSkills ( model, element )
        , viewJobSkills ( model, element )
        , toggleBuildInfo element
        ]
