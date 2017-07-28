module Models exposing (..)

type RangeGroup 
    =
      Short
    | Medium 
    | Long

type AttackerMovementModifier 
    = 
      Stationary
    | Walked
    | Ran
    | Jumped

type TargetMovementModifier 
    = 
      Moved02Hexes
    | Moved34Hexes
    | Moved56Hexes
    | Moved79Hexes

type alias Model =
    { range : Maybe RangeGroup
    , attackerMovement : Maybe AttackerMovementModifier
    , targetMovement : Maybe TargetMovementModifier
    }