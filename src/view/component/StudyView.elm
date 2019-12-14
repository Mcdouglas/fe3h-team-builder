module StudyView exposing (..)

import CustomTypes exposing (..)
import GlobalMessage exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Study exposing (rankToId, subjectToId)


getStudyPicture : Int -> Html Msg
getStudyPicture pictureId =
    img
        [ class "study-picture"
        , src ("resources/img/skills/" ++ String.fromInt pictureId ++ ".png")
        ]
        []


getRankPicture : Rank -> Html Msg
getRankPicture rank =
    let
        pictureId =
            rankToId rank
    in
    img
        [ class "rank-picture"
        , src ("resources/img/ranks/" ++ String.fromInt pictureId ++ ".png")
        ]
        []


viewStudy : Study -> Html Msg
viewStudy study =
    div [ class "study-view" ]
        [ getStudyPicture (subjectToId study.subject)
        , getRankPicture study.rank
        ]
