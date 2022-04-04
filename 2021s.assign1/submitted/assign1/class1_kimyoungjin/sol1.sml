(* author: yjkim, 2016025241 *)
(* description: HYU programming language - assignment 1 *)

fun merge (a: int list, b: int list): int list =
    if List.null(a) andalso List.null(b)
    then []
    else if List.null(a)
        then b
        else if List.null(b)
        then a
            else
                if List.hd(a) < List.hd(b)
                then
                    List.hd(a) :: merge(List.drop(a, 1), b)
                else
                    List.hd(b) :: merge(a, List.drop(b, 1));

fun reverse (a: int list): int list =
    if List.null(a)
    then a
    else List.last(a) :: reverse(List.take(a, List.length(a) - 1));

fun pi (a: int, b: int, f: (int -> int)): int =
    if a = b
    then f(a)
    else f(a) * pi(a+1, b, f);

fun digits (a: int): int list =
    if a < 10
    then [a]
    else digits(a div 10) @ [a mod 10];

fun sum (a: int list): int =
    if List.null(a)
    then 0
    else List.hd(a) + sum(List.drop(a, 1))

fun additivePersistence (a: int): int =
    if a < 10
    then 0
    else 1 + additivePersistence(sum(digits(a)));

fun digitalRoot (a: int): int =
    if a < 10
    then a
    else digitalRoot(sum(digits(a)));
