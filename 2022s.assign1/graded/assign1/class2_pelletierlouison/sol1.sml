fun merge( l1 : int list , l2 : int list) =
	
	if null l1
	then l2
	else
		if hd l1< hd l2
		then hd l1 ::merge(tl l1, l2)
		else hd l2 :: merge(l1, tl l2)
;


fun reverse_help(l1 : int list, l2 : int list) =
	 if null l1
	 then l2
	 else reverse_help(tl(l1),hd l1::l2)
	 ; 

fun reverse(l : int list) = 

 reverse_help(tl l, [hd l])
	;

	  
fun append (xs : int list, ys : int list) = 
	if null xs
	then ys
	else hd (xs) :: append (tl(xs), ys)
	;
fun Squarefunction(x : int) =
	x*x
	;
fun pi(f : int->int , a : int , b : int ) =
	if a < b
	then f(a)*pi(f,a+1,b)
	else	
		if(a>b)
		then f(b)*pi(f,a,b+1)
		else f(a)
		;
fun calculLength(number : int) = 
	
	if number < 10
	then 1 
	else 1 + calculLength(number div 10);

	

fun pow (x : int, y : int) = 
	if y=0 
	then 1 
	else x * pow(x,y-1)
;

fun digit_help(number : int, leng : int, l1: int list) =
	if  leng =1
	then number::l1
	else 
		if leng=0
		then l1
		else digit_help(number mod pow(10,leng-1),leng-1,number div pow(10,leng-1)::l1)
	;


fun digits(n : int) =
	
	reverse(digit_help(n mod pow(10,calculLength(n)-1),calculLength(n)-1,[n div pow(10,calculLength(n)-1)]))
	;

fun sum(l : int list) =
	if null l
	then 0
	else hd l+sum(tl l)
	;
fun digitalRoot(n: int ) =
	if calculLength(sum(digits(n)))=1
	then sum(digits(n))
	else digitalRoot(sum(digits(n)));
fun additivePersistence(n : int) =
	if calculLength(sum(digits(n)))=1
	then 1
	else 1+additivePersistence(sum(digits(n)));

	

	
	

	