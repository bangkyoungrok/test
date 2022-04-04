(* Q01. Merge Lists *)
(* merge : int list * int list -> int list
 * fun merge list * list -> list
 *)

(* 함수형 언어의 특징에 맞지 않음, mutation*)
val merge_list : int list

fun merge (nil , nil) = nil
  (*list01 == nil && list02 == nil -> return*)
  
  (* list01 == nil && list02 != nil -> []@list01*) 
  | list01 , nil = merge_list@list01
  (* list02 == nil && list02 != nil -> []@list02*)
  | nil, list02 = merge_list@list02
  
  (* list01 != nil && list02 != nil -> compare(hd list01, hd list02) -> 
  *   merge(tl list01, list02) || merge(list01, tl list02)
  *)
  | list01 , list02 = 
  if hd list01 < hd list02
  then 
    mergelist::hd list01
    merge(tl list01, list02)
  else
    mergelist::hd list02
    merge(list01, tl list02)

(* Q02. Reverse List 
* reverse: int list -> int list
*)

fun reverse (l :int list) =
  (* []::hd l; reverse(tl l); *)
  []::hd l
  reverse(tl l)
  (*if l == nil *)

(* Q03. Pi Function 
* pi: int * int * (int->int) -> int
*)
fun example(ex) = ex

fun pi(a :int, b :int, f) =
  if a<=b
  then 
    f(a)
    pi(a+1,b,f)
  else
    null
(* Q04. Digits Function
* digits: int -> int list
*)
fun digits (num :int): int list =

(* digital roots and additive persistence*)
