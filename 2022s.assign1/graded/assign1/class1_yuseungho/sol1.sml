fun merge (x: int list, y: int list) =
	if null (x) then y
	else 	if null (y) then x
		else 	if hd (x) < hd (y) then hd (x)::merge (tl (x), y)
			else hd (y)::merge(x,  tl(y))

fun reverse (x: int list) =
	let fun rev_mk (x: int list, y: int list) =
		if null (x) then y
		else rev_mk (tl (x), hd (x)::y)
	in
		rev_mk (x, [])
	end

fun pi(x: int, y: int, f: (int -> int)) =
	if x=y then f (y)
	else 	if x < y then f (x) * pi(x+1, y, f)
		else f (x) * pi(x-1, y, f)

fun digits (x: int) =
	let fun rev_digits(x: int) =
		if x=0 then []
		else (x mod 10)::rev_digits(x div 10)
	in
		reverse (rev_digits (x))
	end

fun list_add (x: int list) =
	if null (x) then 0
	else hd (x) + list_add (tl (x))

fun additivePersistence (x: int) =
	if (x div 10) = 0 then 0
	else 1 + additivePersistence(list_add (digits (x)))

fun digitalRoot (x: int) =
	if (x div 10) = 0 then x
	else digitalRoot (list_add (digits (x)))