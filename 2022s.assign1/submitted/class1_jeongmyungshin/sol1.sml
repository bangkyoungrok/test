fun merge(xs : int list, ys : int list) =
    if null xs
    then ys
    else if null ys
    then xs
    else
        if hd xs < hd ys
        then hd xs :: merge(tl(xs), ys)
        else hd ys :: merge(xs, tl(ys))


fun reverse(xs : int list) = 
    let 
        val num = length(xs)
        val tl_list = xs
    in 
        if tl(tl_list) = []
        then hd(tl_list) :: []
        else
            if num > 0
            then hd(List.drop(tl_list, num-1))::reverse(List.take(xs, num-1))
            else xs
    end

fun pi(a: int, b : int, f:int->int) = 
    let 
        fun func(x:int) = 2*x + 1
    in
        if b < a
        then 1
        else func(a) * pi(a+1,b,f)
    end

fun digits(x: int) =
    if x = 0
    then []
    else x mod 10 :: digits(x div 10)

fun additivePersistence(x:int) = 
    let
        val list = digits(x)
        fun sum(xs:int list) = if null xs then 0 else hd(xs) + sum(tl(xs))
    in
        if x = 0
        then []
        else 
            if x < 10
            then []
            else sum(list)::additivePersistence(sum(list))
    end

fun digitalRoot(x:int) = 
    let
        val list = digits(x)
        fun sum(xs:int list) = if null xs then 0 else hd(xs) + sum(tl(xs))
    in
        if x = 0
        then x
        else
            if x < 10
            then x
            else digitalRoot(sum(list))
    end
