module Series exposing (..)


slices : Int -> String -> Result String (List (List Int))
slices size source =
    if size < 1 then
        Err ("Invalid size: " ++ toString size)
    else
        String.split "" source
            |> List.map String.toInt
            |> List.foldr (Result.map2 (::)) (Ok [])
            |> Result.map
                (\ints ->
                    List.range 0 (String.length source - size)
                        |> List.map (\x -> List.drop x ints |> List.take size)
                )
