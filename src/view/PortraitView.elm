module PortraitView exposing (..)

import Character exposing (..)
import CharacterSkill exposing (..)
import Crest exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


viewPortrait : ( Model, CharacterBuild ) -> Html Msg
viewPortrait ( model, element ) =
    let
        character =
            getCharacterById element.idCharacter
                |> Maybe.withDefault (Character -1 "" Male 0 NonOwner 0)
    in
    div
        [ class "item-a1" ]
        [ viewPortraitTile character
        , viewCharacterSkill ( model, character.characterSkillId )
        , viewCrestTile ( model, character.crestId )
        ]


viewPortraitTile : Character -> Html Msg
viewPortraitTile element =
    div
        [ class "item-a1a card" ]
        [ getPortrait element.id
        , div [ class "card-text" ] [ text element.name ]
        ]


getPortrait : Int -> Html Msg
getPortrait id =
    img
        [ class "portrait-picture tile-clickable card-img-top"
        , src ("resources/img/portraits/" ++ String.fromInt id ++ ".png")
        , width 100
        , height 100
        ]
        []


viewCharacterSkill : ( Model, Int ) -> Html Msg
viewCharacterSkill ( model, id ) =
    let
        characterSkill =
            getCharacterSkillById id
    in
    case characterSkill of
        Just value ->
            div [ class "item-a1b card qs" ]
                [ getSkillCharacterPicture ( model, value.pictureId )
                , div
                    [ class "card-text" ]
                    [ text value.name ]
                , div
                    [ class "custom-popover above" ]
                    [ div [ class "popover-title" ] [ text ("[" ++ value.name ++ "]") ]
                    , div [ class "popover-text" ] [ text value.description ]
                    ]
                ]

        Nothing ->
            div [ class "item-a1b" ] [ text "Character not found" ]


getSkillCharacterPicture : ( Model, Int ) -> Html Msg
getSkillCharacterPicture ( model, id ) =
    div
        [ class "cskill-picture card-img-top"
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt id ++ ".png\")")
        ]
        []


viewCrestTile : ( Model, Int ) -> Html Msg
viewCrestTile ( model, id ) =
    let
        maybeCrest =
            getCrest id
    in
    case maybeCrest of
        Just value ->
            div [ class "item-a1c card qs" ]
                [ getCrestPicture ( model, value.pictureId )
                , div
                    [ class "card-text" ]
                    [ text value.name ]
                , div
                    [ class "custom-popover above" ]
                    [ div [ class "popover-title" ] [ text ("[" ++ value.name ++ "]") ]
                    , div [ class "popover-text" ] [ text value.description ]
                    ]
                ]

        Nothing ->
            div [ class "item-a1c" ] []


getCrestPicture : ( Model, Int ) -> Html Msg
getCrestPicture ( model, id ) =
    div
        [ class "crest-picture card-img-top"
        , style "content" ("url(\"resources/img/crests/" ++ String.fromInt id ++ ".png\")")
        ]
        []
