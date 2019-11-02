module CharacterSelector exposing (..)

import CharacterSkill exposing (..)
import CharacterView exposing (..)
import Crest exposing (..)
import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseOver)


viewCharacterSelector : Model -> Html Msg
viewCharacterSelector model =
    let
        ( position, maybeCharacter ) =
            model.view.currentCharacter
    in
    case maybeCharacter of
        Just character ->
            div
                [ class "modal"
                , hidden (not model.view.characterSelectorIsOpen)
                ]
                [ div [ class "modal-content" ]
                    [ viewCharacterGrid model ( position, character )
                    , viewSideBar model character
                    ]
                ]

        Nothing ->
            div [] []


viewCharacterGrid : Model -> ( Int, Character ) -> Html Msg
viewCharacterGrid model ( position, _ ) =
    div [ class "characters-grid" ]
        (model.data.characters
            |> List.map (\e -> viewCharacterPicker ( position, e ))
        )


viewCharacterPicker : ( Int, Character ) -> Html Msg
viewCharacterPicker ( position, element ) =
    let
        bannerCss =
            case element.bannerId of
                Just value ->
                    case value of
                        0 ->
                            "black-eagle-tile"

                        1 ->
                            "blue-lyon-tile"

                        2 ->
                            "golden-deer-tile"

                        _ ->
                            "church-seiros-tile"

                Nothing ->
                    "avatar-tile"
    in
    div
        [ class "tile"
        , onMouseOver (UpdateCharacterSelector ( position, Just element ))
        , onClick (UpdateBuild ( position, element ))
        ]
        [ img
            [ src ("resources/img/portraits/" ++ String.fromInt element.id ++ ".png") ]
            []
        , div [ class ("tile-overlay " ++ bannerCss) ] []
        ]


viewSideBar : Model -> Character -> Html Msg
viewSideBar model character =
    div [ class "sidebar" ]
        [ buttonCloseModal
        , viewCharacterDetail model character
        ]


viewCharacterDetail : Model -> Character -> Html Msg
viewCharacterDetail model character =
    div [ class "character-detail" ]
        [ viewFullPortraitDetail model character
        , viewContentDetail model character
        ]


viewFullPortraitDetail : Model -> Character -> Html Msg
viewFullPortraitDetail model character =
    div [ class "full-portrait-title" ]
        [ getFullPortrait character.id
        , getBannerPicture character.bannerId
        , div [ class "title-text" ] [ text character.name ]
        ]


getFullPortrait : Int -> Html Msg
getFullPortrait id =
    img
        [ class "full-portrait-picutre character-picture"
        , src ("resources/img/portraits/" ++ String.fromInt id ++ ".png")
        ]
        []


viewContentDetail : Model -> Character -> Html Msg
viewContentDetail model character =
    div [ class "detail-content" ]
        [ viewCharacterSkillDetail model character.characterSkillId
        , viewCharacterCrestDetail model character.crestId
        ]


getBannerPicture : Maybe Int -> Html Msg
getBannerPicture maybeId =
    case maybeId of
        Just id ->
            img
                [ class "banner-picture"
                , src ("resources/img/banners/" ++ String.fromInt id ++ ".png")
                ]
                []

        Nothing ->
            img
                [ class "banner-picture"
                , style "opacity" "0"
                , style "height" "3rem"
                , style "width" "3rem"
                ]
                []


viewCharacterSkillDetail : Model -> Int -> Html Msg
viewCharacterSkillDetail model skillId =
    let
        skill =
            getCharacterSkillById skillId
    in
    case skill of
        Just value ->
            div []
                [ div [ class "detail-title" ]
                    [ getSkillCharacterPicture model value.pictureId
                    , div [] [ text ("[ " ++ value.name ++ " ]") ]
                    ]
                , div [ class "detail-text" ] [ text value.description ]
                ]

        Nothing ->
            div [] [ text "CharacterSkillNotFound" ]


viewCharacterCrestDetail : Model -> Int -> Html Msg
viewCharacterCrestDetail model crestId =
    let
        crest =
            getCrest crestId
    in
    case crest of
        Just value ->
            div []
                [ div [ class "detail-title" ]
                    [ getCrestPicture model value.pictureId
                    , div [] [ text ("[ " ++ value.name ++ " ]") ]
                    ]
                , div [ class "detail-text" ] [ text value.description ]
                ]

        Nothing ->
            div []
                [ div [ class "detail-title" ]
                    [ div [ class "crest-picture no-crest" ] []
                    , div [] [ text "No crest" ]
                    ]
                ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick CloseCharacterSelector
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
