fun merge (a:int list, b:int list) =
  if null a then
    b
  else
    if null b then
      a
    else
      if hd(a) < hd(b) then
        hd(a)::merge(tl(a),b)
      else
        hd(b)::merge(a,tl(b))

val reverse = rev
fun reverse2 (a:int list) =
  if null a then
    a
  else
    reverse2(tl(a)) @ (hd(a)::[])

fun sigma (a:int, b:int, f:int->int) =
  if a > b then
    0
  else
    f(a)+sigma(a+1,b,f)

fun digits (n:int) =
  let fun temp (a) =
    if a = 0 then
      []
    else
      (a mod 10)::temp(a div 10)
  in
    if n = 0 then
      [0]
    else
      reverse(temp(n))
  end

fun sum (a:int list) =
  if null a then
    0
  else
    hd(a)+sum(tl(a))
fun additivePersistence (n:int) =
  let val temp = sum(digits(n))
  in
    if temp < 10 then
      1
    else
      1+additivePersistence(temp)
  end

fun digitalRoot (n:int) =
  let val temp = sum(digits(n))
  in
    if temp < 10 then
      temp
    else
      digitalRoot(temp)
  end

