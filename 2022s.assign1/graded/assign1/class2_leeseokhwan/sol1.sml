fun merge(xs:int list, ys:int list) : int list = 
    if null xs
    then ys
    else if null ys
    then xs
    else if hd(xs) > hd(ys)
    then hd(ys)::merge(xs,tl(ys))
    else hd(xs)::merge(tl(xs),ys)

fun append(xs: int list, ys: int list) : int list =
    if null xs
    then ys
    else hd(xs)::append(tl(xs),ys)

fun pushReverse(xs: int list, ys: int list) =
    if null xs then
        ys
    else 
        pushReverse(tl(xs),hd(xs)::ys)

fun reverse(xs: int list) : int list =
    pushReverse(xs,[])

fun pi(x: int, y: int, f: (int -> int)) : int =
    if x=y then
        f(x)
    else
        f(y)*pi(x,y-1,f)

fun pushReverse2(x: int, ys : int list) =
    if(x<10) then  
        x::ys
    else
        pushReverse2(x div 10, (x mod 10)::ys)

fun digits(x: int) : int list =
    pushReverse2(x, [])


fun addAllDigit(x: int) : int = 
    if x < 10 then
        x
    else 
        x mod 10 + addAllDigit(x div 10)

fun additivePersistence(x: int) : int =
    if x < 10 then
        0
    else
        1 + additivePersistence(addAllDigit(x))

fun digitalRoot(x: int) : int =
    if x < 10 then
        x
    else
        digitalRoot(addAllDigit(x))