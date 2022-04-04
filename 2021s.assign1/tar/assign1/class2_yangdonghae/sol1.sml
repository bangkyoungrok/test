(* question 1 *)
fun merge (leftList : int list, rightList : int list) =
    if null(leftList)
    then if null(rightList)
         then []
         else rightList
    else if null(rightList)
         then leftList
         else if (hd(leftList) < hd(rightList))
              then hd(leftList)::merge(tl(leftList), rightList)
              else hd(rightList)::merge(leftList, tl(rightList));



(* question 2 *)
fun reverse (list : int list) =
    let fun makeReverse (tmpList : int list, reverseList : int list) =
            if null(tmpList)
            then reverseList
            else makeReverse(tl(tmpList), hd(tmpList)::reverseList)
    in  makeReverse(list, [])
    end;



(* question 3 *)
fun pi (a : int, b : int, func : int -> int) =
    if (a <= b)
    then func(a)*pi(a+1, b, func)
    else 1;



(* additional function used in question 4 *)
fun reverseDigits (num : int) =
    let val divTmp = num div 10
        val modTmp = num mod 10
    in  if (num > 0)
        then modTmp::(reverseDigits(divTmp))
        else []
    end;

(* question 4 *)
fun digits (num : int) = reverse(reverseDigits(num));



(* additional function used in question 5 *)
fun sum (list : int list) =
    if null(list)
    then 0
    else hd(list) + sum(tl(list));

fun len (list : int list, count : int) =
    if null(list)
    then count
    else len(tl(list), count+1);

fun digitalRoot2 (num : int, count : int) =
    let val list = digits(num)
    in  if (len(list, 0) > 1)
        then digitalRoot2(sum(list), count+1)
        else count
    end;

(* question 5-1 *)
fun additivePersistence (num : int) = digitalRoot2(num, 0);

(* question 5-2 *)
fun digitalRoot (num : int) =
    let val list = digits(num)
    in  if (len(list, 0) > 1)
        then digitalRoot(sum(list))
        else num
    end;