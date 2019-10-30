module CharacterSelector exposing (..)

import CharacterSkill exposing (..)
import CharacterView exposing (..)
import Crest exposing (..)
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
                    , viewSideBar model character
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


viewSideBar : Model -> Character -> Html Msg
viewSideBar model character =
    div [ class "sidebar" ]
        [ buttonCloseModal
        , viewCharacterDetail model character
        ]


viewCharacterDetail : Model -> Character -> Html Msg
viewCharacterDetail model character =
    div [ class "character-detail" ]
        [ h3 [] [ text character.name ]
        , viewCharacterSkillDetail model character.characterSkillId
        , viewCharacterCrestDetail model character.crestId
        ]


viewCharacterSkillDetail : Model -> Int -> Html Msg
viewCharacterSkillDetail model skillId =
    let
        skill =
            getCharacterSkillById skillId
    in
    case skill of
        Just value ->
            div []
                [ div [ class "detail-title" ]
                    [ getSkillCharacterPicture model value.pictureId
                    , div [] [ text ("[ " ++ value.name ++ " ]") ]
                    ]
                , div [ class "detail-text" ] [ text value.description ]
                ]

        Nothing ->
            div [] [ text "CharacterSkillNotFound" ]


viewCharacterCrestDetail : Model -> Int -> Html Msg
viewCharacterCrestDetail model crestId =
    let
        crest =
            getCrest crestId
    in
    case crest of
        Just value ->
            div []
                [ div [ class "detail-title" ]
                    [ getCrestPicture model value.pictureId
                    , div [] [ text ("[ " ++ value.name ++ " ]") ]
                    ]
                , div [ class "detail-text" ] [ text value.description ]
                ]

        Nothing ->
            div []
                [ div [ class "detail-title" ]
                    [ div [ class "crest-picture no-crest" ] []
                    , div [] [ text "No crest" ]
                    ]
                ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick CloseCharacterSelector
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
