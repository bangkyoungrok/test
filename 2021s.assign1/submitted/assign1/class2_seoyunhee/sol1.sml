(* #1 Merge Lists *)
fun merge(x:int list, y:int list) =
	if x = nil 
	then
		if y = nil 
		then nil
		else hd(y)::merge(x,tl(y))
	else
		if y = nil 
		then hd(x)::merge(tl(x), y)
		else
			if hd(x)>hd(y) 
			then hd(y)::merge(x,tl(y))
			else hd(x)::merge(tl(x), y);


(* #2 Reverse List *)
fun reverse(x:int list) =
	if x = nil 
	then nil
	else reverse(tl(x)) @ [hd(x)];


(* #3 Pi Function *)
fun pi(x:int, y:int, f:int->int) =
	if x = y+1 
	then 1
	else f(x) * pi(x+1,y,f);


(* #4 Digits Function *)
fun digits(x:int) =
	if x = 0 
	then nil
	else digits(x div 10) @ [x mod 10];


(* #5 Digital Roots and Additive Persistence *)
fun additivePersistence(x:int) =
	let fun sum(y:int list) = 
		if tl(y) = nil 
		then hd(y)
		else hd(y) + sum(tl(y))
	in
		let val sum_of_digits = sum(digits(x))
		in
			if sum_of_digits < 10
			then 1
			else additivePersistence(sum_of_digits) + 1
		end
	end


fun digitalRoot(x:int) =
	let fun sum(y:int list) = 
		if tl(y) = nil 
		then hd(y)
		else hd(y) + sum(tl(y))
	in
		let val sum_of_digits = sum(digits(x))
		in
			if sum_of_digits < 10
			then sum_of_digits
			else digitalRoot(sum_of_digits)
		end
	end