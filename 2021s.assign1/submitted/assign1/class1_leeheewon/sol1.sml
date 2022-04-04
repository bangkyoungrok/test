(* Add an int to right side of list *)
fun push(l: int list, e: int): int list = 
    let
        (* An example function on lec02.pdf *)
        (* Concatenate two int lists *)
        fun append(a: int list, b: int list): int list = 
            if null a then
                b
            else
                (hd a)::append(tl a, b)
    in
        append(l, [e])
    end

(* Problem 1 *)
fun merge(a: int list, b: int list): int list =
    let
        (* andBool(true, true) is true, otherwise false *)
        fun andBool(a: bool, b: bool): bool = 
            if a then 
                if b then
                    true
                else false
            else false
    in
        if andBool(null a, null b) then
            []
        else if null a then
            b
        else if null b then
            a
        else if hd a < hd b then
            hd a::merge(tl a, b)
        else
            hd b::merge(a, tl b)
    end

(* Problem 2 *)
fun reverse(a: int list): int list =
    if null a then
        []
    else
        push(reverse(tl a), hd a)

(* Problem 3 *)
fun pi(a: int, b: int, f: int -> int): int = 
    if a > b then
        (* The inputs a and b is not defined as a <= b in the problem. *)
        (* So I have defined a value for the case a > b. *)
        (* If a > b, pi is defined as 1 according to empty product. *)
        (* https://math.stackexchange.com/questions/1017441/why-is-empty-product-defined-to-be-1 *)
        1 
    else if a = b then
        f b
    else
        f a * pi(a + 1, b, f)

(* Problem 4 *)
fun digits(a: int): int list =
    if a < 10 then
        [a]
    else
        push(digits(a div 10), a mod 10)

(* Sequence to using additivePersistence and digitalRoot *)
(* digitalRootSeq(9876) is [9876, 30, 3] *)
fun digitalRootSeq(a: int): int list =
    let
        (* An example function on lec02.pdf *)
        (* Sum of int the list *)
        fun sumList(l: int list): int =
            if null l then
                0
            else
                hd l + sumList(tl l)
        
        (* Sum of digits *)
        fun sumDigits(a: int): int =
            sumList(digits a)
    in
        if a < 10 then
            [a]
        else
            a::digitalRootSeq(sumDigits a)
    end

(* Problem 5-1 *)
fun additivePersistence(a: int): int =
    let
        (* Length of the list *)
        fun len(l: int list): int = 
            if null l then
                0
            else
                1 + len(tl l)
    in
        len(digitalRootSeq a) - 1
    end

(* Problem 5-2 *)
fun digitalRoot(a: int): int =
    hd (reverse(digitalRootSeq a))