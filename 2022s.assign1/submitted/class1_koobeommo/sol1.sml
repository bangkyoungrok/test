(* Problem 1 *)
fun merge(xs:int list, ys:int list):int list=
	if null (xs)
	then ys
	else if null (ys)
	then xs
	else if hd(xs) < hd(ys)
	then hd(xs)::merge(tl xs,ys)
	else hd(ys)::merge(xs, tl ys);

(* Problem 2 *)
fun addList(xs:int list, ys:int list):int list=
	if null(xs)
	then ys
	else addList(tl(xs), hd(xs)::ys);

fun reverse(zs:int list):int list=
	let val it = []
	in addList(zs,it)
	end;

(* Problem 3 *)
fun pi(a:int, b:int, f:int->int):int=
if a>b
then 1
else f(a)*pi(a+1,b,f);

(* Problem 4 *)
fun getmod(z:int):int=
z mod 10;
fun getmod2(y:int, ys:int list):int list=
	if y div 10 < 1
	then y::ys
	else getmod2(y div 10, getmod(y)::ys);
fun digits(x:int):int list=
getmod2(x,[]);
