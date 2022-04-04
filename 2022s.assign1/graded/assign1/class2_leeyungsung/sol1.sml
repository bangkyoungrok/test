(*problem.1*)
fun merge(li1:int list, li2:int list) = 
	if null li1
	then(
		if null li2
		then []
		else hd(li2)::merge([],tl(li2)))
	else(
		if null li2
		then hd(li1)::merge(li1:int list,li2:int list)
		else(
			if hd(li1)<hd(li2)
			then hd(li1)::merge(tl(li1),li2)
			else hd(li2)::merge(li1,tl(li2)))
	)

(*problem.2*)
fun reverse(li:int list) =
	let fun rev_help(li1,li2)=
		if null li1 then li2 else rev_help(tl(li1),hd(li1)::li2);
	in(
		rev_help(li,[])
	)
	end

(*problem.3*)
fun pi(a:int,b:int,f:int->int)=
	if a>b then 1 else f(a)*pi(a+1,b,f)

(*problem.4*)
fun digits(x:int)=
	let fun digi(a:int) =
		if a<10
		then a::[]
		else(
			(a mod 10)::digi(a div 10)
		)
	in reverse(digi(x))
	end

(*problem.5*)
fun addList(x:int list)=
	if null x then 0 else hd x + addList(tl x)

fun additivePersistence(x:int):int =
	let 
		fun apCount(a:int,b:int) =
			if b<10
			then a
			else apCount(a+1,addList(digits(b)));
	in apCount(0,x)
	end
	
fun digitalRoot(x:int):int =
	if x<10
	then x
	else digitalRoot(addList(digits(x)))
