(* 1. Merge Lists *)
fun merge(l1: int list, l2: int list) =
    if null(l1)
        then l2
    else if null(l2)
        then l1
    else
        let
            val h1 = hd(l1)
            val h2 = hd(l2)
        in
            if h1 < h2
                then h1 :: merge(tl(l1), l2)
            else if h1 > h2
                then h2 :: merge(l1, tl(l2))
            else
                h1 :: merge(tl(l1), tl(l2))
        end

(* 2. Reverse List *)
fun reverse(l: int list) =
    let
        fun append(l: int list, n: int) =
            if null(l)
                then [n]
            else
                hd(l) :: append(tl(l), n)
    in
        if null(l)
            then []
        else
            append(reverse(tl(l)), hd(l))
    end

(* 3. Pi Function *)
fun pi(a: int, b: int, f: (int -> int)) =
    if a > b
        then 1
    else
        f(a) * pi(a + 1, b, f)

(* 4. Digits Function *)
fun digits(n: int) =
    let
        fun build(n: int) =
            if n < 10
                then [n]
            else
                n mod 10 :: build(n div 10)
    in
        reverse(build(n))
    end

(* 5. Digital Roots and Additive Persistence *)
fun digitSum(n: int) =
    if n < 10
        then n
    else
        n mod 10 + digitSum(n div 10)

fun additivePersistence(n: int) =
    if n < 10
        then 0
    else
        1 + additivePersistence(digitSum(n))

fun digitalRoot(n: int) =
    if n < 10
        then n
    else
        digitalRoot(digitSum(n))
