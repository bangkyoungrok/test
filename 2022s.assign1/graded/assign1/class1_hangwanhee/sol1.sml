fun sum_list (num_list : int list) =
	if null num_list
	then 0
	else hd(num_list) + sum_list(tl(num_list))


fun merge(first: int list, second: int list): int list = 
	if null first
	then second
	else if null second
		then first
		else if hd(first) > hd(second)
			then hd second :: merge(first, tl(second))
			else hd first :: merge(tl(first), second)



fun reverse(num_list: int list) : int list = 
	if null num_list
	then []
	else
		let fun find_last(num_list_: int list): int = 
				if null (tl(num_list_)) 
				then hd(num_list_) 
				else find_last(tl(num_list_))
		    fun find_minus_last(num_list_: int list): int list =
		    		if null (tl(num_list_))
				then []
				else hd(num_list_) :: find_minus_last(tl(num_list_))
		in
			find_last(num_list) :: reverse(find_minus_last(num_list))
		end

fun pi(a: int, b: int, f: int -> int): int =
	if a < b
	then f(a) * pi(a+1, b, f)
	else if a = b
		then f(a)
		else 1; 


fun digits(num: int): int list =
	if num div 10 > 0
	then 
		let fun reverse_digits(num_: int): int list =
			if num_ div 10 > 0
			then num_ mod 10 :: reverse_digits(num_ div 10)
			else [num_]
		in reverse(reverse_digits(num))
		end
	else [num]	

fun additivePersistence(num: int): int =
	if num div 10 > 0
	then
		let val temp = sum_list(digits(num))
		in	
			if temp div 10 > 0
			then 1 + additivePersistence(temp)
			else 1
		end
	else 0

fun digitalRoot(num: int): int =
	if num div 10 > 0
	then
		let val temp = sum_list(digits(num))
		in	
			if temp div 10 > 0
			then digitalRoot(temp)
			else temp
		end
	else num	
