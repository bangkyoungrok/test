fun merge (xs: int list, ys: int list) =
    if (null(xs)) andalso (null(ys))
    then []
    else if (null(xs))
    then hd(ys)::merge(xs,tl(ys))
    else if (null(ys))
    then hd(xs)::merge(tl(xs),ys)
    else if (hd(xs)<hd(ys))
    then hd(xs)::merge(tl(xs),ys)
    else hd(ys)::merge(xs,tl(ys))

fun reverse (xs: int list)=
    if(null(xs))
    then []
    else if(null(tl(xs)))
    then [hd(xs)]
    else reverse(tl(xs))@[hd(xs)]
        

fun pi(a:int, b:int, f:int -> int) =
    if(a=b)
    then f(a) 
    else if(a>b)
    then 0
    else f(a)*pi(a+1,b,f)

fun square x = x * x
fun cube x = x * x * x

(*

First attempt of digits function using string. I realized after that I could have used the modulo to do this function with a list


fun digits(x:int) =
    if(x<0)
    then []
    else 
        let
            val y=Int.toString x                            (*converting the number to string to extract the first digit*)
            val c=valOf(Int.fromString(substring(y,0,1)))   (*extracting the first digit and convert it into int*)
        in
            if(size(y)=1)
            then [c]
            else c::digits(valOf(Int.fromString(substring(y,1,size(y)-1))))
        end
*)

(* Second attempt of the digits function with a list, that's easier when using modulo *)

fun digits(number:int) =
    if(number<=0)
    then []
    else digits(number div 10) @ [number mod 10]

fun digitAdd(l:int list) =
    if(null(l))
    then 0
    else hd(l) + digitAdd(tl l)

fun additivePersistence(number:int) =
    if(number<0)
    then 0
    else if((number)<=9)
    then 0
    else 1 + additivePersistence(digitAdd(digits(number)))

fun digitalRoot(number:int) =
    if(number<0)
    then 0
    else if(digitAdd(digits(number))<=9)
    then digitAdd(digits(number))
    else digitalRoot(digitAdd(digits(number)))
