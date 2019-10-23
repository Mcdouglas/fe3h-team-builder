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
        [ class "border-right" ]
        [ viewPortraitTile character
        , div
            [ class "row"
            , style "margin-right" "0"
            , style "margin-left" "0"
            ]
            [ viewCharacterSkill ( model, character.characterSkillId )
            , viewCrest character.characterSkillId
            ]
        ]


viewPortraitTile : Character -> Html Msg
viewPortraitTile element =
    div
        [ class "card" ]
        [ getPortrait element.id
        , div [ class "card-title", style "text-align" "center" ] [ text element.name ]
        ]


getPortrait : Int -> Html Msg
getPortrait id =
    img
        [ class "card-img-top border border-dark"
        , style "width" "4rem"
        , style "height" "4rem"
        , style "margin" "0 auto"
        , style "background" "white"
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
            div [ class "card col-sm qs" ]
                [ getSkillCharacterPicture ( model, value.pictureId )
                , div
                    [ class "card-text"
                    , style "text-align" "center"
                    , style "font-size" "10px"
                    , style "overflow-wrap" "anywhere"
                    ]
                    [ text value.name ]
                , div [ class "custom-popover above" ] [ text value.description ]
                ]

        Nothing ->
            div [] []


getSkillCharacterPicture : ( Model, Int ) -> Html Msg
getSkillCharacterPicture ( model, id ) =
    div
        [ class "card-img-top"
        , style "width" "2rem"
        , style "height" "2rem"
        , style "margin" "0 auto"
        , style "border-radius" "16px"
        , style "content" ("url(\"resources/img/skill_character/" ++ String.fromInt id ++ ".png\")")
        ]
        []


viewCharacterSkillTooltip : ( Model, Int ) -> Html Msg
viewCharacterSkillTooltip ( model, id ) =
    div [] [ text "info" ]


viewCrest : Int -> Html Msg
viewCrest id =
    div [ class "card col-sm" ] [ text "TODO Crest" ]
