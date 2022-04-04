fun merge (xs : int list, ys : int list) = 
  let val z = []
  in
  if null(xs) andalso null(ys)
    then z
  else if null(xs)
    then hd(ys)::merge(xs,tl(ys))
  else if null(ys)
    then hd(xs)::merge(tl(xs),ys)
  else if hd(xs) < hd(ys)
	then hd(xs)::merge(tl(xs),ys)
	else hd(ys)::merge(xs,tl(ys))
  end
  
fun reverse (xs : int list) =
  let val ys = []
  in
  if null(xs)
  then ys
  else reverse(tl(xs)) @ [hd(xs)]
  end
  
fun pi (a : int, b : int, f :  (int -> int)) =
 if a=b
   then f(b)
 else f(a) * pi(a+1, b, f)
 
fun addone(a: int) = a + 1
 
fun digits (a : int) =
  let val b = []
  in
  if a=0
    then b
  else digits(a div 10) @ [(a mod 10)]
  end

  
fun sumList(xs : int list) =
	if null(xs)
	  then 0
	else hd(xs) + sumList(tl(xs))
  
fun additivePersistence ( a : int) =
  let fun addhelp( a : int, count : int) = 
    if (a div 10) = 0
    then count
    else addhelp(sumList(digits(a)),count + 1)
  in
    addhelp(a,0)
  end
  
fun digitalRoot ( a : int) =
  if (a div 10) = 0
  then a
  else digitalRoot(sumList(digits(a)))



 
 