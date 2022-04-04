fun merge([], li2) = li2 | merge(li1,[]) = li1 | merge (a::li1, b::li2) = 
if a<b then a::merge(li1,b::li2) 
else b::merge(a::li1,li2);


 fun append(xs,ys) =
  if null(xs)
  then ys
  else hd(xs)::append(tl(xs),ys)

  fun reverse []= [] | reverse (a::li) =
 append(reverse(li),[a]);



  reverse([5,4,1]);


 
  fun pi(a,b,f) =
if a< b then f(a)*pi(a+1,b,f) else f(a);


fun f(x) = x+1;


  fun digits(x)=
  if x>0
  then

append(digits(x div 10),[x mod 10])

  else [];

 fun additivePersistence(x) =
let
   fun tot(sum, x) =
     if x div 10 = 0 
     then sum + x
     else tot(sum + (x mod 10), (x div 10))

    fun totlen(chk, x) =
      if x div 10 = 0 
      then chk
      else totlen(chk+1, tot(0,x))
 in
     totlen(0,x)
end


fun digitalRoot(x) = 
let 
  fun tot(sum,x) = 
    if (x div 10) = 0
    then sum + x
    else tot(sum + (x mod 10) , (x div 10))
   
  fun digitroot(x) = 
     if x div 10 = 0
     then x
     else digitroot(tot(0,x))

in
  digitroot(x)
end


 
