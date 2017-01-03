module Pangram exposing (..)


alphabet : List Char
alphabet =
    "abcdefghijklmnopqrstuvwxyz" |> String.toList


isPangram : String -> Bool
isPangram s =
    List.all (\c -> List.member c <| String.toList <| String.toLower s) alphabet
