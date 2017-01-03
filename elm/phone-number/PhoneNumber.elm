module PhoneNumber exposing (..)

import Char exposing (isDigit)


getNumber : String -> Maybe String
getNumber source =
    let
        digits =
            String.filter isDigit source
    in
        if String.length digits < 10 || String.length digits > 11 then
            Nothing
        else if String.length digits == 11 then
            if String.startsWith "1" digits then
                Just (String.dropLeft 1 digits)
            else
                Nothing
        else
            Just digits


prettyPrint : String -> Maybe String
prettyPrint source =
    case getNumber source of
        Just phone ->
            ("(" ++ (String.slice 0 3 phone) ++ ") ")
                ++ (String.slice 3 6 phone)
                ++ "-"
                ++ (String.slice 6 10 phone)
                |> Just

        _ ->
            Nothing
