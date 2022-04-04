fun merge(l1 : int list, l2 : int list) =
	if      null l1 then l2
	else if null l2 then l1
	else if hd l1 < hd l2
	then hd(l1)::merge(tl l1, l2)
	else hd(l2)::merge(l1, tl l2)

fun reverse(l : int list) = 
	if null l
	then []
	else reverse(tl l) @ [hd l]

fun pi(a : int, b : int, f : int -> int) =
	if 		a = b then f(b)
	else if a > b then 0
	else f(a) * pi(a+1, b, f)

fun digits(d : int) =
	let fun digitFinder(x : int, f : int) =
		if x < 10
		then [x]
		else if x div f > 9
 		then digitFinder(x, f*10)
		else x div f :: digitFinder( x mod f, 1 )
	in
		digitFinder(d, 1)
	end

fun sum(l : int list) = 
	if null l
	then 0
	else hd l + sum(tl l)

fun additivePersistence(x : int) =
	if x < 10
	then 0
	else 1 + additivePersistence( sum(digits(x)) )

fun digitalRoot(x : int) =
	if x < 10
	then x
	else digitalRoot( sum(digits(x)) )

	

	
	
	