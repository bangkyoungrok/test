fun merge (xs : int list, ys : int list) =
  if null xs
  then ys
  else if null ys
        then xs
        else if hd (xs) < hd (ys)
              then hd (xs) :: merge(tl(xs),ys)
              else hd (ys) :: merge(xs,tl(ys));

fun reverse (xs : int list): int list =
  let fun append(xs: int list, ys: int list)=
        if null xs
        then ys
        else append(tl(xs),hd(xs) :: ys)
in  append(xs,[])
end;

fun pi(a:int,b:int,f:int->int)=
  if a>b
  then 1
  else f(a)*pi(a+1,b,f);

fun digits(a:int) =
  let fun append(x:int,xs:int list)=
        if x<10
        then x::xs
        else append(x div 10,x - x div 10 * 10 :: xs)
in append(a,[])
end;

fun additivePersistence( n:int) =
  let fun sum_list(xs: int list)=
      if null xs
      then 0
      else hd(xs) + sum_list(tl(xs))
      fun additive( n:int,a:int)=
      if n<10
      then a
      else additive(sum_list(digits(n)),a+1)
in  additive(n,0)
end;

fun digitalRoot(n:int)=
  let fun sum_list(xs: int list)=
      if null xs
      then 0
      else hd(xs) + sum_list(tl(xs))
in
    if n<10
    then n
    else digitalRoot(sum_list(digits(n)))
end;





