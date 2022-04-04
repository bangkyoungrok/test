fun merge(list1: int list, list2: int list) = 
  if length(list1) = 0 then list2
  else if length(list2) = 0 then list1
  else if hd(list1) < hd(list2) then hd(list1) :: merge (tl(list1), list2)
  else hd(list2) :: merge (list1, tl(list2))

fun reverse(list: int list) =
  let fun reverseHelper (tmp: int list, ret: int list) = 
    if null tmp then ret
    else reverseHelper (tl(tmp),hd(tmp) :: ret)
  in 
    reverseHelper (list,[])
  end 

fun sigma(a:int, b:int, f:int->int) = 
  let fun sigmaHelper (c:int, d:int, f:int->int) = 
    if c > d then 0
    else sigmaHelper(c+1,d,f) + f(c)
  in 
    if a > b then 1
    else sigmaHelper(a,b,f)
  end

fun modf(x : int) = x mod 5


fun digits(x:int) = 
  let fun digitsHelper (x:int , ret : int list) = 
    if x div 10 = 0
    then  x::ret
    else digitsHelper(x div 10, x mod 10 :: ret)
  in
    digitsHelper(x,[]) 
  end  

fun sumDigits(x:int) = 
  let fun sumList(xList: int list) = 
    if null xList then 0
    else hd(xList) + sumList((tl xList))
  in 
    sumList(digits(x))
  end


fun additivePersistence (x : int) =
	let val tmp = sumDigits(x)
	in
		if x <10 then 0
		else additivePersistence(tmp) + 1
	end

fun digitalRoot (x: int) =
	let val tmp = sumDigits(x)
	in
		if x < 10 then x
		else digitalRoot(tmp)
	end
