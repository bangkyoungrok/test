fun merge (xs : int list,ys : int list) =
	if xs = []
	then ys
	else if ys = []
	then xs
	else if hd(xs) < hd(ys)
	then hd(xs)::merge(tl(xs),ys)
	else hd(ys)::merge(xs,tl(ys))

fun rereverse(xs : int list,ys : int list) = 
	if xs = []
	then ys
	else rereverse(tl(xs),hd(xs)::ys)
fun reverse(xs : int list) = 
	rereverse(xs,[])

fun pi(a : int, b : int, f : int -> int) = 
	if a = b
	then f(b)
	else f(a) * pi(a+1,b,f)

fun realdigit(x : int,ys : int list)=
	if x = 0
	then ys
	else realdigit(x div 10,x mod 10 :: ys)
fun digits(x : int)=
	realdigit(x,[]);

fun aPdR(x : int) =
	if x < 10
	then x
	else (x mod 10) + aPdR(x div 10)

fun additivePersistence (x : int) =
	if x < 10 
	then 0
	else 1 + additivePersistence(aPdR(x))
fun digitalRoot (x : int) =
	if x < 10
	then x
	else digitalRoot(aPdR(x))