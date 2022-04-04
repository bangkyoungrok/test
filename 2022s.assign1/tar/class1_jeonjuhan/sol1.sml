
(*1.Merge Lists*)
fun merge(x1: int list, x2:int list) = 
  if null x1
  then x2
  else
    if hd(x1) > hd(x2)
    then hd(x2) :: merge(x1,tl(x2))
    else hd(x1) :: merge(tl(x1),x2);
(*example
merge([1,4,5],[2,6,7]);
*)

(*2.Reverse Lists*)
fun reverse(x: int list) =
    let fun re(y:int list, z:int list) =
        if null y
        then z
        else
          re(tl(y), hd(y)::z)   
    in
      re(x,[])
    end;
(*example
reverse([1,2,3,4]);
*)

(*3.Pi Function*)
fun pi(a:int,b:int,f:int->int) =
  if a=b
  then f(a)
  else if a>b
  then 0
  else f(a)*pi(a+1,b,f);
(*example function
fun add(x:int) = 
  x+1;
pi(1,3,add);
*)

(*4.Digits Function*)
fun digit(x:int) =
    let fun check(y: int, k:int list) =
        if y = 0
        then k
        else check(y div 10,(y mod 10)::k)
    in
      check(x,[])
    end;
(*example
digit(253);*)

(*5.Digital Roots and Additive Persistence*)
fun additivePersistence(x1: int) =
    let fun check(x:int,n:int,ctr:int) =
        if x = 0 
        then
            if (n mod 100)>=10
            then check(n,0,ctr+1)
            else ctr
        else check(x div 10, (x mod 10)+n, ctr)
    in
        check(x1,0,1)
    end;

fun digitalRoot(x1: int) =
    let fun check(x:int, n:int) =
        if x = 0
        then
            if (n mod 100)>=10
            then check(n,0)
            else n
        else check(x div 10, (x mod 10)+n)
    in
        check(x1,0)
    end;
(*example
additivePersistence(12349);
digitalRoot(12349);
*)


