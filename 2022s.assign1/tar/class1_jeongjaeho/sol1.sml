
fun merge (xs : int list, ys: int list)= 
  if null xs
        then ys
  else if null ys
        then xs
  else if hd(xs) < hd(ys)
        then hd(xs) :: merge(tl(xs), ys)
  else  hd(ys) :: merge(xs, tl(ys))



fun reverse (xs : int list) = 
  if null xs
        then []
  else reverse(tl(xs)) @ [hd(xs)];
 


fun pi (a, b, f) = 
  if a = b
        then f(b)
  else
        f(a)* pi(a+1, b, f);
fun add (a : int) = 
  a;


fun digits(a) = 
  if a < 10
        then [a]
  else digits(a div 10) @ [a mod 10];


fun sum(a) = 
  if null a
        then 0
  else
        hd(a) + sum(tl(a));
fun digitalRoot(a) = 
  if a < 10
        then a
  else
    digitalRoot(sum(digits(a)));

fun additivePersistence(a) = 
  if a < 10
        then 0
  else
        1 + additivePersistence(sum(digits(a)));


        

