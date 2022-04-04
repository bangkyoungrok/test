fun merge (xs:int list, ys:int list)=
  if null xs
  then ys
  else if null ys
  then xs
  else if hd(xs)<hd(ys)
  then hd(xs)::merge(tl(xs), ys)
  else hd(ys)::merge(xs, tl(ys));

fun append (xs:int list, ys:int list)=
  if null xs
  then ys
  else hd(xs)::append(tl(xs), ys);

fun reverse (xs:int list)=
  if null xs
  then []
  else append(reverse(tl(xs)), [hd(xs)]);

fun pi (a:int, b:int, f:int->int)=
  if a>b
  then 1
  else f(a)*pi(a+1, b, f);

fun digits(x:int):int list=
  if x=0
  then []
  else append(digits(x div 10), [x mod 10]);

fun sum_list (xs:int list)=
  if null xs
  then 0
  else hd(xs)+sum_list(tl(xs));

fun additivePersistence(x:int)=
  if (x div 10)=0
  then 0
  else 1+additivePersistence(sum_list(digits(x)))

fun digitalRoot(x:int)=
  if (x div 10)=0
  then x
  else digitalRoot(sum_list(digits(x)))
