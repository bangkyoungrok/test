fun merge(e1: int list, e2: int list):  int list =
  if null(e1) then e2
  else if null(e2) then e1
  else if hd(e1) > hd(e2) 
   then hd(e2)::merge(e1, tl(e2))
  else if hd(e1) < hd(e2)
   then hd(e1)::merge(tl(e1), e2)
  else []

fun reverse(e: int list): int list = 
  if null(e) then []
  else reverse(tl(e))@[hd(e)]

fun pi(a: int, b: int, f: int->int): int =
  if a=b then f(a)
  else if a < b then
    f(a) * pi(a+1, b, f)
  else 1

fun digits(d: int): int list =
let val mod_10 = d mod 10
in
  if d < 0 then []
  else if d < 10 then [mod_10]
  else digits(d div 10) @ [mod_10]
end

fun additivePersistence(n: int): int =
let fun add_elements(e: int list): int =
        if null(e) then 0        
        else hd(e)+add_elements(tl(e))
    val res = add_elements(digits(n))
in 
  if res=0 then 0
  else if res < 10 then 1
  else 1 + additivePersistence(res)
end

fun digitalRoot(n: int): int =
let fun add_elements(e: int list): int =
        if null(e) then 0        
        else hd(e)+add_elements(tl(e))
    val res = add_elements(digits(n))
in 
  if res=0 then 0
  else if res < 10 then res
  else digitalRoot(res)
end

