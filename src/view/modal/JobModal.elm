module JobModal exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
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
    let
        ( buildIdx, _ ) =
            model.view.jobPicker
    in
    div
        [ class "job-tile"
        , onMouseOver (JModalMsg (UpdateJobPicker ( buildIdx, Just job )))
        , onClick (JModalMsg (UpdateBuild ( buildIdx, job )))
        ]
        [ getJobPicture job.idPicture
        , text job.name
        ]


viewSideBar : Model -> Html Msg
viewSideBar model =
    div [ class "sidebar" ]
        [ buttonCloseModal
        , viewJobDetail model
        ]


viewJobDetail : Model -> Html Msg
viewJobDetail model =
    let
        ( _, maybeJob ) =
            model.view.jobPicker
    in
    case maybeJob of
        Just currentJob ->
            div [] [ text currentJob.name ]

        Nothing ->
            div [] [ text "No data" ]


buttonCloseModal : Html Msg
buttonCloseModal =
    div
        [ onClick (JModalMsg CloseJobModal)
        , class "close close-modal"
        , style "content" "url(\"resources/lib/octicons/x.svg\")"
        ]
        []
