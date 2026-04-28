module Popover exposing (viewPopover, viewPopoverClickable, viewPopoverMultiline)

import GlobalMessage exposing (Msg(..))
import Html exposing (Html, br, div, p, text)
import Html.Attributes exposing (class)


viewPopover : String -> String -> Html Msg
viewPopover title description =
    div
        [ class "custom-popover above" ]
        [ p [ class "popover-title" ] [ text ("[" ++ title ++ "]") ]
        , p [ class "popover-text" ] [ text description ]
        ]


viewPopoverClickable : String -> String -> String -> Html Msg
viewPopoverClickable title description instruction =
    div
        [ class "custom-popover above" ]
        [ p [ class "popover-title" ] [ text ("[" ++ title ++ "]") ]
        , p [ class "popover-text" ] [ text description ]
        , p [ class "popover-instruction" ] [ text instruction ]
        ]


viewPopoverMultiline : String -> List String -> String -> Html Msg
viewPopoverMultiline title descriptionMultiline instruction =
    let
        textMultiline =
            descriptionMultiline
                |> List.map (\e -> text e)
                |> List.intersperse (br [] [])
    in
    div
        [ class "custom-popover above" ]
        [ p [ class "popover-title" ] [ text ("[" ++ title ++ "]") ]
        , p [ class "popover-text" ] textMultiline
        , p [ class "popover-instruction" ] [ text instruction ]
        ]
