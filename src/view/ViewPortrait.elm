module ViewPortrait exposing (..)

import CustomTypes exposing (..)
import DataBuilder exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import CharacterSkill exposing (..)
import Character exposing (..)


viewPortrait : CharacterBuild -> Html Msg
viewPortrait element =
    let
        character =
            getCharacterById element.idCharacter
                |> Maybe.withDefault (Character -1 "" Male 0)
    in
    div [ class "item-a" ]
        [ getPictureById character.id
        , div [] [ text character.name ]
        , viewCharacterSkillImg character.characterSkillId
        ]


viewCharacterSkillImg: Int -> Html Msg
viewCharacterSkillImg id =
    let
        characterSkill = getCharacterSkillById id
    in
    case characterSkill of
        Just value ->
            div []
                [ text value.name ]

        Nothing ->
            div []
                [ text (String.fromInt id) ]


getPictureById : Int -> Html Msg
getPictureById id =
    img [ src ("resources/img/portraits/" ++ String.fromInt id ++ ".png"), width 50, height 50 ] []
