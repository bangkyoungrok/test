(* Problem 1 *)
fun merge(xs : int list, ys : int list) =
if null ys then xs
else if null xs then ys
else
if hd xs > hd ys then hd ys :: merge(xs, tl ys)
else hd xs :: merge(tl xs, ys);


(* Problem 2 *)
fun append(xs : int list, ys : int list) =
if null xs then ys
else hd xs :: append(tl xs, ys);
    
fun reverse(xs : int list) =
if null xs then xs
else append(reverse(tl xs), [hd xs]);


(* Problem 3 *)
fun pi(x : int, y : int, f : int -> int) =
if x = y then f(x)
else f(x) * pi(x + 1, y, f);


(* Problem 4 *)
fun append(xs : int list, ys : int list) =
if null xs then ys
else hd xs :: append(tl xs, ys);

fun digits(x : int) =
if x div 10 = 0 then [x]
else append(digits(x div 10), [x mod 10]);


(* Problem 5 *)
fun addAllDigits(x : int list) =
if null x then 0
else hd x + addAllDigits(tl x)

fun additivePersistence(x : int) =
if x div 10 = 0 then 0
else 1 + additivePersistence(addAllDigits(digits(x)));

fun digitalRoot(x : int) =
if x div 10 = 0 then x
else digitalRoot(addAllDigits(digits(x)));
