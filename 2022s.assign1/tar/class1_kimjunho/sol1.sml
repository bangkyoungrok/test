fun merge(x: int list, y: int list) =
  if null(x) then y
  else if null(y) then x
  else
    if hd(x) < hd(y) 
    then hd(x) :: merge(tl(x), y)
    else hd(y) :: merge(x, tl(y))
;

fun reverse(arr: int list) = 
  let fun reverseHelp(x: int list, y: int list) = 
    if null(x) then y
    else reverseHelp(tl(x), hd(x) :: y)
  in
    reverseHelp(arr, [])
  end
;

fun pi(a: int, b: int, f: int -> int) = 
  if a > b then 1
  else f(a) * pi(a + 1, b, f)
;

fun digits(x: int): int list = 
  let fun revDigits(x: int): int list =
    if x < 10 then [x]
    else (x mod 10) :: revDigits(x div 10)
  in
    reverse(revDigits(x))
  end
;

fun digitSum(x) = 
  if x < 10 then x 
  else x mod 10 + digitSum(x div 10)
;

fun digitalRoot(x) = 
  if x < 10 then x 
  else digitalRoot(digitSum(x))
;

fun additivePersistence(x) =
  if x < 10 then 0
  else 1 + additivePersistence(digitSum(x))
;