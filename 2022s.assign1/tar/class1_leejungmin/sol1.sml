(* 참조사항 :

problem 4 번은 김민관 학생의 코드를 통해 알고리즘을 이해하고학습 후 마지막 else 부분을 도움받아 작성 했습니다.

problem 5 번의 경우 김민관 학생의 코드 중 실행을 위한 필요 함수에 대해 도움을 받고
        sum_list, count 함수는 스스로 작성하였고
        append, additivePersistenc, digitalRoot 함수 부분은 알고리즘을 참조하였습니다.
*)


(* 1 *)
fun merge (xs, ys) =
   if  xs = nil
   then ys
   else if ys = nil
        then xs
        else if hd xs > hd ys
                then [hd ys] @ merge(xs, tl ys)
                else [hd xs] @ merge(tl xs, ys)

(* 2 *)
fun reverse(xs) =
        if xs = nil
        then nil
        else reverse(tl xs)@[hd xs]

(* 3 *)
fun pi(a,b,f) =
        if a = b
        then f(a)
        else if a>b
                then pi(a-1,b,f) *f(a)
                else pi(a,b-1,f) *f(b)

(* 4 *)
fun digits(x) =
        if x div 10 = 0
        then [x]
        else digits(x div 10) @ [x mod 10]


(* 5 *)

fun sum_list(xs) =
        if null xs
        then 0
        else hd(xs) + sum_list(tl xs)

fun count(xs) =
        if null xs
        then 0
        else count(tl xs) + 1

fun append(x) =
        if sum_list(digits(x)) < 10
        then [sum_list(digits(x))]
        else append(sum_list(digits(x))) @ [sum_list(digits(x))]

fun additivePersistence(x) =
        let val y = append(x)
        in count(y)
        end

fun digitalRoot(x) =
        let val y = append(x)
        in hd(y)
        end

