fun merge(x:int list, y:int list):int list=
	if null x
	then
		if null y
		then
			[]
		else
			y
	else
		if null y
		then
			x
		else		
			if hd(x) > hd(y)
			then
				if null(tl(y))
				then
					hd(y) :: x
				else
					hd(y)::merge(x,tl(y))
			else
				if null(tl(x))
				then
					hd(x) :: y
				else
					hd(x)::merge(tl(x),y);

fun reverse(x:int list):int list=
	let
		fun last(x:int list):int=
			if null(tl(x))
			then
				hd(x)
			else
				last(tl(x))
		fun except(y:int list):int list=
			if null(tl(y))
			then
				[]
			else
				hd(y)::except(tl(y))
			
	in
		if null x
		then
			[]
		else
			last(x)::reverse(except(x))
	end;

fun pi(x:int, y:int, f:(int->int)):int=
	if x <> y
	then
		f(x)*pi(x+1,y,f)
	else
		f(y);

fun digits(x:int):int list=
	let
		fun chk(x:int):int=
			if x > 9
			then
				10 * chk(x div 10)
			else
				1
	in
		let
			val a = chk(x)
		in
			if a > 1
			then
				(x div a) :: digits(x mod a)
			else
				x::[]
		end
	end;

fun additivePersistence(x:int):int=
	let
		val bf_sum = digits(x)
		fun sum(y:int list):int=
			if null(tl(y))
			then
				hd(y)
			else
				hd(y) + sum(tl(y))
	in
		let
			val af_sum = sum(bf_sum)
		in
			if x < 10
			then
				0
			else
				if af_sum > 9
				then
					1 + additivePersistence(af_sum)
				else
					1
		end
	end;

fun digitalRoot(x:int):int=
	let
		val bf_sum = digits(x)
		fun sum(y:int list):int=
			if null(tl(y))
			then
				hd(y)
			else
				hd(y) + sum(tl(y))
	in
		let
			val af_sum = sum(bf_sum)
		in
			if af_sum > 9
			then
				digitalRoot(af_sum)
			else
				af_sum
		end
	end;