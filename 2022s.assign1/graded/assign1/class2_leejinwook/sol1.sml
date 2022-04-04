fun merge([], R:int list):int list = R
    | merge(L:int list, []):int list = L
    | merge(L:int list , R:int list):int list =
        if hd(L) < hd(R)
        then hd(L)::merge(tl(L), R)
        else hd(R)::merge(L, tl(R));

fun asd(x:int list, y:int list):int list =
    if null(x)
    then y
    else asd(tl x, hd x :: y);

fun reverse(x:int list):int list =
    asd(x,[]);

fun pi(a:int, b:int, f):int = 
    if a > b
    then 1
    else f(a) * pi(a + 1, b, f);

fun qwe(x:int, y:int list):int list =
    if x = 0
    then y
    else qwe(x div 10, (x - x div 10 * 10) :: y);

fun digits(x:int):int list =
    qwe(x,[]);

fun sum_list(x:int list):int =
    if null(x)
    then 0
    else hd(x) + sum_list(tl(x));

fun additivePersistence(x:int):int =
    if x < 10
    then 0
    else 1 + additivePersistence(sum_list(digits x));

fun digitalRoot(x:int):int =
    if x < 10
    then x
    else digitalRoot(sum_list(digits x));