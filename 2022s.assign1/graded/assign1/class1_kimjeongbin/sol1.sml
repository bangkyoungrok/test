fun merge(x:int list, y: int list) = 
	if null x
	then y

	else if null y
	then x

	else if hd(x) < hd(y)
	then hd(x)::merge(tl(x), y)
	
	else hd(y)::merge(x, tl(y));

fun f(x: int) = x;

fun pi(a: int, b: int, f: (int -> int)) = 
	if a = b
	then f(b)

	else f(a) * pi(a+1, b, f);

fun reverse nil = nil | reverse(x::xs) = (reverse xs) @ [x];


fun digits(x: int) =

	if x > 100000
	then (x div 100000)::digits(x mod 100000)
	
	else if x > 10000
	then (x div 10000)::digits(x mod 10000)
	
	else if x > 1000
	then (x div 1000)::digits(x mod 1000)

	else if x > 100
	then (x div 100)::digits(x mod 100)

	else if x > 10
	then (x div 10)::digits(x mod 10)

	else x::[];


