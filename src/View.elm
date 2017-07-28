module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (Msg)
import Models exposing (..)


radioLabel : String -> String -> String -> Msg -> List (Html Msg)
radioLabel radioName radioId radioLabel clickMsg =
    [ input [ id radioId
            , type_ "radio"
            , name radioName
            , onClick clickMsg ]
            []
    , label [ for radioId ] [ text radioLabel ]
    ]


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "BattleTech Attack Calculator" ]
        , h2 [] [ text "Range Group" ]
        , div [ class "input-group" ]
            <| List.concat 
                [ radioLabel "range" "input-range-short" "Short" (Messages.RangeChanged Short)
                , radioLabel "range" "input-range-medium" "Medium" (Messages.RangeChanged Medium)
                ]
        , h2 [] [ text "Attacker Movement" ]
        , div [ class "input-group" ]
            <| List.concat
                [ radioLabel "attacker-movement" "input-attacker-stationary" "Stationary" (Messages.AttackerMovementChanged Stationary)
                , radioLabel "attacker-movement" "input-attacker-walked" "Walked" (Messages.AttackerMovementChanged Walked)
                , radioLabel "attacker-movement" "input-attacker-ran" "Ran" (Messages.AttackerMovementChanged Ran)
                , radioLabel "attacker-movement" "input-attacker-jumped" "Jumped" (Messages.AttackerMovementChanged Jumped)
                ]
        ]