module NoDataView exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import GlobalMessage exposing (Msg(..))

viewNoData : Html Msg
viewNoData = 
    div [ class "no-data" ] []