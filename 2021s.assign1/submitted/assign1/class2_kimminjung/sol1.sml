
(* 1. *)
fun merge(xs: int list*int list) =
  if null(#2 xs) then #1 xs
  else if null(#1 xs) then #2 xs
  else if hd(#1 xs) < hd(#2 xs) then hd(#1 xs)::merge(tl(#1 xs),#2 xs)
  else hd(#2 xs)::merge(#1 xs, tl(#2 xs))
  

(* 2. *) 
fun re(x:int list, y:int list) =
  if null(x) then y
  else re(tl x, (hd x)::y) 
fun reverse(xs:int list) = re(xs:int list, [])


(* 3. *)
fun f(xs:int) = xs + 1
fun pi(a:int, b:int,f) = 
  if a>b then 1
  else f(a) * pi(a+1,b,f)


(* 4. *)
fun dig(xs:int) = 
if xs < 9 then [xs]
else (xs mod 10)::dig(xs div 10)
fun digits(xs:int) = re(dig(xs:int),[])


(* 5. *)
fun additivePersistence(xs:int) =
  if xs < 10 then 1
  else
    let val a = xs mod 10 + additivePersistence(xs div 10)
    in 1+ additivePersistence(a)
    end

fun digitalRoot(xs :int) =
  let val a = if xs <10 then xs
  	      else (xs mod 10) + digitalRoot(xs div 10)
      val b = if a >9 then digitalRoot(a)
	      else a
  in b
  end
  

(* 
fun add(xs:int) = 
if xs<10 then xs
else (xs mod 10) + add(xs div 10)
*)

