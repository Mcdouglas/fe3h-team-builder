module CharacterModalView exposing (..)

import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


viewCharacterModal : Model -> Html Msg
viewCharacterModal model =
    div
        [ class "modal"
        , hidden (not model.characterModalOpen)
        ]
        [ div [ class "modal-content" ]
            [ div [ onClick CloseCharacterModal, class "close" ] [ text "X" ]
            , text "Some text in the Modal..."
            ]
        ]
