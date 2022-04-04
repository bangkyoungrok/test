fun append(xs: int list, ys: int list) = 
    if null xs then ys
    else hd(xs):: append(tl(xs),ys)

fun sum_list(xs: int list) = 
    if null xs
    then 0
    else hd(xs) + sum_list(tl(xs))
(*위 두 함수는 수업 자료에 있는 함수를 참고하였습니다*)

(*1*)
fun merge(l1: int list, l2: int list) = 
    if null l1
    then if null l2 then [] else hd l2 :: merge(l1,tl(l2))
    else if null l2 then hd l1 :: merge(tl(l1),l2)
    else if hd(l1) > hd(l2) then hd(l2)::merge(l1,tl(l2))
    else hd(l1)::merge(tl(l1),l2)
    
(*2*)
fun reverse(x: int list) = 
    if null x then x
    else append(reverse(tl(x)),hd x :: [])

(*3*)
fun pi(a: int ,b: int, f:(int->int)) = 
    if a = b then f(b)
    else f(a) * pi(a+1,b,f)

(*4*)
fun digits(x: int) = 
    if x = 0 then []
    else reverse(x mod 10 :: reverse(digits(x div 10)))

(*5*)
fun digitalRoot(x: int) = 
    if x div 10 = 0 then x
    else digitalRoot(sum_list(digits(x)))

fun additivePersistence(x: int) =
    if x div 10 = 0 then 0
    else additivePersistence(sum_list(digits(x))) + 1