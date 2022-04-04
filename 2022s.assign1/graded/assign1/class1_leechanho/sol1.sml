fun merge(list1: int list, list2: int list): int list =
	if list1=[]
	then list2
	else
		if list2=[]
		then list1
		else
			if hd (list1) > hd(list2)
			then hd(list2)::merge(list1, tl(list2))
			else hd(list1)::merge(tl(list1), list2);

fun recrusive_reverse(list1: int list, list2: int list): int list =
	if list1=[]
	then list2
	else recrusive_reverse(tl list1, hd(list1)::list2);

fun reverse(list1: int list): int list =
	recrusive_reverse(list1, []);

fun pi(n: int, m: int, f: int->int): int =
	if n=m
	then f(n)
	else f(n)*pi(n+1, m, f);


fun digits_reverse(number: int): int list =
	if number div 10 = 0
	then [number mod 10]
	else number mod 10 :: digits_reverse(number div 10);

fun digits(number: int): int list =
	reverse(digits_reverse(number));

fun digits_sequence(number: int): int list =
	if number div 10 = 0
	then [number mod 10]
	else number mod 10 :: digits(number div 10);

fun sum(numbers: int list): int = 
	if numbers=[]
	then 0
	else hd numbers + sum(tl numbers);

fun count(numbers: int list, countNumber: int) =
	if numbers=[]
	then countNumber
	else count(tl numbers, countNumber + 1);

fun findSequence(input: int, answer: int list): int list = 
	if sum(digits_sequence(input)) < 10
	then input::(sum(digits_sequence(input))::answer)
	else input::findSequence(sum(digits_sequence(input)), answer);


fun pop(input: int list): int =
	if tl input = []
	then hd input
	else pop(tl input);

fun additivePersistence(input: int): int = count(findSequence(input, []),0) - 1;
fun digitalRoot(input: int): int = pop(findSequence(input,[]));

additivePersistence(12349) = 3;
digitalRoot(12349) = 1;
