(* hw1 *)

(* Merge Lists *)

fun merge(xs:int list, ys:int list) =
  if null ys
  then xs
  else if null xs
  then ys
  else if hd(xs) > hd (ys)
  then hd(ys)::merge(xs, tl(ys))
  else hd(xs)::merge(tl(xs), ys)


(* Reverse List *)

fun reverse(xs: int list) =
  let 
  	fun	reverse_help(ys: int list, zs: int list) =
		if null ys
		then zs
		else reverse_help(tl(ys), hd(ys)::zs)
  in
  	reverse_help(xs, [])
  end

(*
fun reverse(xs:int list) =
  if null xs
  then []
  else reverse(tl(xs)) @ [hd(xs)]
*)  


(* Pi Function *)

fun pi(a: int, b:int, f:int ->int) =
  if a = b
  then f(a)
  else f(a) * pi(a+1,b, f)


(* Digit Function *)

fun digits(num:int) =
  let
  	fun digits_help(num:int, xs:int list) =
		if num = 0
		then xs
		else digits_help(num div 10, (num mod 10) :: xs)
  in
  	digits_help(num, [])
  end

(*
fun digits(num:int) = 
  if num < 10
  then [] @ [num]
  else digits(num div 10) @ [num mod 10]
*)


(* Digital Roots and Additive Persistence *)

fun sum_list(xs: int list) =
  if null xs
  then 0
  else hd(xs) + sum_list(tl(xs))

fun additivePersistence(a: int) = 
  if a < 10
  then 0
  else if sum_list(digits(a)) < 10
  then 1
  else additivePersistence(sum_list(digits(a))) + 1

fun digitalRoot(num: int) =
  if sum_list(digits(num)) < 10
  then sum_list(digits(num))
  else digitalRoot(sum_list(digits(num)))
