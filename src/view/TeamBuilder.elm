module TeamBuilder exposing (..)

import Browser.Navigation as Nav
import BuildInfoView exposing (..)
import BuildView exposing (..)
import CharacterModal exposing (modalCharacterPicker)
import CustomTypes exposing (..)
import Dict exposing (Dict)
import GlobalMessage exposing (BuildPanel(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import JobModal exposing (modalJobPicker)
import SkillModal exposing (modalSkillPicker)
import Url exposing (..)


viewBuilder : Model -> Html Msg
viewBuilder model =
    div []
        [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , h4 [] [ text (Url.toString model.url) ]
        , h4 [] [ text (model.url.query |> Maybe.withDefault "...") ]
<<<<<<< HEAD
=======
        , button [ onClick (RewriteUrl "Bite") ] [ text "test" ]
>>>>>>> Read url + rewrite url
        , viewTeam model
        , modalCharacterPicker model
        , modalSkillPicker model
        , modalJobPicker model
        ]


viewTeam : Model -> Html Msg
viewTeam model =
    let
        addBuildButton =
            if Dict.size model.team < 12 then
                div [ class "add-build", onClick (BuildMsg AddBuild) ] []

            else
                div [] []
    in
    div [ class "c-table" ]
        ((model.team
            |> Dict.toList
            |> List.sortWith (\t1 t2 -> compare (Tuple.first t1) (Tuple.first t2))
            |> List.map (\e -> viewRow model e)
         )
            ++ [ addBuildButton ]
        )


viewRow : Model -> ( Int, Build ) -> Html Msg
viewRow model ( idx, build ) =
    div [ class "c-container" ]
        [ viewBuild model ( idx, build )
        , sectionBuildInfo build
        , controlPanel model idx
        ]
