fun merge(xs: int list, ys: int list) =
if null xs
then ys
else
      if hd(xs) < hd(ys)
      then hd(xs) :: merge(tl(xs), ys)
      else hd(ys) :: merge(xs, tl(ys))

fun reverse ( xs:int list)=
if null xs
then []
else
      let fun reverse_helper( ogList: int list, tempList: int list)=
            if null ogList
            then tempList
            else reverse_helper( tl(ogList), hd(ogList)::tempList )
      in reverse_helper(xs, [])
      end

fun pi(a : int, b: int, f:int->int)=
if a < b
then f(a) * pi(a+1, b, f)
else
      if a=b 
      then f(b)
      else 0

fun digits(x: int):int list=
let fun digits_helper(ogX: int, temp: int list)=
	if ogX div 10 = 0 
	then ogX mod 10 :: temp
	else digits_helper(ogX div 10, ogX mod 10 :: temp)
in digits_helper(x, [])
end

fun sum_of_list(x: int list):int=
if null x
then 0
else hd x + sum_of_list(tl x)

fun digitalRoot(x: int):int=
let val y = sum_of_list(digits(x))
in if y > 9
	then digitalRoot(y)
	else y
end
	
fun additivePersistence(x: int ):int =
let fun helper(ogX: int, count: int)=
      if sum_of_list( digits(ogX) ) > 9
	then helper( sum_of_list(digits(ogX)), count + 1)
	else count + 1
in helper(x, 0)
end




