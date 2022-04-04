(* 1. Merge Lists *)
fun merge(xs: int list, ys: int list):int list =
	if null xs
	then ys
	else if hd(xs) < hd(ys)
	then hd(xs) :: merge(tl(xs), ys)
	else hd(ys) :: merge(xs, tl(ys));

(* 2. Reverse List *)
fun reverse(xs: int list):int list =
	if null xs
	then xs
	else reverse(tl(xs)) @ (hd(xs) :: []);

(* 3. Pi Function *)
fun pi(a: int, b: int, f: int -> int):int =
	if a = b
	then f(b)
	else f(a) * pi(a + 1, b, f);

(* 4. Digits Function *)
fun digits(x: int):int list =
	if x = 0
	then []
	else digits(x div 10) @ (x mod 10) :: [];
	
(* 5. Digital Roots and Additive Persistence *)

(* sumList: adds up all the numbers in a list *)
fun sumList(xs: int list):int =
	if null xs
	then 0
	else hd(xs) + sumList(tl(xs))
	
(* additiveList: makes a list of numbers in the process of finding digital root *)
fun additiveList(x: int): int list =
	if x div 10 = 0
	then []
	else x :: additiveList(sumList(digits(x)));
	
fun additivePersistence(x: int):int =
	length(additiveList(x));

fun digitalRoot(x: int):int =
	if x div 10 = 0
	then x
	else digitalRoot(sumList(digits(x)));