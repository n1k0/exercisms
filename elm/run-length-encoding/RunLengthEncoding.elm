module RunLengthEncoding exposing (version, encode, decode)

import Regex


version : Int
version =
    2


encode : String -> String
encode source =
    String.toList source
        |> List.foldr toCharCount []
        |> List.map countToString
        |> String.concat


decode : String -> String
decode source =
    Regex.find Regex.All (Regex.regex "(\\d+)?(\\D)") source
        |> List.map decodeMatch
        |> String.concat


toCharCount : Char -> List ( Int, Char ) -> List ( Int, Char )
toCharCount c acc =
    case List.head acc of
        Nothing ->
            [ ( 1, c ) ]

        Just ( count, prev ) ->
            if prev == c then
                ( count + 1, prev ) :: (Maybe.withDefault [] <| List.tail acc)
            else
                ( 1, c ) :: acc


countToString : ( Int, Char ) -> String
countToString ( count, c ) =
    if count > 1 then
        toString count ++ String.fromChar c
    else
        String.fromChar c


decodeMatch : Regex.Match -> String
decodeMatch { submatches } =
    case submatches of
        [ Just count, Just char ] ->
            String.repeat (Result.withDefault 0 <| String.toInt count) char

        [ Nothing, Just char ] ->
            char

        _ ->
            ""
