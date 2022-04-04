fun merge(xs : int list, ys : int list) =
    if null(xs) then ys
        else
        if null(ys) then xs
        else
        if hd(xs) < hd(ys)
        then hd(xs)::merge(tl(xs),ys)
        else hd(ys)::merge(xs,tl(ys))

fun reverse(xs : int list) = 
    if null(xs) then []
    else reverse(tl(xs))@[hd(xs)]

fun pi(xs : int, ys : int, fs : int -> int) =
    if xs > ys then 1
    else fs(xs)*pi(xs+1,ys,fs)

fun digits(xs : int) = 
    if (xs div 10) = 0 then [xs]
    else digits(xs div 10)@[xs mod 10]

fun addalloflist(xs : int list) = 
    if null(xs) then 0
    else hd(xs)+addalloflist(tl(xs))

fun additivePersistence(xs: int) =
    if (xs div 10) = 0 then 0
    else 1+additivePersistence(addalloflist(digits(xs)))

fun digitalRoot(xs: int) =
    if (xs div 10) = 0 then xs mod 10
    else digitalRoot(addalloflist(digits(xs)))
