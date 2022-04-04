fun merge (x : int list, y : int list) =
  if null x
  then if null y
  then []
  else hd(y) :: merge(x, tl(y))
  else
  if null y
  then hd(x) :: merge(tl(x), y)
  else
  if hd(x) < hd(y)
  then hd(x) :: merge(tl(x), y)
  else hd(y) :: merge(x, tl(y))


fun reverse (x : int list) = 
  let fun true_reverse (a : int list, b : int list) = 
        if null a
        then b
        else true_reverse(tl(a), hd(a) :: b)
  in
        true_reverse(x, [])
  end


fun pi (a : int, b : int, f : (int -> int)) =
  if a = b
  then f(a)
  else f(a) * pi(a + 1, b, f)


fun digits (x : int) =
  let fun just_digits (a : int) =
        if a < 10
        then [a]
	else (a mod 10) :: just_digits(a div 10);
  in
        reverse(just_digits(x))
  end


fun sum (x : int list) =
  if null x
  then 0
  else hd(x) + sum(tl(x))


fun additivePersistence (x : int) = 
  if(x < 10)
  then 0
  else additivePersistence(sum(digits(x))) + 1


fun digitalRoot (x : int) =
  if(x < 10)
  then x
  else digitalRoot(sum(digits(x)))
