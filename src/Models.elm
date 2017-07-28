module Models exposing (..)

type RangeGroup 
    = Short
    | Medium 
    | Long

rangeToInt : RangeGroup -> Int
rangeToInt group =
    case group of
        Short -> 4
        Medium -> 6
        Long -> 8

type AttackerMovementModifier 
    = Stationary
    | Walked
    | Ran
    | Jumped

attackerMovementToInt : AttackerMovementModifier -> Int
attackerMovementToInt movement =
    case movement of
        Stationary -> 0
        Walked -> 1
        Ran -> 2
        Jumped -> 3


type TargetMovementModifier 
    = Moved02Hexes
    | Moved34Hexes
    | Moved56Hexes
    | Moved79Hexes

    
targetMovementToInt : TargetMovementModifier -> Int
targetMovementToInt movement =
    case movement of
        Moved02Hexes -> 0
        Moved34Hexes -> 1
        Moved56Hexes -> 2
        Moved79Hexes -> 3


type alias Model =
    { range : Maybe RangeGroup
    , attackerMovement : Maybe AttackerMovementModifier
    , targetMovement : Maybe TargetMovementModifier
    }


isNone : Maybe Int -> Bool
isNone m =
    case m of
        Just _ -> False
        Nothing -> True


calculateRoll : Model -> Maybe Int
calculateRoll model =
    let
        range = Maybe.map rangeToInt model.range 
        attackerMovement = Maybe.map attackerMovementToInt model.attackerMovement
        targetMovement = Maybe.map targetMovementToInt model.targetMovement
        inputs = [ range, attackerMovement, targetMovement ]
    in
        case List.any isNone inputs of
            True -> Nothing
            False ->
                inputs
                |> List.filterMap identity
                |> List.sum
                |> Just
