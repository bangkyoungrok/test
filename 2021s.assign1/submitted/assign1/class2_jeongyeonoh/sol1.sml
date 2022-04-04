fun merge(fl : int list, sl : int list) = 
	if null fl
	then sl
	else if null sl
	then fl
	else (if hd fl > hd sl then hd sl :: merge(fl, tl sl) else hd fl :: merge(tl fl, sl) )
;

fun reverse(l : int list) = 
        let 
        fun rvs(fl : int list, sl : int list) = 
	if null fl
	then sl
	else rvs(tl fl, hd fl :: sl)
        in rvs(l, [])
        end
;


fun pi(a : int, b : int, f : int -> int) =
	if a = b
	then f(a)
	else f(a) * pi(a + 1, b, f)
;

fun digits(x : int) =
	let 
        fun dg (r : int, fl : int list) = 
	if r = 0
	then fl
	else dg (r div 10, r mod 10 :: fl)  
	in 
	dg(x div 10, [x mod 10])
	end
;

fun additivePersistence(x : int) =
	let
        fun sum(l : int list) =
        if null l
        then 0
        else sum(tl l) + hd l

	fun ap(a : int, b : int) =
	if a < 10
	then b
	else ap(sum(digits(a)), b + 1)
        in ap(x, 0)
	end
;

fun digitalRoot(x : int) =
	let 
        fun sum(l : int list) =
        if null l
        then 0
        else sum(tl l) + hd l

	fun dr(a : int) =
	if a < 10
	then a
	else dr(sum(digits(a)))
	in dr(x)
	end
;
