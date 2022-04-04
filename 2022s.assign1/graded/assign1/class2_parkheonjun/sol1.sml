fun merge(xs: int list, ys: int list): int list =
    if length(xs)=0 then ys
    else
        if length(ys)=0 then xs
        else
            if hd(xs) < hd(ys)
            then hd(xs) :: merge(tl(xs), ys)
            else hd(ys) :: merge(xs, tl(ys))

fun reverse(xs: int list): int list = 
    if length(xs)=0 then []
    else reverse(tl(xs)) @ [hd(xs)]

fun pi(a: int, b: int, f: int -> int): int =
    if a < b
    then f(a) * pi(a+1, b, f)
    else f(b)

fun digits(x: int): int list =
    if x < 10
    then [x]
    else digits(x div 10) @ [x mod 10]


fun sum(l: int list): int =
    if length(l)=0 then 0
    else hd(l) + sum(tl(l))

fun additivePersistence(n: int): int =
    if sum(digits(n)) < 10
    then 1
    else additivePersistence(sum(digits(n)))+1

fun digitalRoot(n: int): int =
    if sum(digits(n)) < 10
    then sum(digits(n))
    else digitalRoot(sum(digits(n)))
