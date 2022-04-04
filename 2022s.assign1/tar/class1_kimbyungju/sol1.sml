fun merge([], []) = []
|   merge(x, []) = x
|   merge([], y) = y
|   merge(x, y) = 
        if hd(x) < hd(y)
        then hd(x) :: merge(tl(x), y)
        else hd(y) :: merge(x, tl(y))
;
fun reverse(x) =
    if null(x) 
    then x
    else reverse(tl(x)) @ [hd(x)]
;
fun pi(a, b, f) = 
    if a = b 
    then f(b)
    else pi(a+1, b, f) * f(a)
;
fun digits(a) = 
    if a = 0
    then []
    else digits(a div 10) @ [a mod 10]
;
fun addDigits([]) = 0
|   addDigits(x) = hd(x) + addDigits(tl(x))
;
fun additivePersistence(n) = 
    if n < 10
    then 0
    else additivePersistence(addDigits(digits(n)))+1
;
fun digitalRoot(n) = 
    if n < 10
    then n
    else digitalRoot(addDigits(digits(n)))
;