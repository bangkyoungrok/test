(*
* sol1.sml
* Created by mileu on 2022/03/19.
* 2019072697 YUN HEE HEON
*)

(* 1. Merge Lists (10pt) *)
fun merge (xs: int list, ys: int list) = 
  if null xs
  then ys
  else
    if null ys
    then xs
    else
      if hd xs < hd ys
      then hd xs :: merge(tl xs, ys)
      else hd ys :: merge(xs, tl ys)

(* 2. Reverse List (10pt) *)
fun tll (xs: int list) =
  if null xs
  then raise Empty
  else List.take(xs, (length xs) - 1)
fun reverse (xs: int list) =
  if null xs
  then xs
  else List.last xs :: reverse(tll(xs))

(* 3. Pi Function (10pt) *)
fun pi (xs: int, ys: int, fs: int->int) =
  if xs > ys
  then 1
  else fs(xs) * pi(xs + 1, ys, fs)

(* 4. Digits Function (10pt) *)
fun re_digits (xs: int) =
  if xs < 10
  then xs :: []
  else (xs mod 10) :: re_digits(xs div 10)
fun digits (xs: int) = 
  reverse(re_digits(xs))

(* 5. Digital Roots and Additive Persistence (20pt: 10pt for each function) *)
fun sumList (xs: int list) = 
  if null xs
  then 0
  else hd xs + sumList(tl xs)
fun additivePersistence (xs: int) =
  if xs < 10
  then 0
  else 1 + additivePersistence(sumList(re_digits(xs)))
fun digitalRoot (xs: int) = 
  if xs < 10
  then xs
  else digitalRoot(sumList(re_digits(xs)))
