module NoDataView exposing (..)

import GlobalMessage exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)


viewNoData : Html Msg
viewNoData =
    div [ class "no-data" ] []
