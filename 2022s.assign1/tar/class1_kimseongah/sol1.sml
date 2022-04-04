(* 1. Merge List *)
fun merge (xs : int list, ys : int list) : int list = 
    if null xs
    then ys
    else if null ys
         then xs
         else if hd (xs) < hd (ys)
              then hd (xs) :: merge(tl(xs), ys)
              else hd (ys) :: merge(xs, tl(ys))
(* 2. Reverse List *)
(* append function learned in class *)
fun append(xs : int list, ys : int list) : int list =
  if null xs
  then ys
  else hd(xs) :: append(tl(xs), ys)
 
fun reverse ( xs : int list ): int list =
    if null xs
    then []
    else (append(reverse(tl(xs)),(hd(xs)::[])))

(* 3. Pi Function *)
fun pi ( a : int, b : int, f : int->int ) : int =
  if a>b
  then 1
  else  if a=b
        then f(a)
        else f(a) * pi (a+1, b, f)

(* 4. Digits Function *)
fun digit_help(x : int) : int list =
  if x div 10 < 1
  then x::[]
  else x mod 10 :: digit_help(x div 10)

fun digits(x : int) : int list =
  reverse(digit_help(x))

(* 5. Digital Roots and Additive Persistence *)
(* sum_list learned in class *)
fun sum_list (xs : int list) : int=
  if null xs
  then 0
  else hd(xs) + sum_list(tl(xs))

fun additivePersistence_help(x : int, i : int) : int =
  if null(tl(digit_help(x)))
  then i
  else additivePersistence_help(sum_list(digit_help(x)), i+1)


fun additivePersistence(x : int) : int =
  additivePersistence_help(x, 0)


fun digitalRoot(x : int) : int =
  if null(tl(digit_help(x)))
  then sum_list(digit_help(x))
  else digitalRoot(sum_list(digit_help(x)))

