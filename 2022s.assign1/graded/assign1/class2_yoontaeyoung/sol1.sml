fun merge (xs : int list, ys : int list) =
  if null xs then ys
  else if null ys then xs
  else if hd xs < hd ys then hd xs :: merge(tl xs, ys)
  else hd ys :: merge (xs, tl ys);

fun reverse (xs : int list) =
  let fun reverse_help (source : int list, dest : int list) =
    if null source then dest 
    else reverse_help (tl source, (hd source) :: dest)
  in
    reverse_help (xs, [])
  end

fun pi (a : int, b : int, f : int -> int) =
  if a > b then 1
  else f a * pi (a + 1, b, f); 

fun digits (x : int) =
  let fun rev_digits (a : int) =
    if a <= 0 then []
    else (a mod 10) :: rev_digits (a div 10)
  in reverse (rev_digits x)
  end

fun sum_list (xs : int list) =
  if null xs then 0
  else hd xs + sum_list (tl xs);

fun additivePersistence (x : int) =
  if x < 10 then 0
  else additivePersistence (sum_list (digits x)) + 1;

fun digitalRoot (x : int) =
  if x < 10 then x
  else digitalRoot (sum_list (digits x));

