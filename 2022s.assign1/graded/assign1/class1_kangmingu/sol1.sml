fun merge(xs : int list, ys : int list)=
    if null xs
    then ys
    else
        let 
            fun min (xs : int list) = 
                if null xs
                then 0
                else if null (tl xs)
                then hd xs
                else 
                    let val tl_ans = min(tl xs)
                    in
                        if hd xs < tl_ans
                        then hd xs
                        else tl_ans
                    end
        in
            if min xs < min ys
            then min xs :: merge(tl xs,ys)
            else min ys :: merge(xs, tl ys)
        end

fun reverse(xs : int list)=
    if null xs
    then []
    else if null(tl xs)
    then hd xs::[]
    else reverse(tl xs)@[hd xs]

fun f(n:int) = n

fun pi (a:int,b:int,f:int->int) =
if a = b
    then f(b)
else    
    f(a) * pi(a+1,b,f)

fun digits(n : int) =
  if n div 10 = 0
  then n::[]
  else digits(n div 10)@[n mod 10]

fun sum_list(xs : int list)=
    if null xs
    then 0
    else hd(xs) + sum_list(tl(xs))

fun digital_root(n:int)=
    if sum_list(digits(n)) div 10 = 0
    then sum_list(digits(n))
    else digital_root(sum_list(digits(n)))