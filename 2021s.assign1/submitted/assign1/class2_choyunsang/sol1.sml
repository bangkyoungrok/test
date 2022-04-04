(* 2015001103 choyunsang *)

fun merge (a: int list, b: int list) = 
    if null a
    then b
    else if null b
        then a
        else if hd(a) < hd(b)
             then hd(a) :: merge(tl(a), b)
             else hd(b) ::merge(a, tl(b));


fun reverse (a: int list) = 
    if null a
    then []
    else reverse(tl(a)) @ [hd(a)];


fun pi(a: int, b: int, f: int -> int) = 
    if b = a
    then f(b)
    else f(b) * pi(a, b-1, f);


fun digits(a: int) = 
    if a < 10
    then a :: []
    else digits(a div 10) @ [a mod 10];


fun additivePersistence(a: int) = 
    if a < 10
    then 0
    else let
            fun sumdigits(x: int list) = 
                if null x
                then 0
                else hd(x) + sumdigits(tl(x))
         in 1 + additivePersistence(sumdigits(digits(a)))
         end;


fun digitalRoot(a: int) = 
    if a < 10
    then a
    else let
            fun sumdigits(x: int list) = 
                if null x
                then 0
                else hd(x) + sumdigits(tl(x))
         in digitalRoot(sumdigits(digits(a)))
         end;


