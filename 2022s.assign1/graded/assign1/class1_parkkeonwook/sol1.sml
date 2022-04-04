(*1*)

fun merge(xs:int list, ys:int list) :int list =

if null(xs) 
then ys
else 
	if null(ys)
	then xs
	else 
		if hd(xs) < hd(ys)
		then hd(xs)::merge(tl(xs), ys) 
		else hd(ys)::merge(xs, tl(ys))
		

(*2*)

fun reverse(xs:int list):int list=

let
	fun rev_h(ms:int list, ns:int list):int list=
		
		if null(ms)

		then ns

		else rev_h(tl(ms), hd(ms)::ns)
			
in
	rev_h(xs, [])


end

(*3*)

fun pi(x:int, y:int, f:int->int) : int=

if x>y
then 1
else 
	if x =y
	then f(x)
	else f(x) * pi(x+1, y, f)


(*4*)

fun digits(x:int):int list=

let
	fun help_d(k:int, ks:int list):int list=

		if k<10
		then k::ks
		else help_d(k div 10, k mod 10 :: ks)

in
	help_d(x, [])


end



(*5*)

fun additivePersistence(x:int) : int=

let 
	fun eachsum(k:int):int=
		
		if k<10
		
		then k

		else k - (k div 10)*10 + eachsum(k div 10)



	val num = eachsum(x)

in
	if num < 10

	then 1

	else 1 + additivePersistence(num)


end


fun digitalRoot(x:int) : int=

let 
	fun eachsum(k:int):int=
	
		if k<10
		
		then k
	
		else k - (k div 10) * 10 + eachsum(k div 10)
	
	val num = eachsum(x)
		
in 

	
	if num < 10
	then num
	else digitalRoot(num)


end
	
