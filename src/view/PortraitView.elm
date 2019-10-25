module PortraitView exposing (..)

import Character exposing (..)
import CharacterSkill exposing (..)
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
                |> Maybe.withDefault (Character -1 "" Male 0)
    in
    div
        [ class "item-a1" ]
        [ viewPortraitTile character
        , div []
            [ viewCharacterSkill ( model, character.characterSkillId )
            , viewCrest character.characterSkillId
            ]
        ]


viewPortraitTile : Character -> Html Msg
viewPortraitTile element =
    div
        [ class "card" ]
        [ getPortrait element.id
        , div
            [ class "card-text"
            , style "text-align" "center"
            ]
            [ text element.name ]
        ]


getPortrait : Int -> Html Msg
getPortrait id =
    img
        [ class "portrait-picture card-img-top"
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
            div [ class "card qs" ]
                [ getSkillCharacterPicture ( model, value.pictureId )
                , div
                    [ class "card-text"
                    , style "text-align" "center"
                    , style "font-size" "10px"
                    , style "hyphens" "auto"
                    ]
                    [ text value.name ]
                , div
                    [ class "custom-popover above" ]
                    [ div [ class "popover-title" ] [ text ("[" ++ value.name ++ "]") ]
                    , div [ class "popover-text" ] [ text value.description ]
                    ]
                ]

        Nothing ->
            div [] []


getSkillCharacterPicture : ( Model, Int ) -> Html Msg
getSkillCharacterPicture ( model, id ) =
    div
        [ class "skill-picture card-img-top"
        , style "content" ("url(\"resources/img/skill_character/" ++ String.fromInt id ++ ".png\")")
        ]
        []


viewCharacterSkillTooltip : ( Model, Int ) -> Html Msg
viewCharacterSkillTooltip ( model, id ) =
    div [] [ text "info" ]


viewCrest : Int -> Html Msg
viewCrest id =
    div [ class "card" ] [ text "TODO Crest" ]
