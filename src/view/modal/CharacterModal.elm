module CharacterModal exposing (..)

import Character exposing (getCharacterByDefault)
import CharacterSkill exposing (..)
import CharacterView exposing (..)
import Crest exposing (..)
import CustomTypes exposing (..)
import Dict exposing (Dict)
import GlobalMessage exposing (CharacterModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, stopPropagationOn, onMouseOver)
import Json.Decode as Json


modalCharacterPicker : Model -> Html Msg
modalCharacterPicker model =
    let
        ( idx, maybeCharacter ) =
            model.view.characterPicker

        character =
            maybeCharacter |> Maybe.withDefault getCharacterByDefault
    in
    div
        [ class "modal-c"
        , hidden (not model.view.characterModalIsOpen)
        , onClick (CModalMsg CloseCharacterModal)
        ]
        [ div
            [ class "modal-content"
            , stopPropagationOn "click" (Json.succeed (NoOp, True)) 
            ]
            [ viewCharacterGrid model idx
            , viewSideBar model character
            ]
        ]


viewCharacterGrid : Model -> Int -> Html Msg
viewCharacterGrid model buildIdx =
    div [ class "characters-grid" ]
        (model.data.characters
            |> List.map (\e -> viewCharacterPicker model buildIdx e)
        )


viewCharacterPicker : Model -> Int -> Character -> Html Msg
viewCharacterPicker model buildIdx character =
    let
        bannerCss =
            case character.bannerId of
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

        lockedCss =
            if model.team |> Dict.map (\k v -> v.idCharacter) |> Dict.member character.id then
                "locked-picture"

            else
                ""
    in
    div
        [ class ("tile " ++ lockedCss)
        , onMouseOver (CModalMsg (UpdateCharacterPicker ( buildIdx, Just character )))
        , onClick (CModalMsg (UpdateBuildWithCharacter ( buildIdx, character )))
        ]
        [ img
            [ src ("resources/img/portraits/" ++ String.fromInt character.id ++ ".png")
            , class lockedCss
            ]
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
        , p [ class "title-text" ] [ text character.name ]
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
                    , p [] [ text ("[ " ++ value.name ++ " ]") ]
                    ]
                , p [ class "detail-text" ] [ text value.description ]
                ]

        Nothing ->
            p [] [ text "CharacterSkillNotFound" ]


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
                    [ getCrestPicture value.pictureId
                    , p [] [ text ("[ " ++ value.name ++ " ]") ]
                    ]
                , p [ class "detail-text" ] [ text value.description ]
                ]

        Nothing ->
            div []
                [ div [ class "detail-title" ]
                    [ div [ class "crest-picture no-crest" ] []
                    , p [] [ text "No crest" ]
                    ]
                ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick (CModalMsg CloseCharacterModal)
        , class "close close-button"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
