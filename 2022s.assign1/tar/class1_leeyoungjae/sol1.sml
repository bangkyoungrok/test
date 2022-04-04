(* 1 *)
fun merge (xs : int list, ys : int list) =
  if null xs
  then ys
  else if null ys
  then xs
  else
  if hd xs < hd ys
  then hd xs :: merge(tl xs, ys)
  else hd ys :: merge(xs, tl ys);

(* 2 *)
fun reverse (x : int list) = 
  if null x
  then []
  else let fun rev_h (tx : int list, ty : int list) =
      if null tx
      then ty
      else hd tx :: rev_h(tl tx, ty)
    in
      rev_h(reverse(tl x), [hd x])
    end


(* 3 *)
fun pi (a : int, b : int, f : int -> int) =
  if a > b
  then 1
  else f(a) * pi(a+1,b,f);

(* 4 *)
fun digits (x : int) = 
  let fun digit_h (ix : int, iy : int list) = 
    if ix <= 0
    then iy
    else ix mod 10 :: digit_h(ix div 10, iy)
  in
    reverse(digit_h (x, []))
  end

(* 5 *)
fun addictivePersistence(x : int) = 
  let fun sum_list (lx : int list) = 
      if null lx
      then 0
      else hd lx + sum_list(tl lx)
    fun check_count(count : int, ix : int) = 
      if ix <= 9
      then count
      else check_count(count+1, sum_list(digits(ix)))
    val count = 1
  in
    check_count(count, sum_list(digits(x)))
  end
  

fun digitalRoot (x : int) = 
  let fun sum_list (lx : int list) = 
    if null lx
    then 0
    else hd lx + sum_list(tl lx)
  in
    if x <= 9
    then x
    else digitalRoot((sum_list(digits(x))))
  end 
