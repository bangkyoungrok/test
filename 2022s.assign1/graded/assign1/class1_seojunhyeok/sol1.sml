(*
    Junhyeok Seo
    9072220211
*)
(*
    1. Merge Lists
    * If the two lists have common numbers, then they do not merge
    just show the empty list. 
    (https://www.youtube.com/watch?v=e-AFKQaLTiA)
*)
fun merge (nil, ys) = ys
|   merge (xs, nil) = xs
|   merge (x::xs, y::ys) =
        if (x = y) then []
        else
            if (x < y) then x :: merge (xs, y::ys)
            else y :: merge(x::xs, ys);
            

(*
    2. Reverse List
*)
fun reverse (nil) = (nil)
|   reverse (x::xs : int list) = 
        reverse(xs) @ [x];

(*
    3. Pi Function
    fun pi (a:int, b:int, f) =
*)

    
(*
    4. Digits Function
    Not sure what to deal with numbers over 1000.. done with specific range only ()
*)
fun digits (x : int) =
    if (0 < x andalso x < 10)
    then [x]
    else 
        if (0 < x andalso x < 100)
        then [x div 10] @ [x mod 10]
        else 
            if (x > 100 andalso x < 1000)
            then
            [(x div 10) div 10] @ [(x div 10) mod 10] @ [x mod 10]
            else [];

(*
    5. Digital Roots and Additice Persistence
*)