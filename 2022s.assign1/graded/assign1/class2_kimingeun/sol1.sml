(* problem 1 *)
fun merge(xs : int list*int list):int list=
  if null (#1 xs)
  then (#2 xs)
  
  else if null (#2 xs)
  then (#1 xs)


  else if hd(#1 xs) < hd(#2 xs)
  then hd(#1 xs) :: merge(tl(#1 xs), #2 xs)
       
  else
    hd(#2 xs) :: merge(#1 xs, tl(#2 xs))

(*problem 2 *)
fun reverse(xs : int list) : int list =
  if null xs
  then []

  else
    let val x = hd(xs)
    in
      reverse(tl xs) @ [x]
    end

(*problem 3*)
fun pi(x : int, y : int, f : int -> int) : int =
  if x > y
  then 1

  else if x = y
  then f(x)

  else
   f(x) * pi(x+1, y, f) 

(*problem 4*)
fun digits(x : int) : int list =
  if x < 10
  then [x]
  else
    let val n_div = x div 10
      val n_mod = x mod 10
    in
      digits(n_div) @ [n_mod]
    end

(*problem 5*)
fun sum_list(xs : int list) : int =
  if null xs
  then 0
  else hd(xs) + sum_list(tl(xs))

fun additivePersistence(x : int) : int =
let val xs = digits(x)
  val sum = sum_list(xs)

in if sum < 10
   then 1
   else
     1 + additivePersistence(sum)
end

fun digitalRoot(x : int) : int =
let val xs = digits(x)
  val sum = sum_list(xs)
in if sum < 10
   then sum
   else
     digitalRoot(sum)
end
