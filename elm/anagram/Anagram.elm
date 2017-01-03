module Anagram exposing (..)


fingerprint : String -> List Char
fingerprint word =
    word
        |> String.toLower
        |> String.toList
        |> List.sort


anagram : String -> String -> Bool
anagram a b =
    not (String.toLower a == String.toLower b) && fingerprint a == fingerprint b


detect : String -> List String -> List String
detect source words =
    words
        |> List.filter (\candidate -> anagram candidate source)
