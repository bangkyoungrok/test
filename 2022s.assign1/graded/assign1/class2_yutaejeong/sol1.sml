(*
** Principles of Programming Languages
** HW1
** 2018008731 YuTaejeong
*)

(*Problem 1*)
fun merge(xs : int list, ys : int list) : int list =
	if null xs
	then ys
	else
		if null ys
		then xs
		else
			if hd xs < hd ys
			then hd(xs)::merge(tl(xs), ys)
			else hd(ys)::merge(xs, tl(ys))

(*Problem 2*)
fun reverse(xs : int list) : int list =
	if null xs
	then []
	else
		let
			fun getLastElement(xs : int list, ys : int list) : int =
				if null xs
				then hd ys
				else getLastElement(tl xs, tl ys)

			fun getRemainList(xs : int list) : int list =
			if tl xs = []
			then []
			else hd xs::getRemainList(tl xs)
		in
			getLastElement(tl xs, xs)::reverse(getRemainList(xs))
		end

(*Problem 3*)
fun pi(a: int, b: int, f: int -> int) : int =
	if a = b
	then f(a)
	else f(a) * pi(a - 1, b, f)
	
(*Problem 4*)
fun getDigitSize(x: int) : int =
	let
		fun getDigitSizeHelper(x: int, s: int) : int =
			if x < 10
			then s
			else getDigitSizeHelper(x div 10, s + 1)
	in
		getDigitSizeHelper(x, 1)
	end

fun digits(x: int) : int list =
	let
		fun digitsHelper(y: int, x: int) : int list =
			if y < 10
			then [x]
			else
				if getDigitSize(x) <> getDigitSize(y)
				then 0::digitsHelper(y div 10, x)
				else
					let
						fun getFirstNumber(x: int) : int =
							if x < 10
							then x
							else getFirstNumber(x div 10)
						
						fun getRemainNumber(x: int) : int =
							if x < 10
							then 0
							else getRemainNumber(x div 10) * 10 + (x mod 10)
					in
						let
							val firstNumber = getFirstNumber(x)
							val remainNumber = getRemainNumber(x)
						in
							firstNumber::digitsHelper(x div 10, remainNumber)
						end
					end
	in
		digitsHelper(x, x)
	end

(*Problem 5*)
fun sumList (xs: int list) =
	if null xs
	then 0
	else hd(xs) + sumList(tl(xs))

fun additiveList(x: int) : int list =
	if x < 10
	then [x]
	else x::additiveList(sumList(digits(x)))

fun additivePersistence(x: int) : int =
	length(tl(additiveList(x)))

fun digitalRoot(x: int) : int =
	if x < 10
	then x
	else digitalRoot(sumList(digits(x)))