(*Problem1*)
fun merge(x: int list, y: int list): int list =
if null x
then y
else
    if null y
    then x
    else
        if hd(x) < hd(y)
        then hd(x)::merge(tl(x), y)
        else hd(y)::merge(x, tl(y));

(*Problem2*)
fun reverse(x: int list): int list =
let fun mergeList(x: int list, y: int list): int list =
    if null x
    then y
    else
        mergeList(tl(x), hd(x)::y)
in 
    mergeList(x, []) end;



(*Problem3*)
fun pi(a: int, b: int, f:int->int): int =
if a = b
then f(a)
else
    f(a) * pi(a + 1, b, f);


(*Problem4*)
fun digits(x: int): int list =
let fun makeList(a: int): int list =
    if a < 10  
    then [a]
    else
        (a mod 10)::makeList(a div 10)
fun reverse(x: int list): int list =
let fun mergeList(x: int list, y: int list): int list =
    if null x
    then y
    else
        mergeList(tl(x), hd(x)::y)
in 
    mergeList(x, []) end;
in      
    reverse(makeList(x))
end;


(*Problem5*)
fun sumList(xs: int list): int =
if null xs
then 0
else
    hd(xs) + sumList(tl(xs));


fun countList(x: int, y: int): int =
if x < 10
then y
else 0 + countList(sumList(digits(x)), y + 1);


fun digitalRoot(x: int): int =
let 
    val a = sumList(digits(x))
in
    if a < 10
    then a
    else digitalRoot(sumList(digits(a)))
end;


fun additivePersistence(x: int): int =
countList(x, 0);
