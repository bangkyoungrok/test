(* Problem 1 *)
(* merge: int list * int list -> int list *)

fun merge ([]:int list, b:int list):int list = b
    | merge (a:int list, []:int list):int list = a
    | merge (a:int list, b:int list):int list = 
    if hd a < hd b then 
        hd a::merge (tl a, b)
    else
        hd b::merge (a, tl b);


(* Problem 2 *)
(* reverse: int list -> int list *)

fun reverse(a:int list):int list =
    let fun prepend(x:int list, y:int list):int list =
        if x = [] then
            y
        else
            prepend(tl x, (hd x)::y)
    in
        prepend(a, [])
    end;


(* Problem 3*)
(* pi: int * int * (int -> int) -> int *)

fun pi (a:int, b:int, f:(int -> int)):int = 
    if a > b then
        1
    else
        f a * pi (a+1, b, f);


(* Problem 4 *)
(* digits: int -> int list *)

fun digits (a:int):int list = 
    let fun digit_prepend(x:int, y:int list):int list =
        if x = 0 then
            y
        else
            digit_prepend (x div 10, (x mod 10)::y)
    in
        digit_prepend(a, [])
    end;


(* Problem 5 *)
(* additivePersistence: int -> int *)

fun additivePersistence (a:int):int =
    let fun listSum ([]):int = 0
          | listSum (a:int list):int = hd a + listSum (tl a)
    in
        if (a < 10) then
            0
        else 
            additivePersistence (listSum (digits a)) + 1
    end;

(* digitalRoot: int -> int *)

fun digitalRoot (a:int):int = 
    let fun listSum ([]):int = 0
            | listSum (a:int list):int = hd a + listSum (tl a)
    in 
        if (a < 10) then
            a
        else
            digitalRoot (listSum (digits a))
    end;