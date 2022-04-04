(* Merge Lists *)
(* Input: two sorted lists (in ascending order) *)
fun merge(x : int list, y : int list) = 
    if null x then y else
    if null y then x else
        let
        in
            if hd(x) < hd(y)
            then hd(x) :: merge(tl(x), y)
            else hd(y) :: merge(x, tl(y))
        end

(* Reverse Lists *)
(* Input: list *)
fun reverse(x : int list) = 
    let
        fun rev_recursion(src : int list, dest : int list) = 
            if null src
            then dest
            else rev_recursion(tl(src), hd(src) :: dest)
    in
        rev_recursion(x, [])
    end

(* Pi Function *)
(* Input: tow integers, a function f *)
fun pi(a : int, b : int, f : int -> int) =
    if a > b then 1 else
    if a = b
    then f(b)
    else f(a) * pi(a + 1, b, f)

(* Digits Function *)
(* Input: a positive integer *)
fun digits(d : int) =
    let
        fun digits_recursion(src : int, dest : int list) =
            let
                val x = src div 10
                val r = src mod 10
            in
                if x = 0
                then r :: dest
                else digits_recursion(x, r :: dest)
            end
    in
        digits_recursion(d, [])
    end

(* Digital Roots and Additive Persistence *)
(* Input: positive integer *)
fun additivePersistence(n : int) =
    let
        fun sum_list(x : int list) =
            if null x
            then 0
            else hd(x) + sum_list( tl(x) )
    in
        if n div 10 > 0
        then additivePersistence( sum_list(digits(n)) ) + 1
        else 0
    end

fun digitalRoot(n : int) =
    let
        fun sum_list(x : int list) =
            if null x
            then 0
            else hd(x) + sum_list( tl(x) )
    in
        if n div 10 > 0
        then digitalRoot( sum_list(digits(n)) )
        else n
    end