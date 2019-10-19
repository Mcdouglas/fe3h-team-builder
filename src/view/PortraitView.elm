module PortraitView exposing (..)

import Character exposing (..)
import CharacterSkill exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)


viewPortrait : CharacterBuild -> Html Msg
viewPortrait element =
    let
        character =
            getCharacterById element.idCharacter
                |> Maybe.withDefault (Character -1 "" Male 0)
    in
    div []
        [ viewPortraitTile character
        , viewCharacterSkill character.characterSkillId
        ]


viewPortraitTile : Character -> Html Msg
viewPortraitTile element =
    div [ class "card", style "width" "4rem" ]
        [ getPortrait element.id
        , div [ style "text-align" "center" ] [ text element.name ]
        ]


getPortrait : Int -> Html Msg
getPortrait id =
    img [ class "card-img-top", src ("resources/img/portraits/" ++ String.fromInt id ++ ".png"), width 60, height 60 ] []


viewCharacterSkill : Int -> Html Msg
viewCharacterSkill id =
    let
        characterSkill =
            getCharacterSkillById id
    in
    case characterSkill of
        Just value ->
            div [ class "card", style "width" "4rem" ]
                [ getSkillCharacterPicture value.pictureId
                , div [ class "card-title" ] [ text value.name ]
                ]

        Nothing ->
            div []
                [ text (String.fromInt id) ]


getSkillCharacterPicture : Int -> Html Msg
getSkillCharacterPicture id =
    img [ class "card-img-top", src ("resources/img/skill_character/" ++ String.fromInt id ++ ".png"), width 50, height 50 ] []
