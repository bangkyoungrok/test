(*Question 1*)
fun merge(l1: int list, l2: int list) =
    if null l1
        then l2
    else if null l2
        then l1
    else if hd(l1) < hd(l2)
        then hd(l1)::merge(tl(l1),l2)
    else hd(l2)::merge(l1,tl(l2))

(*Question 2*)
fun reverse(l1: int list) =
    if length l1 = 1
        then l1
    else List.last(l1)::reverse(List.take(l1,length l1 - 1))

(*Question 3*)
fun pi (a: int, b: int, f) =
    if a = b
    then f(b)
    else f(a)*pi(a+1, b, f);

(*Question 4*)
fun digits (a: int)=
    if a < 10
    then [a]
    else digits(a div 10) @ [a mod 10] 

(*Question 5*)
fun sumList (a: int list) =
    if length a = 1
    then hd(a)
    else hd(a) + sumList(tl(a))

fun additivePersistence (a: int) =
    if a < 10
    then 0
    else 1 + additivePersistence(sumList(digits a))

fun digitalRoot(a: int) =
    if sumList(digits a) < 10
    then sumList(digits a)
    else digitalRoot(sumList(digits a))
