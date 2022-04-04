fun merge (xs:int list, ys: int list)=
    if null xs
    then ys
    else if null ys
    then xs
    else if hd(xs)<hd(ys)
    then hd(xs)::merge(tl(xs),ys)
    else hd(ys)::merge(xs,tl(ys))
;

fun reverse(ns: int list)=
    let fun func(xs: int list, ys: int list) =
        if null xs
        then ys
        else func(tl(xs),hd(xs)::ys)
    in
    func(ns,[])
    end
;

fun pi(a:int , b:int , f:int->int)=
    if a=b
    then f(b)
    else if a>b
    then 0
    else f(a)*pi(a+1,b,f)
;

fun digits(n :int)=
    let fun getlist(x: int, xs: int list)=
        if x<10
        then x::xs
        else (x mod 10)::getlist(x div 10,xs)
    in
    let fun digit_reverse(ys: int list, zs: int list) =
        if null ys
        then zs
        else digit_reverse(tl(ys),hd(ys)::zs)
    in
    digit_reverse(getlist(n,[]),[])
    end
    end
;

fun additivePersistence(x: int)=
    let fun sumdigit(n:int)=
        if n<10
        then n
        else n mod 10 + sumdigit(n div 10)
    in
    if sumdigit(x)<10
    then 1
    else 1+additivePersistence(sumdigit(x))
    end
;

fun digitalRoot(x: int)=
    let fun sumdigit(n:int)=
        if n<10
        then n
        else n mod 10 + sumdigit(n div 10)
    in
    if sumdigit(x)<10
    then sumdigit(x)
    else digitalRoot(sumdigit(x))
    end
;
