(* 1. Merge Lists *)
fun merge(lhs: int list, rhs: int list): int list = 
  if null(lhs) then rhs else
  if null(rhs) then lhs else

  if hd(lhs) < hd(rhs)
  then hd(lhs)::merge(tl(lhs), rhs)
  else hd(rhs)::merge(lhs, tl(rhs))


(* 2. Reverse List *)
fun reverse(arr: int list): int list =
  let
    fun lastOf(xs: int list): int =
      if null (tl xs)
      then hd xs
      else lastOf(tl xs)
    fun poppedArrayOf(xs: int list): int list =
      if null (tl xs)
      then []
      else hd(xs)::poppedArrayOf(tl(xs))      
  in
    if null arr 
    then []
    else lastOf(arr)::reverse(poppedArrayOf(arr))
  end

(* 3. Pi Function *)
fun pi(a: int, b: int, f: int -> int): int = 
  if a >= b
  then f(b)
  else f(a) * pi(a + 1, b, f)


(* 4. Digits Fuction *)
fun digits(num: int): int list =
  let
    fun appendItem(toList: int list, item: int): int list = 
      if null toList
      then [item]
      else hd(toList) :: appendItem(tl(toList), item)
  in
    if num < 10
    then [num]
    else appendItem(digits(num div 10), num mod 10)
  end

(* 5. Digital Roots and Additive Persistence *)
fun sumList(xs: int list): int =
  if null xs
  then 0
  else hd(xs) + sumList(tl(xs))

fun additivePersistence(num: int): int = 
  if num < 10
  then 0
  else additivePersistence(sumList(digits(num))) + 1

fun digitalRoot(num: int): int =
  if num < 10
  then num
  else digitalRoot(sumList(digits(num)))
