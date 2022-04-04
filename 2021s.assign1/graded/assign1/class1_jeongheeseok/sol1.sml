(* Problem 1 *)
fun merge(xs: int list, ys: int list): int list = 
    if null xs
    then ys
    else if null ys
    then xs
    else if hd(xs) < hd(ys)
    then hd(xs)::merge(tl(xs), ys)
    else hd(ys)::merge(xs, tl(ys)) 

(* Problem 2 *)
fun reverse(xs: int list): int list =
    let fun append(xs: int list, ys: int list): int list =
            if null xs
            then ys
            else hd(xs)::append(tl(xs), ys)
    in
        if null xs
        then []
        else append(reverse(tl(xs)), hd(xs)::[])
    end


(* Problem 3 *)
fun pi(a: int, b: int, f: int -> int): int = 
    if a > b
    then 1
    else f(a) * pi(a+1, b, f)

(* Problem 4 *)
fun digits(x: int): int list =
    let fun append(xs: int list, ys: int list): int list =
            if null xs
            then ys
            else hd(xs)::append(tl(xs), ys)
    in
        if x = 0
        then []
        else append(digits(x div 10), (x mod 10)::[])
    end

(* Problem 5 *)
fun additivePersistence(x: int): int =
    let 
        val count = 0
        fun sumDigits(xs: int list): int =
            if null xs
            then 0
            else hd(xs) + sumDigits(tl(xs))
    in
        if (x div 10) = 0
        then count
        else count + 1 + additivePersistence(sumDigits(digits(x)))
    end

fun digitalRoot(x: int): int =
    let fun sumDigits(xs: int list): int =
            if null xs
            then 0
            else hd(xs) + sumDigits(tl(xs))
    in
        if (x div 10) = 0
        then x
        else digitalRoot(sumDigits(digits(x)))
    end