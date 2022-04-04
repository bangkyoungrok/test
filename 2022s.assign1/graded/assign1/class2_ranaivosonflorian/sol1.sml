

fun merge(x:int list, y:int list):int list=
    
    if null(x) (*si x list null*)
    then y     (*then return y*)
    else hd(x)::merge(tl (x),y);


fun reverse_helper(x:int list, y:int list):int list=
    if null(x)
    then y
    else reverse_helper(tl(x), hd(x)::y);

fun reverse(x:int list):int list=
    reverse_helper(x, []);


fun pi(a:int, b:int, f:int->int):int=
  if a=b
  then f(a)
  else f(a)*pi(a+1, b, f);


fun digits(x:int):int list=
  if x < 10
  then [x]
  else digits(x div 10) @ [x mod 10];


fun sum(x:int list):int=  (*helper for digitalRoot*)
  if null x
  then 0
  else hd(x) + sum(tl(x));


fun digitalRoot(n:int):int=
  if n = 0
  then 0
  else sum(digits(n));

fun additivePersistence(n:int):int=
  if n < 10
  then 0
  else 1+additivePersistence(digitalRoot(n));


















    





