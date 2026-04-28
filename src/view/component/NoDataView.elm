module NoDataView exposing (viewNoData)

import GlobalMessage exposing (Msg(..))
import Html exposing (Html, div)
import Html.Attributes exposing (class)


viewNoData : Html Msg
viewNoData =
    div [ class "no-data" ] []
