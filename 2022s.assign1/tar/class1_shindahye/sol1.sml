fun merge(xs: int list, ys: int list) =
  if null xs
  then ys
  else if null ys
       then xs
       else if hd(xs) < hd(ys)
            then hd(xs)::merge(tl(xs), ys)
            else hd(ys)::merge(xs, tl(ys));


(* 
fun reverse (xs: int list) =
  let fun intToList (x: int) =
        x::[]
      
      fun append (as: int list, bs: int list) =
        if null as
        then bs
        else (hd as)::append(tl as, bs)
  in
    if null xs
    then []
    else append(reverse(tl xs), intToList(hd xs))
  end
  *)
  
fun intToList (x: int) =
  x::[]
 
fun append (xs: int list, ys: int list) =
  if null xs
  then ys
  else (hd xs)::append(tl xs, ys)
 
fun reverse(xs: int list) =
  if null xs
  then []
  else append(reverse(tl xs), intToList(hd xs))


fun pi (a: int, b: int, f: int->int) =
  let fun cal (last: int) =
    if last = b
    then f(last)
    else f(last) * cal(last+1)
  in
    cal a
  end


fun digits (x: int) =
  let fun len (num: int) =
        if num < 10
        then 1
        else 1 + len(num div 10)
      
      fun pow (n: int) =
        if n = 0
        then 1
        else 10 * pow(n-1)

      val n = len(x)
      val digit = x div pow(n-1)
      val next = x - (digit * pow(n-1))
  in
      if digit = 0
      then []
      else digit::digits(next)
  end


fun digits (x: int) =
  let fun len (num: int) =
        if num < 10
        then 1
        else 1 + len(num div 10)

      fun pow (n: int) =
        if n = 0
        then 1
        else 10 * pow(n-1)

      val n = len(x)
      val digit = x div pow(n-1)
      val next = x - (digit * pow(n-1))
  in 
      if digit = 0
      then []
      else digit::digits(next)
  end


fun listsum (xs: int list) =
  if null xs
  then 0
  else hd xs + listsum(tl xs)


fun additivePersistence (x: int) =
let fun count (n: int, y: int) =
  if y < 10
  then n
  else count (n+1, listsum(digits(y)))
in
  count (0, x)
end


fun digitalRoot (x: int) =
let val digitList = digits(x)
    val sum = listsum(digitList)
in
  if sum < 10
  then sum
  else digitalRoot(sum)
end



