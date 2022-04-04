fun merge(l1 : int list , l2 : int list) =
    if null l1 then l2
    else if null l2 then l1
    else if hd(l1) < hd(l2)
    then hd(l1) :: merge(l2, tl(l1))
    else hd(l2) :: merge(tl(l2), l1)

fun rev (l1 : int list, l2 : int list) = 
    if null l1
    then l2
    else rev(tl(l1), hd(l1)::l2)

fun reverse (l : int list) =
    rev (l, []) 

fun pi(a : int, b : int, f : int -> int) = 
    if a = b then f(a)
    else f(a) * pi(a+1, b, f)

fun make_digit_list(a : int) = 
    if a = 0 then []
    else a mod 10 :: make_digit_list(a div 10)

fun digits(a : int) =
    reverse(make_digit_list(a))

fun list_sum(a : int list) =
    if null a then 0
    else hd(a) + list_sum(tl(a))

fun digitalRoot(a: int) =
    if a > 0 andalso a < 10 then a
    else digitalRoot(list_sum(make_digit_list(a)))

fun additivePersistence(a : int) = 
    if a > 0 andalso a < 10 then 0
    else 1 + additivePersistence(list_sum(make_digit_list(a)))