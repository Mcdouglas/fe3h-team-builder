module CharacterView exposing (..)

import Character exposing (..)
import CharacterSkill exposing (..)
import Crest exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (CharacterModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


viewPortrait : Model -> ( Int, Build ) -> Html Msg
viewPortrait model ( id, element ) =
    let
        character =
            getCharacterById element.idCharacter
                |> Maybe.withDefault (Character -1 "" Male 0 NonOwner 0 Nothing)
    in
    div
        [ class "item-a1" ]
        [ div [ onClick (CModalMsg (OpenCharacterModal ( id, character ))) ] [ viewPortraitTile character ]
        , div [ class "item-a1b" ]
            [ viewCharacterSkill model character.characterSkillId
            , viewCrestTile model character.crestId
            ]
        ]


viewPortraitTile : Character -> Html Msg
viewPortraitTile element =
    div
        [ class "item-a1a" ]
        [ getPortrait element
        , p [] [ text element.name ]
        ]


getPortrait : Character -> Html Msg
getPortrait element =
    img
        [ class "portrait-picture button-clickable"
        , src ("resources/img/portraits/" ++ String.fromInt element.id ++ ".png")
        ]
        []


viewCharacterSkill : Model -> Int -> Html Msg
viewCharacterSkill model id =
    let
        characterSkill =
            getCharacterSkillById id
    in
    case characterSkill of
        Just value ->
            div []
                [ getSkillCharacterPicture model value.pictureId
                , p
                    []
                    [ text value.name ]
                , div
                    [ class "custom-popover above" ]
                    [ p [ class "popover-title" ] [ text ("[" ++ value.name ++ "]") ]
                    , p [ class "popover-text" ] [ text value.description ]
                    ]
                ]

        Nothing ->
            p [] [ text "Character not found" ]


getSkillCharacterPicture : Model -> Int -> Html Msg
getSkillCharacterPicture model pictureId =
    div
        [ class "cskill-picture qs"
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt pictureId ++ ".png\")")
        ]
        []


viewCrestTile : Model -> Int -> Html Msg
viewCrestTile model crestId =
    let
        maybeCrest =
            getCrest crestId
    in
    case maybeCrest of
        Just crest ->
            div []
                [ getCrestPicture crest.pictureId
                , p
                    []
                    [ text crest.name ]
                , div
                    [ class "custom-popover above" ]
                    [ p [ class "popover-title" ] [ text ("[" ++ crest.name ++ "]") ]
                    , p [ class "popover-text" ] [ text crest.description ]
                    ]
                ]

        Nothing ->
            div []
                [ div [ class "crest-picture no-crest" ] []
                , p [] [ text "No crest" ]
                ]


getCrestPicture : Int -> Html Msg
getCrestPicture id =
    div
        [ class "crest-picture qs"
        , style "content" ("url(\"resources/img/crests/" ++ String.fromInt id ++ ".png\")")
        ]
        []
