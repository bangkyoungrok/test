fun concat(x : int list, y : int list)=
    if null(x) then y else
    hd(x)::concat(tl(x), y);


fun sumlist(x : int list)=
    if null(x) then 0 else
    hd(x) + sumlist(tl(x));


fun merge(x : int list, y : int list)=
   if null(x) andalso null(y) then [] else
   if null(x) then hd(y)::merge([],tl(y)) else
   if null(y) then hd(x)::merge(tl(x),[]) else
   if hd(x) < hd(y) then hd(x)::merge(tl(x),y) else
   hd(y)::merge(x,tl(y));


fun reverse(x : int list)=
    if null(x) then x else
    concat(reverse(tl(x)), [hd(x)]);


fun pi(a : int, b : int, f : int->int)=
    if a > b then 1 else
    f(a) * pi(a+1,b,f);


fun digits(a : int)=
    if a div 10 = 0 then [a mod 10] else concat(digits(a div 10), [a mod 10]);


fun additivePersistence(n : int)=
    if null(tl(digits(n))) then 0 else 1+additivePersistence(sumlist(digits(n)));


fun digitalRoot(n : int)=
    if null(tl(digits(n))) then n else digitalRoot(sumlist(digits(n)));
