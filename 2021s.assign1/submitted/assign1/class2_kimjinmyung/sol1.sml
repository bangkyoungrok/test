fun merge(xs:int list , ys:int list)=
  if null xs
  then ys
  else if null ys
  then xs
  else 
    if hd xs < hd ys then hd xs::merge(tl xs, ys) else hd ys::merge(xs, tl ys)

fun reverse(xs:int list)=
  if null(tl xs)
  then xs
  else 
    let fun append(l1:int list, l2:int list)=
      if null l1
      then l2
      else hd l1::append(tl l1, l2)
    in append(reverse(tl xs), [hd xs])
    end

fun pi(a:int, b:int, f:int -> int)=
  if a > b
  then 1
  else if a = b
  then f(a)
  else f(a)*pi(a+1, b, f)

fun digits(x:int)=
  if (x div 10) = 0
  then [x]
  else
   let fun append(l1:int list, l2:int list)=
      if null l1
      then l2
      else hd l1::append(tl l1, l2)
    in append(digits(x div 10), [x mod 10])
    end

fun additivePersistence(x:int)=
  if (x div 10) = 0
  then 0
  else 
    let fun sum_list(xs:int list)=
      if null xs
      then 0
      else hd xs + sum_list(tl xs)
    in additivePersistence(sum_list(digits(x))) + 1
    end

fun digitalRoot(x:int)=
  if (x div 10) = 0
  then x
  else 
    let fun sum_list(xs:int list)=
      if null xs
      then 0
      else hd xs + sum_list(tl xs)
    in digitalRoot(sum_list(digits(x)))
    end  
