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
        [ class "col-sm border-right" ]
        [ viewPortraitTile character
        , div [ class "row" ]
            [ viewCharacterSkill ( model, character.characterSkillId )
            , viewCrest character.characterSkillId
            ]
        ]


viewPortraitTile : Character -> Html Msg
viewPortraitTile element =
    div
        [ class "card"
        , style "background" "Gainsboro"
        ]
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
            div [ class "card" ]
                [ getSkillCharacterPicture ( model, value.description, value.pictureId )
                , div
                    [ class "card-title"
                    , style "text-align" "center"
                    , style "font-size" "10px"
                    , style "word-break" "break-all"
                    ]
                    [ text value.name ]
                ]

        Nothing ->
            div [] []


getSkillCharacterPicture : ( Model, String, Int ) -> Html Msg
getSkillCharacterPicture ( model, description, id ) =
    img [ class "card-img-top"
        , style "width" "2rem"
        , style "height" "2rem"
        , style "margin" "0 auto"
        , src ("resources/img/skill_character/" ++ String.fromInt id ++ ".png")
        , width 75
        , height 75
        ] []
        


viewCrest : Int -> Html Msg
viewCrest id =
    div [ class "card" ] [ text "TODO Crest" ]
