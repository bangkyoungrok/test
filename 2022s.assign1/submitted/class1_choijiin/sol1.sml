fun merge(x : int list, y : int list):int list=
    if null x
    then y
    else hd(x):: merge(tl(x),y)


fun reverse(x:int list):int list=
    if null x
    then []
    else reverse(tl(x)) @ [hd(x)]

fun fac(x:int):int=
    if x=0
    then 1
    else x*fac(x-1)

fun pi(x:int, y:int)=
    if x = 1
    then x
    else (fac(y) div fac(x)) * x

fun digits(x:int):int list=
    if x < 10
    then [x]
    else  
        digits(x div 10) @ (x mod 10) :: []

fun sum_list (x :int list):int =
    if null x
    then 0
    else hd(x) + sum_list(tl(x))
        

fun additivePersistence(x:int):int = 
    if x<10
    then 0
    else 
        let 
 
            val value = if x < 10 then sum_list(digits(x)) else additivePersistence(x)
        in
            (let val count = 1 in count+1 end)
        end


fun digitalRoot(x:int):int=
    if x<10
    then x
    else   
        digitalRoot(sum_list(digits(x)))



