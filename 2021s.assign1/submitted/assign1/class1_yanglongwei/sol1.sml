fun merge(xl:int list,yl:int list)=
  if null(xl)
  then yl
  else if null(yl)
  then xl
  else
    if hd(xl)<hd(yl)
    then hd(xl)::merge(tl(xl),yl)
    else
      hd(yl)::merge(xl,tl(yl))

fun reverse(xl:int list)=
  if null(xl)
  then []
  else
    reverse(tl(xl))@[hd(xl)]
fun pi(a:int,b:int,f:int -> int)=
  if a>b
  then 1
  else if a=b
  then f(b)
  else 
    f(a)*pi(a+1,b,f)
fun digits(a:int)=
  if a<100
  then [a div 10,a mod 10]
  else
    digits(a div 10)@[a mod 10]

fun sum_list(xl:int list)=
  if null(xl)
  then 0
  else
    hd(xl)+sum_list(tl(xl))
fun sum_digits(a:int)=sum_list(digits(a))
fun additivePersistence(a:int)=
  if sum_digits(a)<10
  then 1
  else 
    1+additivePersistence(sum_digits(a))
fun digitalRoot(a:int)=
  if sum_digits(a)<10
  then sum_digits(a)
  else
    digitalRoot(sum_digits(a))

