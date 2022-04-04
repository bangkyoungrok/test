fun merge (l1, nil) = l1
  | merge (nil, l2) = l2
  | merge (h1::t1, h2::t2) = if h1<h2 then h1::(merge (t1, h2::t2)) else h2::(merge
  (h1::t1, t2));

fun reverse nil:int list = nil
  | reverse (h::t) = reverse(t)@[h];

fun pi (a:int, b:int, f:int->int) =
  if a <= b then f(a) * pi(a+1,b,f) else 1;

fun digits 0 = nil
  | digits n = let val (q,r) = (n div 10,n mod 10) in
                digits(q)@[r] end;

(*auxilary function to calculate the sum of the digits in a list*)
fun list_sum nil = 0
  | list_sum (h::t) = h + list_sum(t);

fun additivePersistence n = 
  if n < 10 then 0 else 1 + additivePersistence(list_sum(digits(n)));

fun digitalRoot n =
  if n < 10 then n else digitalRoot(list_sum(digits(n)));
