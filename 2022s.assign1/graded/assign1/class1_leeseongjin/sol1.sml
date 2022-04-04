fun merge(l1: int list, l2: int list) : int list =
if null l1 then l2 else
if null l2 then l1 else
if hd(l1) < hd(l2) then
hd(l1) :: merge(tl(l1), l2) else
hd(l2) :: merge(l1, tl(l2));

fun reverse(l1: int list) : int list =
let fun concat(a: int list, b: int) : int list =
if null a then b :: [] else hd(a) :: concat(tl(a), b) 
in
if null l1 then [] else
concat(reverse(tl(l1)), hd(l1))
end;

(* if a is bigger than b, *)
(* this function will automatically switch a and b *)
(* so that a is always smaller than or equal to b *)
fun pi(a:int, b:int, f:int -> int) : int =
if a > b then pi(b, a, f) else
if a = b then f(a) else
f(b) * pi(a, b-1, f);

fun digits(x:int) : int list =
let fun concat(a: int list, b: int) : int list =
if null a then b :: [] else hd(a) :: concat(tl(a), b) 
in 
if x < 10 then x :: [] else
concat(digits(x div 10), x mod 10)
end;

fun additivePersistence(x:int) : int =
let fun sum(a: int list) : int =
if null a then 0 else hd(a) + sum(tl(a))
in
if x < 10 then 0 else
additivePersistence(sum(digits(x))) + 1
end;

fun digitalRoot(x:int) : int = 
let fun sum(a: int list) : int =
if null a then 0 else hd(a) + sum(tl(a))
in
if x < 10 then x else
digitalRoot(sum(digits(x)))
end;
