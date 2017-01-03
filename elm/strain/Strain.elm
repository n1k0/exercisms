module Strain exposing (..)


keep : (a -> Bool) -> List a -> List a
keep fn list =
    List.foldr
        (\x acc ->
            if fn x then
                x :: acc
            else
                acc
        )
        []
        list


discard : (a -> Bool) -> List a -> List a
discard fn list =
    keep (not << fn) list
