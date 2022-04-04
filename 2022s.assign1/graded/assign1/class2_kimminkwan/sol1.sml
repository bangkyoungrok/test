(* problem 1 *)
fun merge (xs: int list, ys : int list) =
	if null(ys)
	then xs
	else if null(xs)
		then ys
		else if hd(xs)<hd(ys)
			then hd(xs)::merge(tl(xs), ys)
			else hd(ys)::merge(xs, tl(ys))

(* problem 2 *)
fun reverse(rl : int list) =
	if null(rl)
	then []
	else reverse(tl(rl))@[hd(rl)]

(* problem 3 *)	
fun pi(a: int, b : int, f : int->int) =
	if a = b
	then f(b)
	else f(a) * pi(a+1, b, f)
	
(* problem 4 *)
fun digits(n : int) =
	if n div 10 = 0
	then [n]
	else digits(n div 10)@[n mod 10]

(* problem 5 *)
fun addList(al : int list)=
	if null(al)
	then 0
	else hd(al) + addList(tl(al))

fun countdown(cl : int list)=
	if null(cl)
	then 0
	else countdown(tl(cl)) +1

fun makeList(n: int) =
	if addList(digits(n)) < 10
	then [addList(digits(n))]
	else makeList(addList(digits(n))) @ [addList(digits(n))]

fun additivePersistence(n : int)=
	let val x = makeList(n)
	in countdown(x)
	end

fun digitalRoot(n : int) =
	let val x = makeList(n)
	in hd(x)
	end	
