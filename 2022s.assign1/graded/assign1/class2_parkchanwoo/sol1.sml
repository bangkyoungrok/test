(* Programming Language Assignment 1 *)
(* 2018008459 Chanwoo Park *)


(* Problem 1. Merge Lists *)
fun merge (l1 : int list, l2 : int list) : int list =
  if null l1
  then l2
  else if null l2
  then l1
  else if hd l1 < hd l2
  then hd l1 :: merge (tl l1, l2)
  else hd l2 :: merge (l1, tl l2)


(* Problem 2. Reverse List *)
fun reverse (l : int list) : int list =
  let
    (* Reverse l1 and append to l2 *)
    fun reverse_helper (l1 : int list, l2 : int list) : int list =
      if null l1
      then l2
      else reverse_helper (tl l1, hd l1 :: l2)
  in reverse_helper (l, [])
  end


(* Problem 3. Pi Function *)
fun pi (a : int, b : int, f : int -> int) : int =
  if a = b
  then f (b)
  else f (a) * pi (a + 1, b, f)


(* Problem 4. Digits Function *)
fun digits (num : int) : int list =
  let
    (* Make a list of digits of x and append to l *)
    fun digits_helper (x : int, l : int list) : int list =
      if x div 10 = 0
      then x mod 10 :: l
      else digits_helper (x div 10, x mod 10 :: l)
  in digits_helper (num, [])
  end


(* Problem 5. Digital Roots and Additive Persistence *)
fun additivePersistence (num : int) : int =
  let
    fun sum (l : int list) : int =
      if null (tl l)
      then hd l
      else hd l + sum (tl l)
  in
    if num div 10 = 0
    then 0
    else 1 + additivePersistence (sum (digits (num)))
  end

fun digitalRoot (num : int) : int =
  let
    fun sum (l : int list) : int =
      if null (tl l)
      then hd l
      else hd l + sum (tl l)
  in
    if num div 10 = 0
    then num
    else digitalRoot (sum (digits(num)))
  end
