module ViewBuilder exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import DataBuilder exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Stringable exposing (..)
import ViewPortrait exposing (..)


viewPlanner : Model -> Html Msg
viewPlanner model =
    div [ class "planner" ]
        [ h3 [] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTable model.builderModel
        ]


viewTable : BuilderModel -> Html Msg
viewTable model =
    div [ class "container" ]
        (List.map viewRow model.team)


viewRow : CharacterBuild -> Html Msg
viewRow element =
    let
        id =
            String.fromInt element.idCharacter

        character =
            getCharacterById element.idCharacter
                |> Maybe.withDefault (Character 0 "" Male 0)
    in
    div [ class "row" ]
        [ viewPortrait character
        , div [] [ text character.name ]
        , div [] [ text (genderToString character.gender) ]
        ]
