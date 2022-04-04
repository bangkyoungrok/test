fun merge (x : int list, y : int list) : int list =
    if null x
    then y
    else if null y
        then x
        else if hd x < hd y
            then hd x::merge(tl x, y)
            else hd y::merge(tl y, x);

fun reverse (x : int list) = 
    let fun reverse_list(ans, a : int list) = 
        if null a
        then ans
        else reverse_list(hd a::ans, tl a)
    in
        reverse_list([], x)
    end;

fun pi(a, b : int, f : int->int) =
    if a < b
    then 1
    else f(a) * pi(a-1,b,f);

fun digits (x : int) =
    let fun reverse_digits(x : int) = 
        if x div 10 = 0
        then [x mod 10]
        else (x mod 10)::reverse_digits(x div 10)
    in
        reverse(reverse_digits(x))
    end;

fun digitalRoot(x : int) = 
    let fun list_sum(arr : int list) = 
        if null arr
        then 0
        else hd arr + list_sum(tl arr)
    in
        if(null (tl (digits(x))))
        then hd (digits(x))
        else digitalRoot(list_sum(digits(x)))
    end;

fun additivePersistence(x : int) = 
    let fun list_sum(arr : int list) = 
        if null arr
        then 0
        else hd arr + list_sum(tl arr)
    in
        if(null (tl(digits(x))))
        then 0
        else 1 + additivePersistence(list_sum(digits(x)))
    end;
