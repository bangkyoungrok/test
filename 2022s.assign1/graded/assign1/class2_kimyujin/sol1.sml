fun merge(xs : int list, ys : int list) =
	if null xs
	then ys
	else if null ys
	then xs
	else if hd(xs) > hd(ys)
	then hd(ys)::merge(xs, tl(ys))
	else hd(xs)::merge(tl(xs),ys);

fun reverse(xs : int list) = 
    if null xs
    then []
    else reverse(tl(xs)) @ [hd(xs)];
    
fun pi(a : int, b : int, f : int -> int) = 
    if a > b
    then 1
    else f(a)*pi(a+1, b, f);

fun digits(x : int) = 
    if x < 1
    then []
    else digits(x div 10) @ [x mod 10];

fun sum_list (xs : int list) =
    if null xs
    then 0
    else hd(xs) + sum_list(tl(xs));

fun digitalRoot(x : int) =
    if x < 10
    then x
    else digitalRoot(sum_list(digits(x)));

fun additivePersistence(x : int) = 
    if x < 10
    then 0
    else additivePersistence(sum_list(digits(x))) + 1;