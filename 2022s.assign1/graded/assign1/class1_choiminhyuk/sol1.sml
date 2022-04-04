fun merge(x:int list, y:int list):int list =
    if null x then y
    else if null y then x
    else if hd x > hd y then hd y::merge(x, tl y)
    else hd x::merge(tl x, y)

fun append(xs:int list, ys:int list):int list =
    if null(xs) then ys
    else hd(xs)::append(tl(xs), ys)

fun reverse(x:int list):int list=
    if null x then x
    else append(reverse(tl x), [hd x])

fun pi(x:int, y:int, f:int -> int):int =
    if x = y then f(x)
    else f(x) * pi(x+1, y, f)

fun digits(x:int):int list=
    if x<10 then [x]
    else append(digits(x div 10), [x mod 10])

fun sum_list(x:int list):int=
    if null x then 0
    else hd x + sum_list(tl x)

fun additivePersistence(x:int):int =
    let val res = sum_list(digits(x))
    in
        if x < 10 then 0
        else if res < 10 then 1
        else 1 + additivePersistence(res)
    end

fun digitalRoot(x:int):int =
    let val res = sum_list(digits(x))
    in
        if res < 10 then res
        else digitalRoot(res)
    end