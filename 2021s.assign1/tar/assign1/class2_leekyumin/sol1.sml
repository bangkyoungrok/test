fun merge(xs:int list, ys:int list)=
    let 
        val a = []
    in
        if null xs
        then ys
        else if null ys
        then xs
        else if hd(xs)>hd(ys)
        then a@[hd(ys)]@merge(xs,tl(ys))
        else a@[hd(xs)]@merge(tl(xs),ys)
    end

fun reverse(xs : int list) =
    if null xs
    then []
    else if null (tl xs)
    then xs
    else reverse(tl(xs)) @ [hd(xs)]

fun pi(a :int , b:int , f:int -> int) =
    if a>b
    then 1
    else a*pi(a+1,b,f)

fun digits(x:int)=
    if (x div 10) =0
    then [x]
    else digits(x div 10) @ [x mod 10]

fun digitalRoot(x:int)=
    if x<10
    then x
    else 
        let
            val a = (x mod 10) + digitalRoot(x div 10)
        in
            if a<10
            then a
            else digitalRoot(a)
        end


fun additivePersistence(x:int )=
    if x<10
    then 0
    else
        let 
            fun addDigits(x: int) =
                if x<10
                then x
                else (x mod 10) + addDigits(x div 10)
        in
            if addDigits(x)<10
            then 1
            else additivePersistence(addDigits(x)) +1
        end