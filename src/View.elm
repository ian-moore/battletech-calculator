module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (Msg)
import Models exposing (..)

view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "BattleTech Attack Calculator" ]
        , div [ class "input-group" ] 
              [ input [ id "input-range-short" , type_ "radio" , name "range" , onClick (Messages.RangeChanged Short) ] []
              , label [ for "input-range-short" ] [ text "Short" ]
              , input [ id "input-range-medium" , type_ "radio" , name "range" , onClick (Messages.RangeChanged Medium) ] []
              , label [ for "input-range-medium" ] [ text "Medium" ]
              , input [ id "input-range-long" , type_ "radio" , name "range" , onClick (Messages.RangeChanged Long) ] []
              , label [ for "input-range-long" ] [ text "Long" ]
              ]
        ]