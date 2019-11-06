module SkillModal exposing (..)

import CustomTypes exposing (Skill)
import GlobalMessage exposing (Msg(..), SkillModal(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import ModelHandler exposing (getSkillList)


modalSkillPicker : Model -> Html Msg
modalSkillPicker model =
    let
        ( ( buildPosition, skillPosition ), maybeSkill, isCombatArt ) =
            model.view.skillPicker

        modalCss =
            if isCombatArt then
                "active-skill-modal"

            else
                "passive-skill-modal"
    in
    div
        [ class "modal-s"
        , hidden (not model.view.skillModalIsOpen)
        ]
        [ div [ class ("modal-content " ++ modalCss) ]
            [ viewSkillGrid model model.view.skillPicker
            , viewSideBar model
            ]
        ]


viewSkillGrid : Model -> ( ( Int, Int ), Maybe Skill, Bool ) -> Html Msg
viewSkillGrid model ( ( buildPosition, skillPosition ), maybeSkill, isCombatArt ) =
    let
        listSkills =
            getSkillList isCombatArt model.data
    in
    div [ class "skills-grid" ]
        (listSkills
            |> List.map (\e -> viewSkillPicker model.view.skillPicker e)
        )


viewSkillPicker : ( ( Int, Int ), Maybe Skill, Bool ) -> Skill -> Html Msg
viewSkillPicker ( positions, _, isCombatArt ) skill =
    div
        [ class "tile"
        , onMouseOver (SModalMsg (UpdateSkillPicker ( positions, Just skill, isCombatArt )))
        , onClick (SModalMsg (UpdateBuildWithSkill ( positions, skill, isCombatArt )))
        ]
        [ img
            [ src ("resources/img/skills/" ++ String.fromInt skill.pictureId ++ ".png") ]
            []
        , p [] [ text skill.name ]
        , div [ class "tile-overlay " ] []
        ]


viewSideBar : Model -> Html Msg
viewSideBar model =
    let
        ( ( idx, skillId ), maybeSkill, isCombatArt ) =
            model.view.skillPicker
    in
    case maybeSkill of
        Just skill ->
            div [ class "sidebar" ]
                [ buttonCloseModal
                , div [] [ p [] [ text skill.name ] ]
                ]

        Nothing ->
            div [ class "sidebar" ]
                [ buttonCloseModal ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick (SModalMsg CloseSkillModal)
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
