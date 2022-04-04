fun merge_function (list1, list2, iter1, iter2) =
	if List.length list1 = iter1 andalso List.length list2 = iter2 then []
	else if List.length list2 = iter2 orelse (List.length list1 <> iter1 andalso List.nth (list1,iter1) < List.nth (list2,iter2))
		then List.nth(list1, iter1) :: merge_function (list1,list2, iter1 + 1, iter2) 
	else List.nth(list2, iter2) :: merge_function (list1,list2, iter1, iter2 + 1)

fun merge (list1, list2) = merge_function(list1, list2, 0, 0)


fun reverse_function (list1, iter1) =
	if iter1 <> 0
		then List.nth(list1,iter1) :: reverse_function (list1, iter1 - 1)
	else [List.nth(list1, iter1)]

fun reverse (list1) = reverse_function(list1, List.length(list1) - 1)

fun pi_function(a, b, f, iter) =
	if b = iter
		then f(iter)
	else f(iter) * pi_function(a, b, f, iter+1)

fun pi (a, b, f) = 
	if a > b
		then 1
	else pi_function(a, b, f, a)

fun find_divider(a, divider) =
	if a div divider <> 0
		then find_divider(a, divider * 10)
	else divider div 10

fun digits_function (a, divider) =
	if(divider <> 1)
		then (a div divider) :: digits_function(a mod divider, divider div 10)
	else [a]

fun digits(a) = digits_function(a, find_divider(a, 1))

fun add_elements(list1, iter1) =
	if(List.length list1 <> iter1)
		then List.nth(list1, iter1) + add_elements(list1, iter1 + 1)
	else 0

fun additivePersistence (a) =
	if a div 10 <> 0
		then 1 + additivePersistence (add_elements(digits(a),0))
	else 0

fun digitalRoot (a) =
	if a div 10 <> 0
		then digitalRoot (add_elements(digits(a),0))
	else a
