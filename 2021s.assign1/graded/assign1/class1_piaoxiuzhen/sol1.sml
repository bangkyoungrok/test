fun merge (x:int list, y:int list)=
    if null x then y
    else if null y then x
         else if (hd x<hd y) then (hd x)::merge(tl x,y)
              else (hd y)::merge(x,tl y)

fun reverse(z:int list)=
    if null z then z
    else (reverse(tl z))@[hd z]

fun pi(x: int, y:int, f:int->int)=
    if x=y then f(y)
    else f(x)*pi(x+1,y,f)

fun digits(x:int)=
    if (x div 10)=0 then [x]
    else digits(x div 10)@[x mod 10]

fun additivePersistence(x:int)=
    let fun inadditive(x:int,z:int)=
            if (x div 10)=0 then z
            else let fun sum(y:int list)=
                        if null y then 0
                        else (hd y)+sum(tl y)
                 in 
                    inadditive(sum(digits(x)),z+1)
                 end
    in  
        inadditive(x,0)
    end

fun digitalRoot(x:int)=
    if (x div 10)=0 then x
    else let fun sum(y:int list)=
                if null y then 0
                else (hd y)+sum(tl y)
         in 
            digitalRoot(sum(digits(x)))
         end