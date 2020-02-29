module StudyView exposing (getAcademicSkill, getStudyPicture, viewStudy)

import CustomTypes exposing (Rank(..), Study, StudyCapacity(..))
import GlobalMessage exposing (Msg(..))
import Html exposing (Html, div, img)
import Html.Attributes exposing (class, src)
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


getAcademicSkill : StudyCapacity -> Html Msg
getAcademicSkill sc =
    let
        studyCapacityName =
            case sc of
                Strength ->
                    "strength"

                Weakness ->
                    "weakness"

                BuddingTalent ->
                    "budding_talent"

                _ ->
                    ""
    in
    if String.length studyCapacityName > 0 then
        img [ class "study-picture", src ("resources/img/skills/" ++ studyCapacityName ++ ".png") ] []

    else
        div [] []
