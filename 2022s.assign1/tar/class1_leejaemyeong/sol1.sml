fun merge (a : int list, b : int list) =
  if null a  then b
  else if null b  then a
  else if hd a < hd b then hd a :: merge(tl a, b)
  else hd b :: merge(a, tl b);

fun reverse (n : int list) =
  if n = [] then []
  else let fun append(al : int list, bl : int list) = 
  if null al then bl
  else hd al :: append(tl al, bl) in append(reverse(tl n), [hd n]) end;

fun pi (a : int, b : int, f : (int -> int)) = 
  if a > b then 1 else f(a) * pi(a+1,b,f);

fun digits (n : int) = 
  let fun getDigitsList (x : int) =
  if x < 10 then [x]
  else x mod 10 :: getDigitsList(x div 10) in reverse(getDigitsList n) end;

fun additivePersistence (n : int) = 
  if n < 10 then 0
  else let fun sum(x : int) =
  if x < 10 then x
  else x mod 10 + sum(x div 10) in 1 + additivePersistence(sum n) end;

fun digitalRoot (n : int) = 
  if n < 10 then n
  else let fun sum(x : int) =
  if x < 10 then x
  else x mod 10 + sum(x div 10) in digitalRoot(sum n) end;