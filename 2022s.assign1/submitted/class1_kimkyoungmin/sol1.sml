fun makelist(x : int) =
	if x < 10
	then x :: []
	else (x mod 10) :: makelist(x div 10)

fun mullist(xs : int list)=
	if null(xs)
	then 0
	else hd(xs) * mullist(tl(xs))

fun sumlist(xs: int list) =
	if null(xs)
	then 0
	else hd(xs) + sumlist(tl(xs))

fun comp1(xs : int list)=
	if null(tl(xs))
	then true
	else if hd(xs) = hd(tl(xs))
	then false
	else comp1(tl(xs))

fun append(xs : int list, ys : int list)=
	if null(xs)
	then ys
	else hd(xs) :: append(tl(xs),ys)

fun sort(x: int, xs : int list)=
	if null(xs)
	then x :: []
	else if x > hd(xs)
	then hd(xs)::sort(x,tl(xs))
	else x :: sort(hd(xs),tl(xs))

fun merge(xs:int list, ys:int list)=
	if comp1(xs) = false
	then []
	else if comp1(ys) = false
	then []
	else if null(xs)
	then ys
	else if null(ys)
	then xs
	else let val a = append(xs, ys)
		in
			if comp1(a) = false 
			then []
			else sort(hd(a), tl(a))
		end

		

fun reverse(xs : int list)=
	if null(xs)
	then []
	else reverse(tl(xs))@[hd(xs)]


fun f(x: int)=
	if x < 0
	then 0
	else 2 * x

			
fun countup(x : int, y : int,f:(int->int) )=
	if x = 0
	then []
	else if x = y
	then f(x) :: []
	else f(x) :: countup(x+1,y,f)

fun pi(x : int, y : int, f : (int->int))=
	if y < x
	then 0
	else if x = y
	then f(x)
	else	
	 mullist(countup(x,y,f))

fun digits(x:int)=
	let val a = makelist(x)
	in
		if null(a)
		then []	
		else
		reverse(a)
	end
		
			

fun additivePersistence(x : int)=
	let val a = sumlist(makelist(x))
	in
		if x < 10
		then 0
		else 1 + additivePersistence(a)
	end

fun digitRoot(x : int)=
	if x < 10
	then x
	else let val a = sumlist(makelist(x))
		in
			digitRoot(a)
		end
