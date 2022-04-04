(* #1 *)
fun merge(a:int list, b:int list) =
    if a = [] andalso b <> [] then b
    else if a <> [] andalso b = [] then a
    else if hd a > hd b
        then hd b :: merge(a, tl b)
        else hd a :: merge(tl a, b);
 
(* #2 *)
fun reverse(li:int list) =
    if tl (li) = []
    then li
    else
        let
            fun app(xs:int list, ys:int list) =
                if xs = []
                then ys
                else hd(xs) :: app(tl(xs), ys)
        in app(reverse(tl (li)), [hd (li)])
        end;
 
(* #3 *)
(*fun f(a) = a*2;*) 
fun pi(a:int, b:int, f : int -> int) =
    if a > b then 1
    else f(b) * pi(a, b-1, f);
 
(* #4 *)
fun digits(num:int) =
    if num mod 10 = num then [num] 
    else
        let
            fun app(xs:int list, ys:int list) =
                if xs = []
                then ys
                else hd(xs) :: app(tl(xs), ys)
        in app(digits(num div 10), [num mod 10])
        end;
 
(* #5 *) 
fun additivePersistence(num:int) = 
    let
        fun digitsSum(sum:int, li:int list) =
            if li = []
            then sum
            else digitsSum(sum+hd(li), tl(li))

        fun main(cnt:int, num:int) =
            if num < 10
            then cnt
            else main(cnt+1, digitsSum(0, digits(num)))
    in main(0, num)
    end;
 
fun digitalRoot(num:int) =
    if num < 10
    then num
    else
        let
            fun digitsSum(sum:int, li:int list) =
                if li = []
                then sum
                else digitsSum(sum + hd(li), tl(li))
        in digitalRoot(digitsSum(0, digits(num)))
        end;