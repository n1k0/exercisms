module Accumulate exposing (..)


accumulate : (a -> b) -> List a -> List b
accumulate fn list =
    List.foldr (\x y -> fn x :: y) [] list
