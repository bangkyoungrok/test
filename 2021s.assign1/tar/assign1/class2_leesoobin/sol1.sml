(* This is a comment. My first ML program *)

(* 1 Merge Lists *)
fun merge (l1 : int list, l2 : int list) : int list =
    if null l1 andalso null l2
    then []
    else if null l1
    then (hd l2)::merge(l1, tl l2)
    else if null l2
    then (hd l1)::merge(tl l1, l2)
    else if (hd l1) > (hd l2)
    then (hd l2)::merge(l1, tl l2)
    else (hd l1)::merge(tl l1, l2)   

(* 2 Reverse List *)
fun reverse (l : int list) : int list =
    if null l
    then []
    else reverse(tl l) @ [hd l]

(* 3 Pi Function *)
fun pi (a : int, b : int, f : int -> int) : int =
    if a > b
    then 1
    else f(a) * pi(a + 1, b, f)

(* 4 Digits Function *)
fun digits (x : int) : int list =
    if (x div 10) = 0
    then [x mod 10]
    else digits(x div 10) @ [x mod 10]

(* 5 Additive Persistence / Digital Root *)
fun digitalRoot (n : int) : int =
    let fun addition (l : int list) : int =
        if null l
        then 0
        else hd l + addition(tl l)
        val addedDigits = addition(digits(n))
    in if (addedDigits div 10) = 0
        then addedDigits
        else digitalRoot(addedDigits)
    end
    
fun additivePersistence (n : int) : int =
    let fun addition (l : int list) : int =
        if null l
        then 0
        else hd l + addition(tl l)
        val addedDigits = addition(digits(n))
    in if (addedDigits div 10) = 0
        then 1
        else 1 + additivePersistence(addedDigits)
    end