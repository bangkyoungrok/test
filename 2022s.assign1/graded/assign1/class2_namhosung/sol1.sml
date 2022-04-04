(* 1. merge *)
fun merge(x : int list, y : int list) : int list =
    if null(x) then y
    else if null(y) then x
    else if hd(x) < hd(y) then hd(x)::merge(tl(x),y)
    else hd(y)::merge(x, tl(y));

(* 2. reverse *)    
fun reverse(x : int list) : int list =
    let
    fun inrev(x : int list, y : int list) : int list =
        if null(x) then y
        else inrev(tl(x), hd(x)::y)
    in
        inrev(x,[])
    end;

(* 3. pi *)    
fun pi(a : int, b : int, f : int -> int) : int =
    let
    fun inpi(a : int, b : int, f : int -> int) : int =
        if a = b then f(a)
        else f(a) * inpi(a + 1, b, f)
    in
        inpi(a, b, f)
    end;

(* 4.  digits *)
fun digits(x : int) : int list =
    let
        fun indigits(x : int, y : int list) : int list =
            if x = 0 then y
            else indigits(x div 10, (x mod 10)::y)
    in
        indigits(x,[])
    end;

(* 5. additivePersistence
      digitalRoot *)
fun addDigits(x : int) : int =
    if x = 0 then 0
    else (x mod 10) + addDigits(x div 10);

fun additivePersistence(x : int) : int =
    let
        fun inaddpers(x : int, f : int -> int) : int =
            if x < 10 then 0
            else 1 + inaddpers(f(x),f)
    in
        inaddpers(x, addDigits)
    end;

fun digitalRoot(x : int) : int =
    let
        fun indgtroot(x : int, f : int -> int) : int =
            if x < 10 then x
            else indgtroot(f(x),f)
    in
        indgtroot(x, addDigits)
    end;
