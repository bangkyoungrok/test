fun merge(x:int list,y:int list)=
  if null x
  then y
  else if null y
  then x


  else if hd(x)<hd(y)
  then hd(x)::merge(tl(x),y)
  else if hd(x)>hd(y)
  then hd(y)::merge(x,tl(y))
  else []


 fun rreverse(xs:int list,ys:int list)=
   if null xs 
   then ys
   else rreverse(tl(xs),hd(xs)::ys)
 
fun reverse(xxs:int list)=rreverse(xxs,[])


fun tmp(a:int):int=
  if a>=0 then a
  else a

fun pi(a:int,b:int,f:int->int):int =
  if a<b then (f(a) *  pi(a+1,b,f) )
  else
    f(b)


fun digit(x:int):int list=
   if x<10 then [x]
   else
      (x mod 10)::digit(x div 10)

fun digits(x:int)=reverse(digit(x))

fun digitSum(x:int):int=
   if x<10 then x
   else
      (x mod 10)+digitSum(x div 10)


fun additivePersistence(x:int)=
  if x<10 then 0
  else 1+additivePersistence(digitSum(x))

fun digitalRoot(x:int)=
  if x<10 then x
  else digitalRoot(digitSum(x))


