fun merge(xs:int list, ys:int list) =
  if null xs
  then ys
  else if null ys
  then xs
  else if hd(xs)<hd(ys)
  then hd(xs)::merge(tl(xs),ys)
  else hd(ys)::merge(tl(ys),xs)

fun append(xs:int list, ys:int list) =
  if null xs
  then ys
  else hd(xs)::append(tl(xs),ys)

fun reverse(xs:int list) =
 if null xs
 then []
 else append(reverse(tl(xs)),[hd(xs)])

fun pi(a:int, b:int, f:int->int) =
  if a > b
  then 0
  else f(a)+pi(a+1,b,f)

fun digits(x:int) =
  if x div 10 =0
     then [x]
     else reverse(x mod 10::reverse(digits(x div 10))) 

fun sum_list(xs:int list) =
  if null xs
  then 0
  else hd(xs)+sum_list(tl(xs))

fun additivePersistence(x:int) =
  if x div 10 = 0
  then 0
  else additivePersistence(sum_list(digits(x)))+1

fun digitalRoot(x:int) =
  if x div 10 = 0
  then x
  else let val list1 = sum_list(digits(x))
       in digitalRoot(list1)
       end
