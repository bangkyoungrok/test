(* Assignment1 2019094511 김준표 *)

fun merge(xs: int list, ys: int list) =
    if null xs
    then ys
    else
        if null ys
        then xs
        else
            if hd(xs) < hd(ys)
            then hd(xs)::merge(tl(xs),ys)
            else hd(ys)::merge(xs,tl(ys))

fun reverse(xs: int list) =
    if null xs
    then []
    else reverse(tl(xs)) @ [hd(xs)]

fun pi(a: int, b: int, f) =
    if a > b
    then 1
    else f(a)*pi(a+1,b,f)

fun digits(x: int) = 
    let 
        fun toList(n: int, ns: int list) =
            if n = 0
            then ns
            else toList((n div 10), (n mod 10) :: ns)
    in
        toList(x, [])
    end

fun sum(x: int) =
    if x div 10 = 0
    then x
    else (x mod 10) + sum(x div 10)

fun additivePersistence(x: int) =
    let
        val s = sum(x)
    in
        if x div 10 = 0
        then 0
        else 1 + additivePersistence((s))
    end

fun digitalRoot(x: int) =
    let 
        val s = sum(x)
    in
        if s div 10 = 0
        then s
        else digitalRoot(s)
    end