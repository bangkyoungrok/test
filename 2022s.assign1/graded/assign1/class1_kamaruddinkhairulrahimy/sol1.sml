fun merge (x: int list, y: int list) =
  if null x
  then y
  else if null y
  then x
  else if hd x < hd y then hd x::merge(tl(x),y) else hd y::merge(x,tl(y))

(*additional function to be used in reverse() *)
fun append (xs : int list, ys : int list) =
  if null xs
  then ys
  else hd (xs) :: append (tl(xs), ys)

fun reverse (x: int list) =
  if null x
  then []
  else append(reverse(tl x),[hd x])

fun pi (x: int, y: int, f: int -> int) : int =
  if x>y
  then 1
  else f(x)*pi(x+1,y,f)

fun digits (x: int): int list =
  if x < 10
  then [x]
  else reverse(x mod 10 :: reverse(digits(x div 10)))

(*additional function to be used in digitalRoot() and additivePersistance()*)
fun sum_list (x: int list) =
  if null x
  then 0
  else hd x + sum_list(tl x)

fun  digitalRoot (x: int) =
  if x < 10
  then x
  else let val x = digits(x)
       in digitalRoot(sum_list(x))
       end 

fun additivePersistance(x: int) =
  if x < 10
  then 0
  else let val x = digits(x)
       in 1 + additivePersistance(sum_list(x))
       end
