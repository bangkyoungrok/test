(* 1.Merge Lists *)
fun merge(arr1 : int list, arr2 : int list) = 
    if null arr1
    then arr2
    else if null arr2
        then arr1
        else if hd(arr1) < hd(arr2)
            then hd(arr1) :: merge(tl(arr1), arr2)
            else hd(arr2) :: merge(arr1, tl(arr2))
    
(* 2. Reverse Lists *)
fun reverse(arr : int list) = 
    let
        fun rev_helper(xs : int list, ys : int list) =
            if null xs
            then ys
            else rev_helper(tl(xs), hd(xs) :: ys)
    in
        rev_helper(arr, [])
    end

(* 3. Pi Function *)
fun pi(a : int, b : int, f : int -> int) =
    if a > b 
    then 1

    else if a=b
    then f(a)

    else f(a) * pi(a+1, b, f);

(* 4. Digits Function *)
fun digits(x : int) = 
    let
        fun digits_helper(a : int) =
        if a = 0
        then []
        else a - (10 * (a div 10)) :: digits_helper(a div 10)
    in
        reverse(digits_helper(x))
    end

(* 5. Digital Roots and Additive Persistence*)
fun sum_list(xs : int list) =
    if null xs
    then 0
    else hd(xs) + sum_list(tl(xs))

fun additivePersistence(x : int) =
    if x div 10 = 0 
    then 0
    else 1 + additivePersistence(sum_list(digits(x)))

fun digitalRoot(x : int) = 
    if x div 10 = 0
    then x
    else digitalRoot(sum_list(digits(x)))

(* test 

fun add(x : int) = 
    x+1

val testmerge = merge([1,4,5], [2,6,7])
val testreverse = reverse([1,5,4,7,8])
val testpi = pi(1, 5, add)
val testdigits = digits(25341)
val testadditivePersistence = additivePersistence(9876)
val testdigitalRoot = digitalRoot(9876)
    
*)