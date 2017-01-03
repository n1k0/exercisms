module ScrabbleScore exposing (..)


scores : List ( String, Int )
scores =
    [ ( "AEIOULNRST", 1 )
    , ( "DG", 2 )
    , ( "BCMP", 3 )
    , ( "FHVWY", 4 )
    , ( "K", 5 )
    , ( "JX", 8 )
    , ( "QZ", 10 )
    ]


charScore : Char -> Int
charScore c =
    List.foldr
        (\( chars, val ) acc ->
            if List.member c <| String.toList chars then
                acc + val
            else
                acc + 0
        )
        0
        scores


scoreWord : String -> Int
scoreWord s =
    String.toUpper s
        |> String.toList
        |> List.map charScore
        |> List.sum
