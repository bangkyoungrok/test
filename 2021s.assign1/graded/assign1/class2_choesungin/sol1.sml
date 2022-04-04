fun merge ( x : int list, y : int list ) =
	if null x then y
	else if null y then x
	else if hd(x) < hd(y) then hd(x) :: merge( List.drop(x,1), y)
	else hd(y) :: merge( x, List.drop(y,1) )

fun reverse ( x: int list) =
	if null x then []
	else reverse(List.drop(x,1)) @ [hd(x)]

fun pi( a : int, b : int, f : int->int) =
	if a > b then 1
	else f(a) * pi(a+1, b, f)


fun digits ( x: int ) =
	if x <= 0 then []
	else digits(x div 10) @ [(x mod 10)]


fun sumlist( x: int ) =
	if x <= 0 then 0 
	else sumlist(x div 10) +  (x mod 10)   

fun additivePersistence ( x: int ) =
	if x <= 9 then 0
	else
	      let fun count ( new_x : int ) = 
		if sumlist(new_x) <= 9 then 1
		else 1 + count(sumlist(new_x))
  	      in
		count(x)
	      end

fun digitalRoot ( x: int ) =
	if x <= 9 then x
	else
	      let fun value ( new_x : int ) = 
		if sumlist(new_x) <= 9 then sumlist(new_x)
		else value(sumlist(new_x))
  	      in
		value(x)
	      end


