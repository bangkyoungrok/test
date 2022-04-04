fun merge (x: int list, y: int list) =
if null x
then y
else if null y
then x
else if hd x < hd y
then hd x :: merge (tl x, y)
else hd y :: merge (x, tl y);

fun reverse (x : int list) = 
let fun help (y : int list, z : int list) =
if null z
then y
else 
help (hd z :: y, tl z)
in 
help ([], x)
end;

fun pi (a : int, b : int, f:int -> int) = 
if a < b
then 1
else if a = b
then f(b)
else f(a) * pi (a+1, b, f);

fun digits (x : int) = 
let fun help (y : int list, z : int list) =
if null z
then y
else help(hd z :: y, tl z)
in 
help ([], let fun help2 (w : int) =
if w div 10 = 0
then w :: []
else w mod 10 :: help2(w div 10)
in
help2 x
end)
end;

fun additivePersistence (x : int) = 
let fun help (count : int, y : int) =
if y div 10 = 0
then count
else help (count+1, let fun help2 (z : int list) = 
if null z
then 0
else 
hd z + help2(tl z)
in
help2 (digits y)
end)
in 
help(0, x)
end;

fun digitalRoot (x : int) = 
if x div 10 = 0
then x
else digitalRoot let fun help (y : int list) =
if null y
then 0
else 
hd y + help(tl y)
in 
help (digits x)
end;    