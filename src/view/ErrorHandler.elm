module ErrorHandler exposing (viewError)

import GlobalMessage exposing (Msg(..))
import Html exposing (Html, div, h3, text)


viewError : String -> Html Msg
viewError errorMessage =
    let
        errorHeading =
            "Couldn't fetch json file at this time."
    in
    div []
        [ h3 [] [ text errorHeading ]
        , text ("Error: " ++ errorMessage)
        ]
