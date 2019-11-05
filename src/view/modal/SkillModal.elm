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
            [ viewSkillGrid model isCombatArt
            , viewSideBar model
            ]
        ]


viewSkillGrid : Model -> Bool -> Html Msg
viewSkillGrid model isCombatArt =
    let
        listSkills =
            getSkillList isCombatArt model.data
    in
    div [ class "skills-grid" ]
        (listSkills
            |> List.map (\e -> viewSkillPicker e)
        )


viewSkillPicker : Skill -> Html Msg
viewSkillPicker skill =
    div
        [ class "tile" ]
        [ img
            [ src ("resources/img/skills/" ++ String.fromInt skill.pictureId ++ ".png") ]
            []
        , p [] [ text skill.name ]
        , div [ class "tile-overlay " ] []
        ]


viewSideBar : Model -> Html Msg
viewSideBar model =
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
