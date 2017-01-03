module Hamming exposing (..)


diffCount : List Char -> List Char -> Int -> Int
diffCount a b count =
    case ( a, b ) of
        ( xa :: xsa, xb :: xsb ) ->
            if xa /= xb then
                diffCount xsa xsb (count + 1)
            else
                diffCount xsa xsb count

        _ ->
            count


distance : String -> String -> Maybe Int
distance a b =
    if String.length a /= String.length b then
        Nothing
    else
        Just <| diffCount (String.toList a) (String.toList b) 0
