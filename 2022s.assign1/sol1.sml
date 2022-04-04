fun merge(x:int list, y:int list) =
	if null x
	then y
	else if null y
	then x
	else if hd x = hd y
	then (hd x)::(hd y)::merge(tl x,tl y)
	else if hd x > hd y
	then (hd y)::merge(x,tl y)
	else (hd x)::merge(tl x, y)

fun reverse(x:int list) =
	if null (x)
	then []
	else reverse(tl x)@[hd x]

fun sigma(a:int, b:int, f:int->int) =
	if a = b
	then f(a)
	else if a > b
	then 0
	else f(a)+sigma(a+1,b,f)

fun digits(x:int) =
	if x=0
	then []
	else digits(x div 10)@[x mod 10]

fun sum(x:int list) =
	if null x
	then 0
	else hd x+sum(tl x)

fun additivePersistence(a:int) =
	if a < 10
	then 0 
	else additivePersistence(sum(digits(a)))+1

fun digitalRoot(b:int) =
	if (sum(digits(b)) < 10)
	then sum(digits(b))
	else digitalRoot(sum(digits(b)))
	
