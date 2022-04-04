
(*for Q1*)
fun merge (a:int list, b:int list) = 
	if null a
	then if null b
		then []
		else b
	else if null b
		then a
		else if (hd a) > (hd b)
			then (hd b)::merge(a,tl b)
			else (hd a)::merge(tl a,b)	

val q1a = [1,4,5,9]
val q1b = [2,6,7,10]

val q1res = merge(q1a,q1b)

(*for Q2*)
fun real_reverse_for_reverse(a:int list, b:int list) = 
	if null a
	then b
	else real_reverse_for_reverse(tl a,(hd a)::b)		

fun reverse(a:int list) = 
	real_reverse_for_reverse(a,[])

val q2a = [1,4,5,3]
val q2res = reverse(q2a)

(*for Q3*)
fun pi(a:int,b:int,c:(int->int))=
	if a>b
	then 1
	else c(a)*pi(a+1,b,c)

fun f(a:int):int =
	a*a

val q3res = pi(1,4,f)


(*for Q4*)
fun real_digits_for_digits(a:int, b:int list)=
	if a=0
	then b
	else real_digits_for_digits(a div 10,(a mod 10)::b)

fun digits(a:int):int list =
	if a=0
	then []
	else real_digits_for_digits(a,[])

val q4input = 137960
val q4res = digits(q4input)

(*for Q5*)

fun sumOfNums(a:int list, sum:int) =
	if null a
	then sum
	else sumOfNums(tl a, sum+(hd a))

fun real_additivePersistence(a:int,b:int)=
	if a<10
	then b
	else real_additivePersistence( sumOfNums(digits(a),0), b+1)

fun additivePersistence(a:int)=
	real_additivePersistence(a,0)

fun digitalRoot(a:int)=
	if a<10
	then a
	else digitalRoot(sumOfNums(digits(a),0))



val q5input = 12349
val q5res1 = digitalRoot(q5input)
val q5res2 = additivePersistence(q5input);
