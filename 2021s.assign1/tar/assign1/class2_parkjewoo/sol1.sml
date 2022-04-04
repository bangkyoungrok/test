(* Question 1 *)
fun merge(arr1:int list, arr2:int list) : int list =
    if null(arr1)
    then arr2
    else
        if null(arr2)
        then arr1
        else
            if hd(arr1)<hd(arr2)
            then hd(arr1) :: merge(tl(arr1),arr2)
            else hd(arr2) :: merge(arr1, tl(arr2))

(* define append function for define reverse function and digits function*)
(* function call example: append([3,5],2) => [3,5,2] *)
fun append(tempArr:int list, x:int) : int list =
    if null(tempArr)
    then x::[]
    else hd(tempArr) :: append(tl(tempArr), x)

(* Question 2 *)
fun reverse(arr:int list) : int list =
    if null(arr)
    then []
    else append(reverse(tl(arr)), hd(arr)) 
    
(* Question 3 *)
fun pi(a:int, b:int, f:(int -> int)) : int =
    if a>b
    then 1
    else f(a)*pi(a+1,b,f)

(* Question 4 *)
fun digits(n:int) : int list =
    if n=0
    then []
    else append(digits(n div 10), n mod 10)

(* define digitSum function to solve question 5 *)
(* function call example: digitSum(123) => 6 *)
fun digitSum(n:int) : int =
    let fun sumAllElements(arr:int list) : int =
        if null(arr)
        then 0
        else hd(arr)+sumAllElements(tl(arr))
    in
        sumAllElements(digits(n))
    end

(* Question 5 *)
fun additivePersistence(n:int) : int =
    if n<10
    then 0
    else 1+additivePersistence(digitSum(n))

fun digitalRoot(n:int) : int =
    if n<10
    then n
    else digitalRoot(digitSum(n))