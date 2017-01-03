module DifferenceOfSquares exposing (..)


square : Int -> Int
square int =
    int * int


squareOfSum : Int -> Int
squareOfSum int =
    List.range 1 int |> List.sum |> square


sumOfSquares : Int -> Int
sumOfSquares int =
    List.range 1 int |> List.map square |> List.sum


difference : Int -> Int
difference int =
    squareOfSum int - sumOfSquares int
