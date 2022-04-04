fun append (xs: int list, ys: int list) =
    if null xs then ys
    else hd(xs) :: append(tl(xs),ys)

fun sum_list (xs: int list) =
if null xs then 0
else hd(xs) + sum_list(tl(xs))

(*problem 1*) 
fun merge (list1:int list, list2:int list) =
    if null list1 then
        if null list2 then
            []
        else 
            hd list2::merge(list1,tl(list2))
    
    else 
        if null list2 then 
            hd list2::merge(tl(list1),list2)
        else if hd(list1) > hd(list2) then
            hd(list2) :: merge(list1,tl(list2))
            else
                hd(list1) :: merge(tl(list1),list2);

(*problem 2*) 
fun reverse nil = nil
|   reverse (x:int list) = append(reverse(tl(x)), hd(x)::[]);

(*problem 3*) 
fun pi (a,b,f) = 
    if a > b then 
        1
    else
        f(a) * pi(a+1,b,f);

(*problem 4*) 
fun digits(a:int) =
    if a >= 10 then
        reverse(a mod 10 :: reverse(digits(a div 10)))
    else [a];

(*problem 5*) 
fun additivePersistence(a:int) =
    if(a < 10) then
        0
    else
        additivePersistence(sum_list(digits(a)))+1;

fun digitalRoot(a:int) =
    if(a < 10) then
       a 
    else
        digitalRoot(sum_list(digits(a)));