



(*exo 1 : Merge Lists  *)



(*exo 2 : Reverse List *)

fun reverse( x : int list ) = 
  if null(x) then x
  else  reverse(tl(x)) @ [hd(x)];



(*exo 3 : Pi Function *)




fun pi(a : int , b : int,f ) = 
  if a = b then f(b)
  else f(a) * pi(a+1,b,f);



(*exo 4 : Digits Function *)
fun tab(x : int) = 
  if x<0 then tab(~x)
  else if x div 10 =  0 then x :: nil
  else   x mod 10 :: tab(x div 10);


fun digits(x : int) =
  reverse(tab(x));


(*exo 5 : Digital Roots and Additive Persistence*)

fun sum_tab (x : int list ) = 
 if null(x) then 0
 else hd(x) + sum_tab(tl(x));

fun digitalRoot ( x : int ) = 
  if x div 10 = 0 then x 
  else digitalRoot(sum_tab(digits(x)));

fun additivePersistence(x : int) = 
 if x div 10 = 0 then 0 
  else 1 + additivePersistence(sum_tab(digits(x)));


