module Messages exposing (..)

import Models exposing (..)

type Msg 
    = NoOp
    | RangeChanged RangeGroup
    | AttackerMovementChanged AttackerMovementModifier
    | TargetMovementChanged TargetMovementModifier


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp -> 
            (model, Cmd.none)
        RangeChanged r ->
            ({ model | range = Just r }, Cmd.none)
        AttackerMovementChanged m ->
            ({ model | attackerMovement = Just m }, Cmd.none)
        TargetMovementChanged m -> 
            ({ model | targetMovement = Just m }, Cmd.none)
