module JobModal exposing (..)

import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


modalJobPicker : Model -> Html Msg
modalJobPicker model =
    div
        [ class "modal-j"
        , hidden (not model.view.jobModalIsOpen)
        ]
        [ div
            [ class "modal-content" ]
            [ viewJobGrid model
            , viewSideBar model
            ]
        ]


viewJobGrid : Model -> Html Msg
viewJobGrid model =
    div [] [ text "John" ]


viewSideBar : Model -> Html Msg
viewSideBar model =
    div [ class "sidebar" ]
        [ buttonCloseModal
        , text "sidebar"
        ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick (JModalMsg CloseJobModal)
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
