fun merge(x:int list, y:int list)=
  if null x
  then y
  else if null y
  then x
  else if hd x < hd y 
  then hd x::merge(tl x, y)
  else hd y::merge(tl y, x);

fun reverse(x:int list)=
  let fun switch(x:int list, y:int list)=
    if null x
    then y
    else switch(tl x, hd x::y)
  in
    switch(x,[])
  end;

fun pi(x:int, y:int, f:int->int)=
  if x>y
  then 0
  else if x=y 
  then f(x)
  else f(x)*pi(x+1,y,f);

fun digits(x:int)=
  let fun separate(x:int, y:int list)=
    if x<1
    then y
    else separate(x div 10, x-(x div 10)*10::y);
  in
    separate(x,[])
  end;

fun sumDigits(x:int list)=
  if null x
  then 0
  else hd x + sumDigits(tl x);

fun countPersistence(x:int, y:int)=
  if x<10 then y
  else countPersistence(sumDigits(digits(x)),y+1);

fun additivePersistence(x:int)=
  countPersistence(x,0);

fun digitalRoot(x:int)=
  if x<10 
  then x
  else digitalRoot(sumDigits(digits(x)));
