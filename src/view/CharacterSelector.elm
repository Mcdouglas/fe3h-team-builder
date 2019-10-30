module CharacterSelector exposing (..)

import CharacterView exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseOver)


viewCharacterSelector : Model -> Html Msg
viewCharacterSelector model =
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
                    [ viewCharacterGrid model ( position, character )
                    , viewCharacterDetail model character
                    ]
                ]

        Nothing ->
            div [] []


viewCharacterGrid : Model -> ( Int, Character ) -> Html Msg
viewCharacterGrid model ( position, _ ) =
    div [ class "characters-grid" ]
        (model.data.characters
            |> List.map (\e -> viewSelectCharacter model ( position, e ))
        )


viewSelectCharacter : Model -> ( Int, Character ) -> Html Msg
viewSelectCharacter model ( position, element ) =
    div
        [ onMouseOver (UpdateCharacterSelector ( position, Just element ))
        , onClick (UpdateBuild ( position, element ))
        ]
        [ viewPortraitTile ( position, element ) element
        ]


viewCharacterDetail : Model -> Character -> Html Msg
viewCharacterDetail model character =
    div [ class "character-detail" ]
        [ buttonCloseModal
        , h3 [] [ text character.name ]
        , viewCharacterSkill model character.characterSkillId
        , viewCrestTile model character.crestId
        ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick CloseCharacterSelector
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
