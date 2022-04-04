fun merge (xs : int list, ys : int list) =
    if null xs
    then ys
    else
    if null ys then xs
    else
    if hd(xs) < hd(ys) then hd(xs) :: merge(tl(xs), ys)
    else hd(ys) :: merge(xs, tl(ys))

fun push(ys : int list, z : int) =
        if null ys
        then [z]
        else hd(ys) :: push(tl(ys), z)

fun reverse (xs : int list) =
    if null xs then []
    else push(reverse(tl(xs)), hd(xs))

fun pi (a : int, b : int, f : int -> int) =
    if a > b then 1
    else f(a) * pi(a+1, b, f)

fun digits (x : int) =
    if x = 0 then [] 
    else push(digits(x div 10), x mod 10)

fun digitSum(x : int) =
    if x < 10 then x 
    else (x mod 10 + digitSum(x div 10))
        
fun additivePersistence (x : int) =
    let
        val sum1 = digitSum(x)
    in
        if x < 10 then 0
        else
        if sum1 < 10 then 1
        else 1 + additivePersistence(sum1)
    end

fun digitalRoot (x : int) = 
    let
        val sum1 = digitSum(x)
    in
        if sum1 < 10 then sum1
        else digitalRoot(sum1)
    end