module RNATranscription exposing (..)

import Dict


complements : Dict.Dict Char Char
complements =
    Dict.fromList
        [ ( 'C', 'G' )
        , ( 'G', 'C' )
        , ( 'T', 'A' )
        , ( 'A', 'U' )
        ]


encode : Char -> Char
encode c =
    Dict.get c complements |> Maybe.withDefault c


valid : Char -> Bool
valid c =
    Dict.keys complements |> List.member c


toRNA : String -> Result Char String
toRNA source =
    let
        seq =
            String.toList source
    in
        case (List.filter (not << valid) seq) of
            [] ->
                seq
                    |> List.map encode
                    |> String.fromList
                    |> Ok

            c :: xs ->
                Err c
