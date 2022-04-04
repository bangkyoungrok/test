fun merge(x: int list, y: int list):int list =
    if null(x) then y
    else 
        if null(y) then x
    else
        if hd(x) < hd(y)
        then hd(x) :: merge(tl(x), y)
        else hd(y) :: merge(x, tl(y));

merge([2,6,7], [1,4,5]);

fun append_num(x: int list, y: int):int list =
    if null x then [y]
    else hd x :: append_num(tl x, y)

fun reverse(x: int list):int list =
    if null(tl x) then x
    else append_num(reverse(tl x), hd x);

reverse([1,5,4]);

fun f(x:int):int = 
    x*x;

fun pi(x: int, y: int, f:int -> int):int =
    if x = y then f(y)
    else f(x) * pi(x+1, y, f);

pi(1, 7, f);

fun digits(x: int):int list =
    if x div 10 = 0 then [x]
    else append_num(digits(x div 10), x mod 10);

digits(253);