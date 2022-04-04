fun merge(x:int list, y:int list) =
	if null x andalso null y
	then []
	else if null x
	then hd(y)::merge(x, tl(y))
	else if null y
	then hd(x)::merge(y, tl(x))
	else
		if hd(x) > hd(y)
		then hd(y)::merge(x, tl(y))
		else hd(x)::merge(tl(x), y)
		
fun reverse(x:int list) =
	let fun subr(a:int list, b:int list) =
		if null a
		then b
		else subr(tl(a), hd(a)::b)
	in
	subr(x, [])
	end
		
(* f(a)*f(a+1)*...*f(b-1)*f(b) *)

fun pi(a:int, b:int, f:(int -> int)) =
	if a=b
	then f(b)
	else if a>b
	then 1
	else pi(a+1, b, f)*f(a)
	
(* 245 -> [2, 4, 5] *)

fun digits(x:int) =
	if (x div 10) = 0
	then [x mod 10]
	else 
		let fun subr(a:int, b:int) =
			if (a div b) = 0
			then (b div 10)
			else subr(a, 10*b)
		in
			(x div subr(x, 10)) :: digits(x mod subr(x, 10))
		end

fun digits(x:int) =
	if (x div 10) = 0
	then [x mod 10]
	else 
		let fun subr(a:int, b:int) =
			if (a div b) = 0
			then (b div 10)
			else subr(a, 10*b)
		in
			(x div subr(x, 10)) :: digits(x mod subr(x, 10))
		end

fun sum_list(x:int list) =
	if null x
	then 0
	else hd(x) + sum_list(tl(x))

fun additivePersistence(x:int) = 
	if ( x div 10 ) = 0
	then 0
	else 1 + additivePersistence(sum_list(digits(x)))


fun digitalRoot(x:int) =
	if ( x div 10 ) = 0
	then x
	else digitalRoot(sum_list(digits(x)))
	
