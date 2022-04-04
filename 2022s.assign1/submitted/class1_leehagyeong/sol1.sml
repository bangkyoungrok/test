

fun merge (xs : int list, ys : int list) =
  if (null(xs) orelse null (ys)) 
  then ( if null(xs) then ys else xs ) 
  else ( if hd(xs)<hd(ys) then hd(xs)::merge(tl(xs),ys) else
    hd(ys)::merge(xs,tl(ys)));

(*fun reverse( xs : int list ) =
  if null(xs)
  then []
  else reverse(tl(xs))@[hd(xs)];
  *)

fun reverse( xs : int list ) =
  let fun helprev( a : int list, b : int list ) =
        if null(a)
        then b
        else helprev(tl(a), hd(a)::b)
  in helprev( xs, [] )
  end; 

fun f( x : int ):int  = 
  x;

fun pi( a : int , b: int , f : int->int ) =
  if a = b
  then f(b)
  else f(a)*pi(a+1,b,f);

(*fun digits( x : int ) =
  if( x div 10 = 0 )
  then [x]
  else digits( x div 10)@[x mod 10];
  *)

fun digits( x : int ) =
  let fun helpdigit( n : int , xs : int list ) =
        if ( n div 10 = 0 ) 
        then n::xs
        else helpdigit( n div 10 , (n mod 10)::xs ) 
  in helpdigit( x, [] )
  end; 
  
fun sum( xs : int list )=
  if null(xs)
  then 0
  else hd(xs)+sum(tl(xs));


fun digitalRoot( n : int ) =
  if n < 10
  then n
  else digitalRoot( sum(digits(n)) );


fun additivePersistence( n : int ) =
  if n < 10
  then 0
  else 1+additivePersistence( sum(digits(n)));


