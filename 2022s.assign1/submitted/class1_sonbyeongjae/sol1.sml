(* 1. Merge List *)
fun merge (xs : int list, ys : int list): int list = 
    if null(xs) then ys 
    else if null(ys) then xs
    else if hd(xs) < hd(ys) then hd(xs)::merge(tl(xs), ys)
    else hd(ys)::merge(xs, tl(ys));


(* 2. Reverse List *)
fun reverse (xs : int list): int list = 
    let fun reverseAppend(ys : int list, zs : int list) = 
        if null(ys) then zs
        else reverseAppend(tl(ys), hd(ys)::zs)
    in
        reverseAppend(xs, [])
    end


(* 3. Pi Function *)    
fun pi(a : int, b : int, f : int -> int): int =
    if a = b then f(b)
    else f(a) * pi(a+1, b, f); 


(* 4. Digits Function *)
fun digits(x : int): int list =
    let fun getDigit(a : int, digitList : int list) = 
        if a = 0 then digitList
        else getDigit((a div 10), (a mod 10)::digitList)
    in
        getDigit(x, [])
    end


(* 5. Digital Roots and Additive Persistence *)
fun additivePersistence(x : int): int =
    let fun digits(x : int): int list =
            let fun getDigit(a : int, digitList : int list) = 
                if a = 0 then digitList
                else getDigit((a div 10), (a mod 10)::digitList)
            in
                getDigit(x, [])
            end

        fun sumDigits(xs : int list): int = 
            if null(xs) then 0
            else hd(xs) + sumDigits(tl(xs))

        val sum = sumDigits(digits(x))
    in 
        if x < 10 then 0
        else 1 + additivePersistence(sum)
    end

fun digitalRoot(x : int): int =
    let fun digits(x : int): int list =
            let fun getDigit(a : int, digitList : int list) = 
                if a = 0 then digitList
                else getDigit((a div 10), (a mod 10)::digitList)
            in
                getDigit(x, [])
            end

        fun sumDigits(xs : int list): int = 
            if null(xs) then 0
            else hd(xs) + sumDigits(tl(xs))

        val sum = sumDigits(digits(x))
    in 
        if x < 10 then x
        else digitalRoot(sum)
    end