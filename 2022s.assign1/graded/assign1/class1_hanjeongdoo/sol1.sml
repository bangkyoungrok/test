1.2 리스트 헤드잡고 헤드가 작은것은 새 리스트의 테일의 헤드로 옮긴다. 뺀 리스트의 테일의 헤드로 옮기고 반복
 2.리스트 헤드잡고 새 리시트의 헤드에 넣고 뺀 리스트의 테일의 헤드로 옮긴다. 이후 반복 
3.재귀함수로 해결
4.10의 거듭제곱으로 나눈 나머지를 새리스트의 헤드에 넣는식으로 하고 만약 나눈 몫이 0인 경우는 마저하고 중단한다.
5.(1)4번으로 리시트 만들고 그 리시트 다 더하기, 이것을 다시 넣어서 반복

fun merge (xs : int list, ys : int list) =
if null xs
then ys
else if null ys
then xs
else if hd (xs) < hd (ys)
then hd (xs) :: merge(tl (xs), ys)
else hd (ys) :: merge(xs, tl (ys))

fun reverse (xs : int list) =
if null (tl xs)
then tl (xs)
else hd (reverse(tl (xs))) :: reverse(tl (tl (xs)))

fun pi (x : int, y : int, f : int -> int) =
if x < y
then f(x) * pi((x+1), y, f)
else 1

fun digits (x : int) =
if x=0
then []
else (x mod 10) :: digits(x div 10)

fun sum (xs : int list) =
if null xs
then 0
else hd(xs) + sum_list(t1 (xs))

fun addiP(x : int) =
val list = digit(x)
if (x div 10)=0
then [x]
else sum(list) :: addiP(sum(list))

fun additivePersistence(x : int) =
val list = addiP(x)
if (x div 10)=0
then 0
else 1+additivePersistence(sum(list))

fun digitalRoot(x : int) =
val list = digit(x)
if (x div 10)=0
then x
else digitalRoot(sum(list))