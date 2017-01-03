module WordCount exposing (..)

import Dict
import Regex exposing (..)


type alias WordCount =
    Dict.Dict String Int


updateWordCount : String -> WordCount -> WordCount
updateWordCount w acc =
    if Dict.member w acc then
        Dict.update w (\v -> Just <| (+) 1 <| Maybe.withDefault 0 v) acc
    else
        Dict.insert w 1 acc


wordCount : String -> WordCount
wordCount sentence =
    sentence
        |> String.toLower
        |> Regex.replace All (regex "[^a-z0-9 ]") (always "")
        |> String.words
        |> List.filter (\w -> w /= "")
        |> List.foldr updateWordCount Dict.empty
