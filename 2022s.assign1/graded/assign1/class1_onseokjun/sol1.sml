fun merge(x : int list, y : int list) =
  if null x 
  then if null y 
       then []
       else hd y :: merge(x, tl y)
  else
       if null y
       then hd x :: merge(tl x, y)
       else if hd x > hd y 
            then hd y :: merge(x, tl y)
            else hd x :: merge(tl x, y)

fun makingReverse(x : int list, y : int list) =
  if null x
  then y
  else makingReverse(tl x, hd x :: y)

fun reverse(x : int list) =
  makingReverse(x, [])


fun pi(a : int, b : int, f : int -> int) =
  if a > b
  then 1
  else f(b) * pi(a, b - 1, f)

fun makingDigits(x : int, ret : int list) = 
  if x = 0
  then ret
  else makingDigits(x div 10, x mod 10 :: ret)

fun digits(x : int) =
  makingDigits(x, [])

fun makingSum(x : int list, y : int) =
  if null x
  then y
  else makingSum(tl x, y + hd x)

fun sumList(x : int list) = 
  makingSum(x, 0)

fun makingAdditivePersistence(x : int, y : int) =
  if x < 10
  then y
  else makingAdditivePersistence(sumList(digits(x)), y + 1)

fun additivePersistence(x : int) =
  makingAdditivePersistence(x, 0)

fun digitalRoot(x : int) = 
  if x < 10
  then x
  else digitalRoot(sumList(digits(x)))



  
