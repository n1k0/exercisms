module NucleotideCount exposing (..)


type alias Counter =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


countReducer : Char -> Counter -> Counter
countReducer c acc =
    case c of
        'G' ->
            { acc | g = acc.g + 1 }

        'C' ->
            { acc | c = acc.c + 1 }

        'A' ->
            { acc | a = acc.a + 1 }

        'T' ->
            { acc | t = acc.t + 1 }

        _ ->
            acc


nucleotideCounts : String -> Counter
nucleotideCounts seq =
    String.toList seq
        |> List.foldr countReducer { a = 0, t = 0, c = 0, g = 0 }


version : Int
version =
    2
