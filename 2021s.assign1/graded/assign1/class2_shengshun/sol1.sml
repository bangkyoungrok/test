 fun merge(xs,nil) = xs
 |   merge(nil,ys) = ys
 |   merge(x::xs,y::ys) = if x<y then x :: merge(xs,y::ys) else y::merge(x::xs,ys);

fun reverse nil = nil 
| reverse (x::xs) = (reverse xs) @ [x];

fun f(x) = x+1;

fun pi(a,b,f) = if a > b then 1 else f(a)*pi(a+1,b,f);

fun digits(x,l) = if x < 9 then x::l else digits(x div 10,x mod 10::l);