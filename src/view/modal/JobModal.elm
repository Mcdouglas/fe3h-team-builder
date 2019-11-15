module JobModal exposing (..)

import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import CustomTypes exposing (..)
import JobView exposing (getJobPicture)

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
    let
        listJob = 
            model.data.jobs
    in
    div [ class "jobs-grid" ] (List.map (\e -> viewJobTile model e) listJob)


viewJobTile : Model -> Job -> Html Msg
viewJobTile model job =
    div [ class "job-tile" ] 
        [ getJobPicture job.idPicture
        , text job.name ]


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
