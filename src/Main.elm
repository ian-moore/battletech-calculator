module Main exposing (..)

import Html
import Messages exposing (Msg, update)
import Models exposing (Model)
import Subscriptions exposing (subscriptions)
import View exposing (view)

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

init : (Model, Cmd Msg)
init =
    let
        model = Model Nothing Nothing Nothing
    in
        (model, Cmd.none)