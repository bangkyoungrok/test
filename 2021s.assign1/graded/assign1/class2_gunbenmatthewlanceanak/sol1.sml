(*1*)
fun merge([], ys) = ys
  | merge(xs, []) = xs
  | merge(x::xs, y::ys) =
        if x < y
        then x::merge(xs, y::ys)
        else y::merge(x::xs, ys)

(*2*)
fun reverse(xs) =
  if xs = [] then []
  else reverse(tl(xs)) @ [hd(xs)]

(*3*)
fun pi (a:int, b:int, f:int->int) =
  if a > b
  then 1
  else pi (a+1,b,f) + f(a)

(*4*)
fun digits (x:int) =
  if x = 0
  then []
  else
    let
      fun separate(num:int, temp:int list) =
        if num = 0
        then temp 
        else
          separate((num div 10), (num mod 10)::temp)
     in 
       separate(x,[])
     end
(*5*)
fun additivePersistence (x : int) =
        let
                fun calc(x:int, sum:int) =
                        if (x div 10) = 0
                        then sum + x
                        else calc((x div 10), sum + (x mod 10))
                fun count(x:int, cnt:int) = 
                        if (x div 10) = 0
                        then cnt
                        else count(calc(x,0), cnt+1)
        in
                count(x,0)
        end 

fun digitalRoot(x : int) = 
        let
                fun calc(x:int, sum:int) =
                        if (x div 10) = 0
                        then sum + x
                        else calc((x div 10), sum + (x mod 10))
                fun find(x:int) =
                  if (x div 10) = 0
                  then x
                  else find(calc(x,0))
        in
                find(x)
        end
(*I discussed all codes with my friend Afif from the same class*)
