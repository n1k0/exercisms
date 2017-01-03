module Bob exposing (..)

import Regex


hasLetters : String -> Bool
hasLetters s =
    Regex.contains (Regex.regex "[A-Za-z]") s


isQuestion : String -> Bool
isQuestion s =
    String.endsWith "?" s


isShout : String -> Bool
isShout s =
    hasLetters s && String.toUpper s == s


isSilent : String -> Bool
isSilent s =
    (String.trim s |> String.length) == 0


hey : String -> String
hey s =
    if isSilent s then
        "Fine. Be that way!"
    else if isShout s then
        "Whoa, chill out!"
    else if isQuestion s then
        "Sure."
    else
        "Whatever."
