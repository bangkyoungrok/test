fun merge(x: int list, y: int list): int list =
	if null(x)
	then y
	else
		if hd(x) < hd(y)
		then 
			if  null(x) then []
			else hd(x)::merge(tl(x),y)
		else
			if null(y) then []
			else hd(y)::merge(x,tl(y))
	
fun get_last(x: int list): int = 
	if null(tl x)
	then hd(x)
	else get_last(tl x);

fun cut_last(x: int list): int list = 
	if null(tl x) then []
	else hd(x)::cut_last(tl(x));

fun reverse(x: int list): int list = 
	if null(x) then []
	else get_last(x)::reverse(cut_last(x));

fun pi(x:int, y: int, z): int=
	if(x <= y)
	then z(x)*pi(x+1,y,z)
	else 1;

fun rev_digits(x:int): int list=
	if x <> 0
		then (x mod 10)::rev_digits(x div 10)
	else [];

fun digits(x:int): int list=
	reverse(rev_digits(x));

fun sumoflist(x:int list): int=
	if(null(tl x)) then hd(x)
	else hd(x) + sumoflist(tl x);

fun digitalRoot(x:int): int=
	if x < 10 then x
	else
		let val digitsList = digits(x)
	in
		if sumoflist(digitsList) < 10 then sumoflist(digitsList)
		else digitalRoot(sumoflist(digitsList))
	end; 

fun additivePersistence(x:int): int=
if x < 10 then 0
else
	let fun counter(y:int) = 
		let val digitsList = digits(y)
		in
			if sumoflist(digitsList) < 10 then 1
			else 1 + counter(sumoflist(digitsList))
		end
	in counter(x) end;

