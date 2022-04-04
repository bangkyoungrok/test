(* 2015000346 Woo Su Mong *)

(* Merge Lists : int list * int list -> int list
   merge([1,4,5], [2,6,7]) should return [1,2,4,5,6,7].
   fun merge (xs : int list, ys : int list) = *)
fun merge(xs : int list, ys : int list) = 
	if null xs
	then ys
	else if null ys
	then xs
	else
		if hd(xs)<hd(ys)
		then hd(xs) :: merge(tl(xs), ys)
		else hd(ys) :: merge(xs, tl(ys))


(* Reverse List : int list -> int list
   reverse([1,5,4]) returns [4,5,1]. *)
fun reverse(xs : int list) = 
	let fun tmp(xs : int list, ys : int list) = 
		if null xs
		then ys
		else tmp(tl(xs), hd(xs) :: ys)
	in
		tmp(xs, [])
	end


(* Pi Function :  int * int * (int -> int) -> int
   pi(a,b,f) = 𝑓(𝑎) × 𝑓(𝑎 + 1) × … × 𝑓(𝑏 − 1) × 𝑓(𝑏) *)
fun pi(a : int, b : int, f : int -> int) = 
	if a>b
	then 1
	else f(a)*pi(a+1, b, f)


(* Digits Function : int -> int list
   digits(253) = [2,5,3].
   [] 253 -> [3] 25 -> [5,3] 2 -> [2,5,3]*)
fun digits(xs : int) = 
	let 
		val result = []
		fun digitstmp(xs : int) = 
			if xs<10
			then xs::result
			else (xs mod 10)::digitstmp(xs div 10)
	in
		reverse(digitstmp(xs))
	end


(* additivePersistence: int -> int
   12349 -> (12349, 19, 10, 1), so the answer is 3 *)
fun additivePersistence(xs: int) = 
	let
		fun addAll(numList : int list) = 
			if null numList
			then 0
			else hd(numList)+addAll(tl(numList))

		fun counter(count : int, sum : int) = 
			if sum < 10
			then count
			else counter(count+1, addAll(digits(sum)))
	in
		counter(0, xs)
	end
	

(* digitalRoot: int -> int
   12349 -> (12349, 19, 10, 1), so the answer is 1 *)
fun digitalRoot(xs : int) = 
	let
		fun addAll(numList : int list) = 
			if null numList
			then 0
			else hd(numList)+addAll(tl(numList))
	in
		let val sumResult = addAll(digits(xs))
		in
			if sumResult < 10
			then sumResult
			else digitalRoot(sumResult)
		end
	end
