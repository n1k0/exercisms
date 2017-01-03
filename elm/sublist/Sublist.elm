module Sublist exposing (..)


type ListComparison
    = Equal
    | Unequal
    | Sublist
    | Superlist


sublist : List a -> List a -> ListComparison
sublist a b =
    let
        tos =
            \l -> List.map toString l |> String.concat

        sa =
            tos a

        sb =
            tos b
    in
        if sa == sb then
            Equal
        else if String.contains sa sb then
            Sublist
        else if String.contains sb sa then
            Superlist
        else
            Unequal


version : Int
version =
    2
