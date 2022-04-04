fun merge (list1: int list, list2: int list): int list  =
if null list1 then list2
else if null list2 then list1

else if hd list1 < hd list2 then hd list1 :: merge(tl list1, list2)
else hd list2 :: merge(list1, tl list2)
;

fun reverse (list: int list): int list =
if null list
then []
else List.concat([reverse(tl list), [hd list]])
;

fun pi (a: int, b: int, f: int -> int): int =
if a = b
then f b
else f a * pi(a + 1, b, f)
;

fun digits (num: int): int list =
if num div 10 = 0
then [num]
else List.concat([digits(num div 10), [num mod 10]])
;

fun sum (list: int list): int =
if null list
then 0
else hd list + sum(tl list)
;

fun additivePersistence (num: int): int =
if length(digits num) = 1
then 0
else 1 + additivePersistence(sum(digits num))
;

fun digitalRoot (num: int): int =
if length(digits num) = 1
then num
else digitalRoot(sum(digits num))
;
