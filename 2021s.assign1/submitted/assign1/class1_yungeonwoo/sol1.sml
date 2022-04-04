(* 
* 2019031776 Yun, Geonwoo
* Programming Language, 2021 Spring, Assignment 1
*)

(* 1. Merge Lists (10pt)
* Merge function takes two sorted lists (in ascending order) and returns a sorted list that contains all the elements in the two lists.
* The signature of the function is as following:
* merge: int list * int list -> int list
*)

fun merge(xs: int list, ys:int list) =
	if null xs 
	then (
		if null ys 
		then [] 
		else hd(ys) :: merge(xs, tl(ys))
	)
	else (
		if null ys
		then hd(xs) :: merge(tl(xs), ys) 
		else (
			if hd(xs) > hd(ys) 
			then hd(ys) :: merge (xs, tl(ys)) 
			else hd(xs) :: merge (tl(xs), ys)
		)
	)


(* 2. Reverse List (10pt)
* Reverse function takes a list and returns the reversed list. 
* For example, reverse([1,5,4]) returns [4,5,1].
* The signature of the function is as following
* reverse: int list -> int list
* hint : you shouldn't have to set reverse result as return type
*)

fun reverse(xs: int list) =
	let fun append(xs: int list, ys: int list) =
		if null xs
		then ys
		else hd(xs) :: append(tl(xs), ys)
	in if null xs
		then []
		else append(reverse(tl(xs)), [hd(xs)])
	end

(* 3. Pi Function (10pt)
* Pi function takes two integers, a and b, and a function f and returns the following:
* The signature of pi is as following:
*)

fun f(x: int) : int =
	if x = 1
	then 1
	else x * f(x-1)

fun pi(a: int, b: int, f: int -> int) = 
	if a > b
	then 1
	else f(b) div f(a-1)


(* 4. Digits Function
*digits function takes a positive integer and returns the list of digits of the integer
*for example, digits(253) returns [2,5,3]
*the signature should be
*digits: int -> int list
*)

fun digit(x: int) =
	let fun make_digit(x:int) = 
		if x < 10 then [x] 
		else (x mod 10) :: make_digit(x div 10)
	in reverse(make_digit(x))
	end

(*5. Digital Roots and Additive Persistence (20pt: 10pt for each function)
Consider the process of taking a number, adding its digits, then adding the digits 
of the number derived from it, etc., until the remaining number has only one digit. 
The number of additions required to obtain a single digit from a number n is called 
the additive persistence of n, and the digit obtained is called the digital root of n. For 
example, the sequence obtained from the starting number 9876 is (9876, 30, 3), so 
9876 has an additive persistence of 2 and a digital root of 3. For the starting number 
12349, the process produces (12349, 19, 10, 1), so 12349 has an additive 
persistence of 3 and a digital root of 1.
 Write two functions additivePersistence and digitalRoot that take positive integer 
argument n and return the additive persistence and the digital root of n
respectively.
*)

fun additivePersistence(x: int) =
	let 
		fun sum_list(xs: int list) = if null xs then 0 else hd(xs) + sum_list(tl(xs))
		fun recursive(x: int, y: int) = 
			let 
				val sum_digit_list = sum_list(digit(x))
			in
				if sum_digit_list < 10  
				then y
				else recursive(sum_digit_list, y + 1)
			end
	in 
		recursive(x, 1)
	end

fun digitalRoot(x: int) =
	let 
		fun sum_list(xs: int list) = if null xs then 0 else hd(xs) + sum_list(tl(xs))
		val digit_list = digit(x)
	in 
		let val sum_digit_list = sum_list(digit_list)
		in if sum_digit_list < 10
			then sum_digit_list
			else digitalRoot(sum_digit_list) 
		end
	end
