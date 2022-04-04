fun merge(a:int list, b:int list) =
    if null a
    then b
    else if null b
    then a
    else if hd(a) < hd(b)
    then hd(a)::merge(tl(a),b)
    else hd(b)::merge(a,tl(b))

fun reverse(x:int list) =
    if null x
    then x
    else
        let
            fun rev_helper(y:int list, l:int list) =
                if null y
                then l
                else rev_helper(tl(y),hd(y)::l)
        in
            rev_helper(x,[])
        end

fun pi(a:int, b:int, f:int->int) =
    if a=b
    then f(a)
    else f(a)*pi(a+1,b,f)


fun digits(x:int) =
    if x < 10
    then [x]
    else
        let
            fun helper(l:int list, y:int) =
                if y<10
                then y::l
                else helper((y mod 10)::l,y div 10) 
        in
            helper([],x)
        end


fun additivePersistence(x:int) =
    if x < 10
    then 0
    else
        let 
            fun ap_helper(y:int, z:int list) =
                if null z
                then y
                else ap_helper(y + hd(z),tl(z))
        in
            1 + additivePersistence(ap_helper(0,digits(x)))
        end
                
fun digitalRoot(x:int) =
    if x < 10
    then x
    else
        let
           val d = 10
           val a = x mod d + digitalRoot(x div d)
        in
           if a >= 10
           then digitalRoot(a)
           else a
        end
