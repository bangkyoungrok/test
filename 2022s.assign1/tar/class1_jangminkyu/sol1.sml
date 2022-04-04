fun merge(xlist, nil) = xlist
|merge(nil, ylist) = ylist
|merge(x::xlist, y::ylist)
= if(x < y) then x::merge(xlist, y::ylist) else y::merge(x::xlist, ylist);

fun reverse(nil:int list) = []
|reverse(x::xlist) = 
reverse(xlist) @ [x] @ [];

fun pi(a: int, b: int, f:int -> int) =
if (a = b) then f(a) else f(a)*pi(a+1, b, f);

fun digits(x: int) =
if (x = 0) then [] else digits(x div 10) @ [x mod 10] @ [];

fun additivePersistence(x: int) =
let fun sumList [] = 0
|sumList(y::ylist) = y + sumList(ylist)
in if (x div 10 = 0) then 0 else (1 + additivePersistence(sumList(digits(x))))
end;

fun digitalRoot(x: int) = 
let fun sumList [] = 0
|sumList(y::ylist) = y + sumList(ylist)
in if(x div 10 = 0) then x else digitalRoot(sumList(digits(x)))
end;