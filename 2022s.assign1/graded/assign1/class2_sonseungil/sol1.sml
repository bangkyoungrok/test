fun merge (xs, ys) =
   if null xs
   then ys
   else if null ys
        then xs
        else if hd xs >hd ys
                 then hd ys::merge(xs, tl ys)
                 else hd xs::merge(tl xs, ys)



fun reverse(L) =
    if L = nil then nil
    else reverse(tl(L)) @ [hd(L)];



fun pi (a,b,f) =
    if a = b
        then f(b)
    else    
        f(a) * pi(a+1,b,f);

fun digits(n) = 
    if n div 10 = 0 then [n]
    else digits(n div 10) @ [n mod 10];

fun addDigits 0 = 0
  | addDigits n = (n mod 10) + (addDigits(n div 10));

fun additivePersistence(n) = if n<10
                        then 0 else     
                           1 + (additivePersistence (addDigits n));

fun digitalRoot(n) = if n <10 then n else(digitalRoot(addDigits n));