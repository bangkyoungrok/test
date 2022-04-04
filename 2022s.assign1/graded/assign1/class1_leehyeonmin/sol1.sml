(* 1. Merge List *)
fun merge(xs:int list, ys:int list):int list =
	if null xs 
	then ys
	else
		if null ys
		then xs
		else 
			if hd xs < hd ys
			then hd xs :: merge(tl xs, ys)
			else hd ys :: merge(xs, tl ys)

(* 2. Reverse List *)
fun reverse(xs:int list):int list =
	let
		(* ex. pop([1,2,3,4,5]) -> [1,2,3,4], 5 *)
		fun pop(ys:int list):int list * int =
			if null(tl ys)
			then (tl ys, hd ys)
			else
				let
					val recur_sol:int list * int = pop(tl ys)
				in
					(hd ys :: #1 recur_sol, #2 recur_sol)
				end
		val recur_sol:int list * int = pop(xs);
		val rhd:int list = #1 recur_sol;
		val rtl:int = #2 recur_sol;
	in
		if null(rhd)
		then rtl :: []
		else rtl :: reverse(rhd)
	end

(* 3. Pi function *)
fun pi(a:int, b:int, f:int -> int):int =
	if a=b
	then f(b)
	else f(a) * pi(a + 1, b, f)

(* 4. Digits Function *)
fun digits(x:int):int list =
	let
		(* ex. push([1,2,3,4], 5) -> [1,2,3,4,5] *)
		fun push(ys:int list, y:int):int list =
			if null ys
			then y :: []
			else hd ys :: push(tl ys, y)
	in
		if x div 10 = 0
		then x :: []
		else push(digits(x div 10), x mod 10)
	end

(* 5. Digital Roots and Additive Persistence *)
fun digitalSum(dr:int, ap:int):int*int =
	let
		(* ex. sumList([1,2,3,4,5]) -> 15 *)
		fun sumList(xs:int list):int =
			if null xs
			then 0
			else hd xs + sumList(tl xs)
	in
		if dr div 10 = 0
		then (dr, ap)
		else digitalSum(sumList(digits(dr)), ap + 1)
	end

fun additivePersistence(x:int):int = #2(digitalSum(x, 0))

fun digitalRoot(x:int):int = #1(digitalSum(x, 0))
