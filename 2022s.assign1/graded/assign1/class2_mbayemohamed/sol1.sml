fun merge (lista : int list , listb : int list) =
    if null (lista) 
        then listb
        else if hd(lista)<hd(listb) 
            then hd(lista) :: hd(listb) :: merge(tl(lista), tl(listb))
            else hd(listb) :: hd(lista) :: merge(tl(lista), tl(listb))






fun reverse(x:int list) =
    let
      fun rev_help(a : int list, b : int list) =
      if null a
      then b
      else rev_help(tl(a), hd(a) :: b)
    in
      rev_help(x,[])
    end 


fun add1 (a: int) =(* the function used in pi*)
a+1



fun pi (a : int, b: int, f : int -> int) =
if a = b
then 1
else f(a) * pi(a+1, b, f)







fun digits_helper(x : int) =
if x < 10
then x :: []
else
x mod 10 :: digits_helper(x div 10)

fun digits(n :int) =
reverse(digits_helper(n))


 
 fun sumList(x : int list)=
 if null x
 then 0
 else
 hd(x) + sumList(tl(x))
 
fun digitalRoot(number : int)=
if number<10                             
then number
else
digitalRoot(sumList(digits(number)))

fun additivePersistance(number : int)= (* The code for this function does not work as it is*)
let 
fun accumulator(acc : int)=
if digitalRoot(number) < 10
then acc
else accumulator(acc +1) 
in
accumulator(0)
end





