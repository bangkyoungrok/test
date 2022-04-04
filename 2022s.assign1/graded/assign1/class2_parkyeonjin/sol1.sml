fun getSum(a : int list) =
    if null(a)
    then 0
    else hd(a) + getSum(tl(a))

fun merge(a : int list, b : int list) =
    if null a
    then b
    else if null b
    then a
    else if hd(a) < hd(b)
    then hd(a)::merge(tl(a), b)
    else hd(b)::merge(a, tl(b))

fun reverse(a : int list) =
    if null a
    then []
    else 
        let fun size(a : int list) =
                if null a
                then 0
                else 1 + size(tl(a))

            fun accessByIdx(b : int list, idx : int) =
                if idx = 0
                then hd(b)
                else accessByIdx(tl(b), idx - 1)

            fun reverseWithIdx(b : int list, idx : int, size : int) = 
                if idx = 0
                then [hd b]
                else accessByIdx(b, idx)::reverseWithIdx(b, idx - 1, size)
            val asize = size(a)
        in
            reverseWithIdx(a, asize - 1, asize)
        end
                
fun pi(a : int, b : int, f : (int -> int)) = 
    if a < b
    then pi(b, a, f)
    else if a = b
    then f(a)
    else f(a) * pi(a + 1, b, f)

fun digits(a : int) =
    if a = 0
    then []
    else 
        let fun tenPow(n : int) =
                if n = 0
                then 1
                else 10 * tenPow(n - 1)
            fun len(a : int) = 
                if a < 10
                then 1
                else 1 + len(a div 10)
            fun digitsWithLen(a : int, len : int) = 
                if len = 1
                then [a mod 10]
                else (a div tenPow(len - 1))::digitsWithLen(a mod tenPow(len - 1), len - 1) 
            val alen = len(a)
            val tens = tenPow(alen - 1)
        in
            digitsWithLen(a, alen)
        end
        
fun additivePersistence(a : int) =
    if a < 10
    then 0
    else 1 + additivePersistence(getSum(digits(a)))

fun digitalRoot(a : int) =
    if a < 10
    then a
    else digitalRoot(getSum(digits(a)))