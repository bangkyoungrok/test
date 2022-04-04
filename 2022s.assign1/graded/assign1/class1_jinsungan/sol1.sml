fun merge(x:int list, y:int list):int list = 
  if null(x)
    then if null(y)
	then []
	else hd(y) :: merge(x,tl(y))
    else if null(y)
	then hd(x) :: merge(tl(x),y)
	else if hd(x) < hd(y)
	      then hd(x) :: merge(tl(x),y)
	      else hd(y) :: merge(x,tl(y));

fun finda(x:int,y:int):int = 
	if x div y = 0
	then y div 10
	else finda(x,y*10);


fun digits(x:int):int list = 
	let fun di(num:int,a:int):int list=
	  if a = 1
	  then [num mod 10]
	  else  ((num div a)-((num div (a*10))*10)) :: di(num,a div 10)
	in di(x,finda(x,1))
	end;

fun reverse(xs:int list):int list = 
	if null(tl(xs))
	then [hd(xs)]
	else reverse(tl(xs))@[hd(xs)];