fun merge(a : int list, b : int list) : int list = 
    if null(a) then b
    else if null(b) then a
    else (
        if hd(a) < hd(b) 
        then hd(a)::merge(tl(a), b) 
        else hd(b)::merge(a, tl(b))
    )

fun reverse(a : int list) : int list =
    if null(a) then []
    else (
        let
            fun filltemp(target : int list, temp : int list) : int list =
                if null(target) then temp
                else filltemp(tl(target), hd(target) :: temp)
        in
            filltemp(a, [])
        end
    )

fun pi(a : int, b : int, f : (int->int)) : int =
    if a > b then 1
    else if a = b then f(a)
    else f(a) * pi(a + 1, b, f)

fun digits(num : int) : int list =
    if num div 10 = 0
    then [num]
    else (
        let 
            fun push(target : int, temp : int list) : int list =
                if target div 10 = 0
                then target mod 10 :: temp
                else push(target div 10, target mod 10 :: temp)
        in
            push(num, [])
        end
    )

fun additivePersistence(x : int) : int =
    let
        fun sum(lst : int list) : int = if null(lst) then 0 else (hd(lst) + sum(tl(lst)))
        val value = sum(digits(x));
    in
        if x div 10 = 0
        then 0
        else 1 + additivePersistence(value)
    end

fun digitalRoot(x : int) : int =
    let
        fun sum(lst : int list) : int = if null(lst) then 0 else (hd(lst) + sum(tl(lst)))
        val value = sum(digits(x));
    in
        if value div 10 = 0
        then value
        else digitalRoot(value)
    end