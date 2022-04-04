fun merge_two_list (x: int list,y: int list)=
    if null x
    then y
    else (hd x) :: merge_two_list((tl x),y)

fun smallest_in_list (x: int list)=
    if null (tl x)
    then hd x
    else if (hd x) < smallest_in_list(tl x)
    then hd x
    else smallest_in_list(tl x)

fun small_is_del (x: int list)=
    
    if (hd x) = smallest_in_list(x)
    then tl x
    else (hd x) :: small_is_del(tl x)
			       
			 
fun ordered_list (x: int list)=
    if null (tl x)
    then x
    else if smallest_in_list(x) = (hd x)
    then (hd x) :: ordered_list(tl x)
    else smallest_in_list(x) :: ordered_list(small_is_del(x))
							 
				 
fun has_same_ele (x:int list)=
    if null (tl x) 
    then false
    else if (hd x) = (hd (tl x))
    then true
    else has_same_ele(tl x)
		     
			 
fun merge (x: int list,y: int list )=
    if has_same_ele(ordered_list(merge_two_list(x,y)))
    then []
    else ordered_list(merge_two_list(x,y))

fun last_ele(x : int list)=
    if null (tl x)
    then hd x
    else last_ele(tl x)

fun last_is_del (x : int list)=
    if null (tl x)
    then []
    else (hd x) :: last_is_del(tl x)
			      
		     
fun reverse (x: int list)=
    if null (tl x)
    then x
    else last_ele(x) :: reverse(last_is_del(x))

fun pi (a: int, b: int, f: int -> int)=
    if a = b
    then f(a)
    else f(a)*pi(a+1,b,f)

fun digits_of_number (x : int)=
    if (x div 10) = 0
    then 1
    else 1 + digits_of_number(x div 10)

fun digits_rev(x : int)=
    if (x div 10) = 0
    then [x]
    else ((x - (x div 10)*10 ) :: digits_rev(x div 10))

fun digits(x : int)=
    reverse(digits_rev(x))

fun add_all_in_list (x : int list)=
    if null (tl x)
    then hd x
    else (hd x) + add_all_in_list(tl x)
		      
fun additivePersistence (x : int)=
    if (x div 10) = 0
    then 0
    else 1 + additivePersistence(add_all_in_list(digits(x)))

fun digitalRoot (x : int)=
    if (x div 10) = 0
    then x
    else digitalRoot(add_all_in_list(digits(x)))
