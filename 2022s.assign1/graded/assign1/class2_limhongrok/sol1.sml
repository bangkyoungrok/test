(*
* Takes two sorted lists (in ascending order)
* then returns two sorted list
*
* @params x, y {int list} - no duplicates, sorted in ascending order 
* @returns {int list} - sorted list
*)
fun merge (x: int list, y: int list): int list =
    if null x andalso null y then []
    else if null x then y
    else if null y then x
    else if hd x < hd y then hd x :: merge (tl x, y)
    else hd y :: merge (x, tl y)

(*
* Takes a list and returns the reversed one,
* Without using built-in function `rev`.
* 
* @params x {int list} - input
* @returns {int list} - the input in reversed order
*)
fun reverse (x: int list): int list =
let fun iter (ipt: int list, acc: int list): int list =
        if null ipt then acc
        else iter (tl ipt, hd ipt :: acc)
in
    iter (x, [])
end

(*
* Calculate Pi of the given range and function
* 
* @params a {int} - range begins
* @params b {int} - range ends
* @params f {fun} - function of Pi
* @returns {int} - value of the Pi function
*)
fun pi (a: int, b: int, f: int -> int): int =
let fun iter (x: int, acc: int): int =
        if (x < a) then acc
        else iter (x-1, acc * f(x))
in
    iter (b, 1)
end

(*
* Returns the list of digits of the integer.
*
* @params x {int} - positive integer
* @returns {int list} - digits seperated integers
*)
fun digits (x: int): int list =
let fun digitsRev (d: int): int list =
        if (d <= 0) then []
        else (d mod 10) :: digitsRev (d div 10)
in
    reverse (digitsRev (x))
end

(*
* Digital roots and Additive persistence
*
* @params x {int} - input digit
* @returns {int} - step counts
*)
fun additivePersistence (x: int): int =
let fun sum (l: int list): int =
        if (null l) then 0
        else hd l + sum (tl l);
in
    if (x < 10) then 0
    else 1 + additivePersistence(sum (digits (x)))
end

(*
* @see {#additivePersistence}
*)
fun digitalRoot (x: int): int =
let fun sum (l: int list): int =
        if (null l) then 0
        else hd l + sum (tl l);
in
    if (x < 10) then x
    else digitalRoot(sum (digits (x)))
end
