module Day exposing
    ( Day
    , millis
    )

{-| Day


# Model

@docs Day


# Query

@docs millis

-}


type alias Day =
    Int


{-| millis

Number of millis in day

-}
millis : Int
millis =
    86400000
