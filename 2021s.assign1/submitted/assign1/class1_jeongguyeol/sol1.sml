fun merge(a: int list, b: int list) = 
  if null a then b
  else if null b then a
  else
    if hd a > hd b then hd b::merge(a, tl b)
    else if hd a < hd b then hd a::merge(tl a, b)
    else if hd a = hd b then []
    else merge(tl a, tl b);

fun reverse(a: int list) =
  let fun innerFunc(b: int list, c: int list) = 
    if null b then c
    else innerFunc(tl b, hd b::c)
  in
    innerFunc(a, [])
  end
;

fun pi (a: int, b: int, f: int -> int) =
  if a > b then 1
  else
    let fun f_next(from: int) =
      if from>b then 1
      else f(from) * f_next(from+1)
    in
      f(a) * f_next(a+1)
    end
;

fun digits (a: int) = 
  if a div 10 = 0 then a::[]
  else
    let fun dig (b: int) =
      if b div 10 = 0 then b::[]
      else b mod 10 :: dig (b div 10)
    in
      reverse(a mod 10 :: dig(a div 10))
    end
;

fun sum(l: int list) =
  if null l then 0
  else hd l + sum(tl l);

fun additivePersistence (a: int) =
  if a div 10 = 0 then 0
  else 1 + additivePersistence(sum(digits(a)))
;

fun digitalRoot (a: int) =
  if a div 10 = 0 then a
  else digitalRoot(sum(digits(a)))
;

