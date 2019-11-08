module StudyView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)


getStudyPicture : Int -> Html Msg
getStudyPicture pictureId =
    img
        [ class "study-picutre"
        , src ("resources/img/studies/" ++ String.fromInt pictureId ++ ".png")
        ]
        []


getRankPicture : Rank -> Html Msg
getRankPicture rank =
    let
        pictureId =
            rankToId rank
    in
    img
        [ class "rank-picutre"
        , src ("resources/img/ranks/" ++ String.fromInt pictureId ++ ".png")
        ]
        []


viewStudy : Study -> Html Msg
viewStudy study =
    div [ class "study-view" ]
        [ getStudyPicture study.id
        , getRankPicture study.rank
        ]
