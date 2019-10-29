module CharacterModalView exposing (..)

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
            model.currentCharacter
    in
    case maybeCharacter of
        Just character ->
            div
                [ class "modal"
                , hidden (not model.characterModalOpen)
                ]
                [ div [ class "modal-content" ]
                    [ div [ class "characters-grid" ]
                        (model.dataModel.characters
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
    div [ onMouseOver (ShowCharacterModal ( position, Just element )) ]
        [ viewPortraitTile ( position, element ) element
        ]
