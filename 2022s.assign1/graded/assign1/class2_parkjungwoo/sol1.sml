fun append (xs:int list, ys:int list)= 
if null xs 
then ys 
else hd(xs) :: append (tl(xs), ys)

fun delete(input: int list, output: int list, element: int, index: int): int list=
    if(index = length(input) - 1)
    then (output @ [List.nth(input, index)])

    else if(List.nth(input, index) = element)
    then delete(input, output, element, index+1)
    
    else delete(input, (output @ [List.nth(input, index)]), element, index+1)

fun findBiggest(l: int list, index:int, temp:int):int=
    if(index = length(l)-1)
    then List.nth(l, index-1)
    
    else if(length(l) = 1)
    then List.nth(l, 0)

    else if(List.nth(l, index) > temp)
    then findBiggest(l, index+1, List.nth(l, index))   

    else findBiggest(l, index+1, temp)  

fun merge(x: int list, y: int list)=
    if((length(x) <> 0) andalso (length(y) <> 0))
    then if (hd(x) < hd(y))
         then append([hd(x)], merge(tl(x), y))
         else append([hd(y)], merge(tl(y), x))

    else if((length(x) = 0) andalso (length(y) <> 0))
    then append([hd(y)], merge(tl(y), x))

    else if((length(x) <> 0) andalso (length(y) = 0))
    then append([hd(x)], merge(tl(x), y))

    else []

fun reverse(x: int list)=
if(length(tl(x)) <> 0)
then append(reverse(tl(x)), [hd(x)])
else append([], [hd(x)])

fun mult(i:int, j:int)=
i*j

fun pi(a:int, b:int, f:(int*int)->int)=
if(b=a)
then a
else mult(b, pi(a, b-1, mult))

fun digits(num: int)=
if(num div 10 = 0)
then [num]
else append(digits(num div 10), [num mod 10])

fun sum_list(xs:int list)= 
if null xs 
then 0 
else hd(xs) + sum_list(tl(xs))

fun additivePersistence(num: int)=
if(sum_list(digits(num)) >= 10)
then additivePersistence(sum_list(digits(num)))+1
else 1

fun digitalRoot(num: int)=
if(sum_list(digits(num)) >= 10)
then digitalRoot(sum_list(digits(num)))
else sum_list(digits(num))

(* val it1 = merge([1,4,5], [2,6,7,8]);
val it2 = reverse([1,5,4]);
val it3 = pi(3, 5, mult);
val it4 = digits(253);
val it5 = additivePersistence(12349);
val it6 = digitalRoot(12349); *)