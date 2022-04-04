
fun merge(xs: int list, ys: int list) =
    if null xs
        then ys
    else if null ys
        then xs
    else if hd xs < hd ys
        then hd xs::merge(tl xs, ys)
    else
        hd ys::merge(xs, tl ys)


fun reverse(xs: int list) =
    let fun append(ys: int list, zs: int list) =
        if null ys
            then zs
        else
            hd ys::append(tl ys, zs)
    in
        if null xs
            then []
        else
            append(reverse(tl xs), [hd xs])
    end


fun pi(a: int, b: int, f: (int -> int)) =
    if a = 0
        then 0
    else if a = b
        then f(a)
    else
        f(a) * pi(a+1, b, f)


fun digits(a: int) =
    let fun append(ys: int list, zs: int list) =
        if null ys
            then zs
        else
            hd ys::append(tl ys, zs)
    in
        if (a div 10) = 0
            then [a]
        else
            append(digits(a div 10), [a - (a div 10)*10])
    end


fun additivePersistence(a: int) =
    let fun addDigit(n: int) =
        if n >= 0 andalso n < 10
            then n
        else
            addDigit(n div 10) + (n - (n div 10)*10)
    in
        if addDigit(a) < 10
            then 1
        else
            additivePersistence(addDigit(a)) + 1
    end


fun digitalRoot(a: int) =
    let fun addDigit(n: int) =
        if n >= 0 andalso n < 10
            then n
        else
            addDigit(n div 10) + (n - (n div 10)*10)
    in
        if addDigit(a) < 10
            then addDigit(a)
        else
            digitalRoot(addDigit(a))
    end
