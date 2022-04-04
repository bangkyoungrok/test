fun merge (xs:int list, ys:int list) =
	if null xs
	then ys
	else if null ys
	then xs
	else
		if hd(xs) < hd(ys)
		then hd(xs) :: merge(tl(xs), ys)
		else hd(ys) :: merge(xs, tl(ys));

fun reverse (xs:int list) =
	if null xs
	then xs
	else reverse(tl(xs)) @ [hd(xs)];

fun pi (a:int, b:int, f) = 
	if a > b
	then 1
	else f(a)*pi(a+1, b, f);


fun digits (n:int) = 
	if n = 0
	then []
	else digits(n div 10) @ [n mod 10];

fun getsum(n:int) =
	if n=0
	then 0
	else (n mod 10) + getsum(n div 10);

fun additivePersistence (n : int) =
	if n<10
	then 0
	else 1 + additivePersistence(getsum(n));

fun digitalRoot (n:int) = 
	if n < 10
	then n
	else digitalRoot(getsum(n));

merge([1, 4, 5], [2, 6, 7]);
reverse([1, 2, 3, 4, 5]);
pi(1, 5, fn(n) => 2*n);
digits(253);
additivePersistence(9876);
digitalRoot(9876);
additivePersistence(12349);
digitalRoot(12349);