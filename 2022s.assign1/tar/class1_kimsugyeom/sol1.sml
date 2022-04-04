(* problem 1 *)

fun merge (L1 : int list, L2 : int list) : int list =
	if null (L1) 					(* L1 is empty *)
		then L2
	else if null (L2)				(* L2 is empty *)
		then L1
	else
		if hd(L1) < hd(L2)			(* L1's first element is smaller than another's *)
			then hd(L1) :: merge (tl(L1), L2)
		else
			hd (L2) :: merge (L1, tl(L2))
			
			
(* problem 2 *)

fun append (one : int list, two : int list) =		(* function that concatenate two lists *)
	if null (one)
		then two
	else
		hd (one) :: append (tl(one), two)
		

fun reverse (input : int list) : int list =
	if null (tl(input))								(* if there is only one element left in list, just return that list *)
		then input
	else
		append(reverse(tl(input)), [hd(input)])		(* dismantle the list from front / concatenate from behind -> final list will be reversed *)
		

(* problem 3 *)

fun pi (a : int, b : int, f : (int -> int)) =
	if a = b
		then b
	else
		a * pi (a + 1, b, f)
		
(* problem 4 *)

fun sub (x:int, y:int) =
	if x div y*10 = 0
		then []
	else
		(x div y) mod 10 :: sub (x, y*10)

fun digits (x : int) = (* 2030 *)
	reverse (sub (x, 1))

(* problem 5 *) (* *)

fun list_sum (x:int list) =
	if x = []
		then 0
	else
		hd(x) + list_sum(tl(x))

fun count (x:int) =
	let
		val templist = digits(x)
	in
		if tl(templist) = []
			then 0
		else
			1 + count(list_sum(templist))
	end

fun additivePersistence (x:int) = 
	count (x)

fun digitalRoot (x:int) =
	let
		val templist = digits(x)
	in
		if tl(templist) = []
			then hd(templist)
		else
			digitalRoot(list_sum(templist))
	end