fun merge (ax : int list, bx: int list) = 
	if  null ax then  bx 
	else if null bx then ax 
	else  
		if hd(ax) < hd(bx) 
		then hd ax ::  (merge(tl ax,bx))
		else hd bx ::  (merge(ax,tl bx));

fun reverse (x : int list) = 
	if null (tl x)  then x else let 
		fun add2tail (x : int list, y : int ) =
			if null x then y :: []
			else hd (x) :: add2tail (tl(x), y) 
	in
	add2tail (reverse(tl x), hd x)  end ;


fun pi(a : int , b : int , f :  int->int )= 
if a<b then f(a)* pi(a+1,b,f) 
else if a>b then f(b)* pi(b+1,a,f) 
else  f(b);

fun digits (x : int ) = 
	if  x <10 then x::[] else let 
		fun add2tail (x : int list, y : int ) =
			if null x then y :: []
			else hd (x) :: add2tail (tl(x), y) 
	in
	add2tail (digits(x div 10), x mod 10) end ;

fun additivePersistence (x : int) =  if x < 10  then 0 else let
	fun listSum(y : int list) =
		if null y
		then 0
		else  hd(y) + listSum( tl(y) )
	in
	1 + additivePersistence(listSum(digits(x)))  end;

fun digitalRoot (x : int) =  if x < 10  then x else let
	fun listSum(y : int list) =
		if null y
		then 0
		else  hd(y) + listSum( tl(y) )
	in
	digitalRoot(listSum(digits(x)))  end;