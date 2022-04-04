(* Problem 1. Merge Lists *)
fun merge(list1: int list, list2: int list): int list =     
    if null(list1) then
        if null(list2) then
            []
        else
            list2
    else
        if null(list2) then
            list1
        else
            if hd(list1) > hd(list2) then
                hd(list2)::merge(list1, tl(list2))
            else
                hd(list1)::merge(tl(list1), list2)

(* Problem 2. Reverse List *)
fun reverse(list: int list): int list =
    let fun my_rev(list1: int list, list2: int list) =
        if null(list1) then
            list2
        else
            my_rev(tl(list1), hd(list1)::list2)
    in
        my_rev(list, [])
    end

(* Problem 3. Pi Function *)
fun pi(a: int, b: int, f: (int -> int)): int =
    let fun iterate(i: int): int =
        if i > b then
            1
        else 
            f(i) * iterate(i + 1)
    in
        iterate(a)
    end

(* Problem 4. Digits Function *)
fun digits(num: int): int list =
    let fun my_digit(num: int, digitList: int list): int list =
        if num <= 0 then
            digitList
        else
            my_digit(num div 10, (num mod 10)::digitList)
    in
        my_digit(num, [])
    end

(* Problem 5. Digital Roots and Additive Persistence *)
(* Util function for Problem 5 *)
fun getSumOfDigits(num: int): int = 
    if num <= 0 then
        0
    else
        (num mod 10) + getSumOfDigits(num div 10)

fun additivePersistence(num: int): int =
    if num < 10 then
        0
    else
        1 + additivePersistence(getSumOfDigits(num))

fun digitalRoot(num: int) =
    if num < 10 then
        num
    else
        digitalRoot(getSumOfDigits(num))