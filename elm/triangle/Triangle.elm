module Triangle exposing (..)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


type alias Error =
    String


inequal : Float -> Float -> Float -> Bool
inequal a b c =
    -- XXX there *must* be a better way...
    case List.sort [ a, b, c ] of
        [ a_, b_, c_ ] ->
            a_ + b_ <= c_

        _ ->
            True


triangleKind : Float -> Float -> Float -> Result Error Triangle
triangleKind a b c =
    if List.any (\l -> l <= 0) [ a, b, c ] then
        Err "Invalid lengths"
    else if inequal a b c then
        Err "Violates inequality"
    else if a == b && b == c then
        Ok Equilateral
    else if a == b || b == c || a == c then
        Ok Isosceles
    else
        Ok Scalene
