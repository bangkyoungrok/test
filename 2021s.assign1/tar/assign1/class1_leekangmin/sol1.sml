fun merge(array1: int list, array2: int list) = 
  if null array1 then array2
  else if null array2 then array1
  else if hd(array1) < hd(array2)
  then hd(array1)::merge(tl(array1), array2)
  else hd(array2)::merge(array1, tl(array2))

fun append(x: int list, y: int) = 
  if null x then [y]
  else hd(x)::append(tl(x), y)

fun reverse(array: int list) =  
  if null array then []
  else append(reverse(tl(array)),hd(array))

fun pi(a: int, b: int, f: int->int) = 
  if a = b then f(b)
  else if a > b then 1
  else f(a) * pi(a+1, b, f)

fun digits(num: int) = 
  if num = 0 then []
  else append(digits(num div 10), num mod 10)

fun sum(number: int list) = 
  if number = []  then 0
  else hd(number) + sum(tl(number))

fun additivePersistence(num: int) = 
  let val x = digits(num)
  in
    if(tl(x)=[]) then 0
    else 1 + additivePersistence(sum(x))
  end

fun digitalRoot(num: int) = 
  let val x = digits(num)
  in
    if(tl(x)=[]) then hd(x)
    else digitalRoot(sum(x))
  end
