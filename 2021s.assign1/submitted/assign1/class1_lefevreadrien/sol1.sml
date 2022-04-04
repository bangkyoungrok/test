(*Exercice 1*)
fun merge(list1 : int list, list2 : int list) =
    if null list1
        then list2
    else if null list2
        then list1
    else if hd(list1) < hd (list2)
        then hd(list1)::merge(tl(list1), list2)
    else hd(list2)::merge(list1, tl(list2))

(*Exercice2*)
fun reverse(list1 : int list) =
    if null list1
        then []
    else List.last(list1) :: reverse(List.take(list1, length list1 - 1))

(*Exercice3*)
fun pi(a : int, b : int, f)=
    if a <=b
        then f(a)*pi(a+1,b,f)
    else 1

fun f(a)=
    a*a

(*Exercice4*)
fun digits(a:int)=
    if a>0
        then digits(a div 10) @ [a mod 10]
    else []

(*Exercice5*)
fun sumList(list1 : int list)=
    if null list1 
    then 0
    else sumList(tl list1)+hd(list1)
    
fun additivePersistence(a : int)=
    if a <10
    then 0
    else additivePersistence(sumList(digits(a)))+1

fun digitalRoot(a : int)=
    if sumList(digits(a)) <10
    then sumList(digits(a))
    else digitalRoot(sumList(digits(a)))

