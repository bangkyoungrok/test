(* 1. Merge Lists *)
fun merge (xs, ys) =
	if null xs then ys
	else if hd(xs)<hd(ys) then hd(xs) :: merge(tl(xs), ys)
	else hd(ys) :: merge(xs, tl(ys))

(* Append Function *)
fun append(xs,ys) = 
if null xs then ys
else hd(xs) :: append(tl(xs),ys)

(* 2. Reverse Lists *)
fun reverse(s : int list) =
if null s then []
else append(reverse(tl(s)),[hd(s)])

(* Test Function f -> 3. *)

fun f(x : int) = x

(* 3. Pi Function *)
fun pi(x,y,f) =
	if x>y then 1
	else 
	let val i = ref x and j = ref 1
	in 
	while !i <= y do (
		j := !j * f(!i);
		i := !i + 1
	);
	!j
	end;

(* Quotient Function *)
fun quo(a,b) = a div b

(* Power Function *)
fun pow(x,y) = 
if y = 0 then 1
else x * pow(x,y-1)

(* 4. Digits Function *)
fun digits(x) = 
if x = 0 then []
else
let
  val t = ref x and i = ref 0
in
while !t <> 0 do (
  	i := !i + 1;
  	t := quo(!t, 10)
  	);
  	quo(x,pow(10,!i-1)) :: digits(x mod pow(10,!i-1))
end;