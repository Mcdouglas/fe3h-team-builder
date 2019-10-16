module ViewBuilder exposing (..)

import CustomTypes exposing (..)
import DataBuilder exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Stringable exposing (..)
import ViewPortrait exposing (..)
import ViewSkill exposing (..)
import ViewJob exposing (..)


viewPlanner : Model -> Html Msg
viewPlanner model =
    div [ class "planner" ]
        [ h3 [] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTable model.builderModel
        ]


viewTable : BuilderModel -> Html Msg
viewTable model =
    div [ class "container" ]
        (List.map (\e -> selectView ( model, e )) model.team)


selectView : ( BuilderModel, Maybe CharacterBuild ) -> Html Msg
selectView ( model, element ) =
    case element of
        Just value ->
            viewRow value

        Nothing ->
            div [] [ text "TODO" ]


viewRow : CharacterBuild -> Html Msg
viewRow element =
    div [ class "row" ] 
        [ viewPortrait element
        , viewPassiveSkills element
        , viewActiveSkills element
        , viewJobSkill element
        ]
