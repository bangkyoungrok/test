fun merge(xs : int list, ys : int list) =
  if null xs
  then ys
  else if null ys
  then xs
  else if hd(xs) < hd(ys)
  then hd(xs)::merge(tl(xs), ys)
  else hd(ys)::merge(xs, tl(ys))
 
fun reverse(xs : int list) =
  if null xs
  then []
  else reverse(tl(xs))@[hd(xs)]

fun pi(a : int, b : int, f) =
  if a > b
  then 1
  else f(a)*pi(a+1,b,f)

fun digits(x : int) =
  if x=0
  then []
  else digits(x div 10)@(x mod 10)::[]

fun digitalRoot(x : int) =
  if x=0
  then 0
  else let val x = ((x mod 10) + digitalRoot(x div 10)) in
    if x>9
    then digitalRoot(x)
    else x
             end

fun additivePersistence(x : int) =
  if x <= 9
  then 0
  else let fun temp(y : int) =
        if y = 0
        then 0
        else (y mod 10) + temp(y div 10) in
          let val x = temp(x) in
            if x > 9
            then 1 + additivePersistence(x)
            else 1
          end
       end

