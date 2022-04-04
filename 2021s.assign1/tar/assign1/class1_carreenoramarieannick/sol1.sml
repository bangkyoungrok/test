fun merge(l:int list, t:int list) =
	if null t 
	then l
	else if null l
	then t
	else if hd l< hd t 
	then (hd l)::merge(tl l, t)
	else (hd t)::merge(l, tl t)

fun reverse(l:int list) =
	if length l = 1
	then l
	else List.last(l)::reverse(List.take(l, (length l)-1))

fun pi(a:int, b:int, f) =
	if a=b
	then f(b)
	else f(a)*pi(a+1, b, f)

fun digits(a:int) = 
	if a<10
	then [a]
	else digits(a div 10)@[a mod 10]

fun sumList(l:int list) =
	if null l
	then 0
	else hd l +sumList(tl l)	

fun additivePersistence(n:int) =
	if n<10
	then 0
	else 1+additivePersistence(sumList(digits(n)))

fun digitalRoot(n:int) =
	if n<10
	then n
	else digitalRoot(sumList(digits(n)))
	