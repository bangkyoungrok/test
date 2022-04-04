fun merge([],ys) = ys
|	merge(xs, []) = xs
|	merge(x::xs, y::ys)=
	if x < y then
		x::merge(xs, y::ys)
	else
		y::merge(x::xs, ys)


fun digits 0 = []
| digits x = digits(x div 10)@[x mod 10]


fun reverse [] = [] 
|	reverse [x] = [x]
|	reverse (x::xs) = (reverse xs) @ [x]

