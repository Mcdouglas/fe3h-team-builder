module CharacterView exposing (..)

import CharacterSkill exposing (getCharacterSkillById)
import Crest exposing (getCrest)
import CustomTypes exposing (..)
import GlobalMessage exposing (CharacterModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


viewCharacterTile : Int -> Character -> Html Msg
viewCharacterTile idx character =
    let
        onClickEvent =
            onClick (CModalMsg (OpenCharacterModal idx))
    in
    div [ class "item-a1a" ] [ getCharacterPicture character.id onClickEvent, p [] [ text character.name ] ]


getCharacterPicture : Int -> Attribute Msg -> Html Msg
getCharacterPicture pictureId onClickEvent =
    img
        [ class "portrait-picture button-clickable"
        , src ("resources/img/portraits/" ++ String.fromInt pictureId ++ ".png")
        , onClickEvent
        ]
        []


viewCharacterSkillTile : Model -> Int -> Html Msg
viewCharacterSkillTile model id =
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
