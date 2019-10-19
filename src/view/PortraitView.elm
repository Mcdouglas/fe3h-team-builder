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
    div
        [ class "col-sm"
        , style "background-color" "red"
        ]
        [ viewPortraitTile character
        , viewCharacterSkill character.characterSkillId
        ]


viewPortraitTile : Character -> Html Msg
viewPortraitTile element =
    div [ class "card" ]
        [ getPortrait element.id
        , div [ class "card-title", style "text-align" "center" ] [ text element.name ]
        ]


getPortrait : Int -> Html Msg
getPortrait id =
    img
        [ class "card-img-top"
        , style "width" "4rem"
        , style "height" "4rem"
        , style "margin" "0 auto"
        , src ("resources/img/portraits/" ++ String.fromInt id ++ ".png")
        , width 100
        , height 100
        ]
        []


viewCharacterSkill : Int -> Html Msg
viewCharacterSkill id =
    let
        characterSkill =
            getCharacterSkillById id
    in
    case characterSkill of
        Just value ->
            div [ class "card" ]
                [ getSkillCharacterPicture ( value.description, value.pictureId )
                , div
                    [ class "card-title"
                    , style "text-align" "center"
                    , style "font-size" "10px"
                    ]
                    [ text value.name ]
                ]

        Nothing ->
            div [] []


getSkillCharacterPicture : ( String, Int ) -> Html Msg
getSkillCharacterPicture ( description, id ) =
    img
        [ class "card-img-top"
        , style "width" "2rem"
        , style "height" "2rem"
        , style "margin" "0 auto"
        , attribute "data-toggle" "popover"
        , attribute "title" "Popover title"
        , attribute "data-content" description
        , src ("resources/img/skill_character/" ++ String.fromInt id ++ ".png")
        , width 75
        , height 75
        ]
        []
