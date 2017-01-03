module Raindrops exposing (..)


rules : List ( Int, String )
rules =
    [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]


processRule : Int -> ( Int, String ) -> String
processRule n ( divisor, label ) =
    if n % divisor == 0 then
        label
    else
        ""


raindrops : Int -> String
raindrops n =
    let
        s =
            rules |> List.map (processRule n) |> String.concat
    in
        if s == "" then
            toString n
        else
            s
