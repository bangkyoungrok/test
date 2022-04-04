fun merge (x: int list, y: int list): int list =
  if x = [] then y
  else if y = [] then x
  else if hd(x) < hd(y)
  then hd(x)::merge(tl(x), y)
  else hd(y)::merge(x, tl(y))

fun reverse (a: int list): int list =
  if a = []
  then []
  else reverse(tl(a)) @ [hd(a)]

fun pi(a: int, b: int, f:int->int): int =
  if a > b
  then 1
  else if a = b
  then f(a)
  else f(a)*pi(a+1, b, f)

fun digits (a: int): int list =
  if a < 10
  then [a]
  else digits(a div 10) @ [a mod 10]

fun digitalRoot(a: int): int =
  if a < 10
  then a
  else
    let fun sumdigits (x: int) =
      if x < 10
      then x
      else x mod 10 + sumdigits(x div 10)
    in
      digitalRoot(sumdigits(a))
    end

fun additivePersistence(n: int): int = 
  if n < 10
  then 0
  else
    let fun sumList (x: int list) =
      if null x
      then 0
      else hd(x) + sumList(tl x)
    in
      additivePersistence(sumList(digits(n))) + 1
    end
