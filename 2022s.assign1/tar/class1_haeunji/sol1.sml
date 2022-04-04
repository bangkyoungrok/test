fun merge (x: int list, y: int list) =
	if null x
	then y
	else if null y
	then x
	else if hd(x) > hd(y)
	then hd(y) :: merge(x, tl(y))
	else hd(x) :: merge(tl(x), y);

fun reverse (x: int list) =
	if null x
	then []
	else reverse(tl(x)) @ [hd(x)];

fun pi (x: int, y: int, f:int -> int) =
	if x>y
	then 1
	else f(x)*pi(x+1, y, f);

fun digits (x: int) =
	if x=0
	then []
	else digits(x div 10) @ [x mod 10];

fun additivePersistence (x: int) =
	let fun sum(xs: int list) =
		if null xs
		then 0
		else hd(xs) + sum(tl(xs))
	in
		if x div 10 = 0
		then 0
		else 1+additivePersistence(sum(digits(x)))
	end;

fun digitalRoot (x: int) =
	let fun sum(xs: int list) =
		if null xs
		then 0
		else hd(xs) + sum(tl(xs))
	in
		if x div 10 = 0
		then x
		else digitalRoot(sum(digits(x)))
	end;
