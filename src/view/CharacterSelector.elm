module CharacterSelector exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseOver)
import PortraitView exposing (..)


viewCharacterModal : Model -> Html Msg
viewCharacterModal model =
    let
        ( position, maybeCharacter ) =
            model.view.currentCharacter
    in
    case maybeCharacter of
        Just character ->
            div
                [ class "modal"
                , hidden (not model.view.characterSelectorIsOpen)
                ]
                [ div [ class "modal-content" ]
                    [ div [ class "characters-grid" ]
                        (model.data.characters
                            |> List.map (\e -> viewSelectCharacter ( model, ( position, e ) ))
                        )
                    , div [ class "character-detail" ]
                        [ div
                            [ onClick CloseCharacterModal
                            , class "close close-modal"
                            , style "content" "url(\"resources/lib/octicons/x.svg\")"
                            ]
                            []
                        , h3 [] [ text character.name ]
                        ]
                    ]
                ]

        Nothing ->
            div [] []


viewSelectCharacter : ( Model, ( Int, Character ) ) -> Html Msg
viewSelectCharacter ( model, ( position, element ) ) =
    div
        [ onMouseOver (UpdateCharacterModal ( position, Just element ))
        , onClick (UpdateBuild ( position, element ))
        ]
        [ viewPortraitTile ( position, element ) element
        ]
