fun merge(xs:int list, ys:int list)=
    if null xs then ys
   else if null ys then xs
   else if hd(xs)<hd(ys)
   then hd(xs)::merge(tl(xs),ys)
   else if hd(xs)>hd(ys)
   then hd(ys)::merge(xs,tl(ys))
   else []

val p1= merge([1,4,5],[2,6,7]);

(*)
fun reverse(xs:int list)=
     if null xs
     then []
     else reverse(tl(xs))@[hd(xs)]
     

val p2=reverse([1,2,3,4]);
*)

fun  reverse(x:int list)=
    let
      fun reverse_hp(y: int list,z:int list)=
        if null y
        then z
        else reverse_hp(tl(y),hd(y)::z)
    in
      reverse_hp(x,[])
    end
    

val p2=reverse([1,4,5,3,2]);
fun f(a:int)=
    a

fun pi(a : int ,b : int ,f: int->int)=
    if b-a>=0
    then  f(a)*pi(a+1,b,f)
    else 1

val p3=pi(3,5,f);

fun digits(a:int)=
    if a<10
    then [a]  
    else 
    let
    fun append(x,z)=
    if null x
    then z
    else hd(x)::append(tl(x),z)
    in
    append(digits(a div 10),[a mod 10])
    end

val p4=digits(43982750984);

fun sum (f:int list)=
    if null f
    then 0
    else hd(f)+sum(tl(f))


fun additivePersistence(a :int)=
    if a<10
    then 0
    else additivePersistence(sum(digits(a))) + 1

val p51=additivePersistence(987654);


fun digitalRoot(a:int)=
    if a<10
    then a
    else digitalRoot (sum(digits(a)))

val p52=digitalRoot(12349);