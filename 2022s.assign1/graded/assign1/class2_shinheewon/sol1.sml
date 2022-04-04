(* problem 1
 * merge function 
 *)

fun merge (x : int list, y : int list) : int list =
  if null (x)
  then y
  else 
    if null (y)
    then x
    else
      if hd (x) >= hd (y)
      then hd (y) :: merge (x, tl (y))
      else hd (x) :: merge (tl (x), y)

(* problem 2
 * reverse function 
 *)
(* use @
fun reverse1 (x : int list) = 
  if null (x)
  then []
  else reverse1(tl x) @ (hd (x) :: [])
 *)

fun reverse (x : int list) : int list =
  let 
    fun makeReverse (xs : int list, ys : int list) =
      if null xs
      then ys
      else makeReverse (tl (xs), hd xs :: ys)
  in makeReverse(x, [])
  end

(* problem 3
 * pi function
 *)
fun pi (a : int, b : int, f : int -> int) : int =
  if a >= b
  then f(b)
  else f(a) * pi(a+1, b, f)

(* problem 4
 * digits function
 *)
(* use @
fun digits1 (x : int) : int list =
  if x = 0
  then []
  else digits1(x div 10) @ ((x mod 10) :: [])
 *)
fun digits (x : int) : int list =
  let
    fun digitsHelp (xx : int, ys : int list) =
      if xx = 0
      then ys
      else digitsHelp (xx div 10, (xx mod 10) :: ys)
  in digitsHelp(x, [])
  end

(* problem 5
 * digital roots and additive persistence
 *)
(* Help Function
fun addList (x : int list) =
  if null x
  then 0
  else hd x + addList (tl x)
 *)
fun additivePersistence (x : int) : int =
  let 
    fun addList (xx : int list) =
    if null xx
    then 0
    else hd xx + addList (tl xx)
  in
    if x div 10 = 0
    then 0
    else 1 + additivePersistence(addList(digits(x)))
  end

fun digitalRoot (x : int) : int =
  let
    fun addList (xx : int list) =
    if null xx
    then 0
    else hd xx + addList (tl xx)
  in
    if x div 10 = 0
    then x
    else digitalRoot(addList(digits(x)))
  end
