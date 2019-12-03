module CharacterView exposing (..)

import CharacterSkill exposing (getCharacterSkillById)
import Crest exposing (getCrest)
import CustomTypes exposing (..)
import GlobalMessage exposing (CharacterModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Popover exposing (..)


sectionCharacter : Model -> Int -> Maybe Character -> Html Msg
sectionCharacter model idx maybeCharacter =
    case maybeCharacter of
        Just character ->
            div
                [ class "item-a1" ]
                [ buttonCharacter idx character
                , div [ class "item-a1b" ]
                    [ viewCharacterSkillTile model character.characterSkillId
                    , viewCrestTile model character.crestId
                    ]
                ]

        Nothing ->
            div
                [ class "item-a1" ]
                [ addCharacter idx ]


buttonCharacter : Int -> Character -> Html Msg
buttonCharacter idx character =
    let
        onClickEvent =
            onClick (CModalMsg (OpenCharacterModal idx))
    in
    div [ class "item-a1a" ] [ getCharacterPicture character.id onClickEvent, p [] [ text character.name ] ]


addCharacter : Int -> Html Msg
addCharacter idx =
    div [ class "add-character", onClick (CModalMsg (OpenCharacterModal idx)) ] []


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
                , viewPopover value.name value.description
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
                , viewPopover crest.name crest.description
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
