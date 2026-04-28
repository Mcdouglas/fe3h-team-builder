module CharacterView exposing (getCrestPicture, getSkillCharacterPicture, sectionCharacter)

import CharacterSkill exposing (getCharacterSkillById)
import Crest exposing (getCrest)
import CustomTypes exposing (Character)
import GlobalMessage exposing (CharacterModal(..), Msg(..))
import Html exposing (Attribute, Html, div, img, p, text)
import Html.Attributes exposing (class, src, style)
import Html.Events exposing (onClick)
import Popover exposing (viewPopover)


sectionCharacter : Int -> Maybe Character -> Html Msg
sectionCharacter idx maybeCharacter =
    case maybeCharacter of
        Just character ->
            div
                [ class "item-a1" ]
                [ buttonCharacter idx character
                , div [ class "item-a1b" ]
                    [ viewCharacterSkillTile character.characterSkillId
                    , viewCrestTile character.crestId
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


viewCharacterSkillTile : Int -> Html Msg
viewCharacterSkillTile id =
    let
        characterSkill =
            getCharacterSkillById id
    in
    case characterSkill of
        Just value ->
            div []
                [ getSkillCharacterPicture value.pictureId
                , p [] [ text value.name ]
                , viewPopover value.name value.description
                ]

        Nothing ->
            p [] [ text "Character not found" ]


getSkillCharacterPicture : Int -> Html Msg
getSkillCharacterPicture pictureId =
    div
        [ class "cskill-picture qs"
        , style "content" ("url(\"resources/img/skills/" ++ String.fromInt pictureId ++ ".png\")")
        ]
        []


viewCrestTile : Int -> Html Msg
viewCrestTile crestId =
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
