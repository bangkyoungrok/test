(* PL_HW1_Problem1, ComputerSoftware 2017029343 김기환 *)

(*

   A program to merge two different lists that are alreay sorted is ascending order 
   The merged list should also be in ascending order.

   x : [1, 4, 5] , y : [2, 3, 6] 
   -> merge(x, y) : [1, 2, 3, 4, 5, 6] 

*)
    
fun merge(x : int list, y : int list) : int list = 
    if false=null(x) andalso false=null(y) 

    (* If both lists x, y are not empty *)
    (* Compares the first element in the two lists
       and puts the smaller value into the result list 
       (using recursion) *)
    then 
         if hd(x) < hd(y) 
         then hd(x)::merge(tl(x), y) 
         else hd(y)::merge(x, tl(y))

    (* If one of the two lists x, y is empty *)
    (* If list x is empty, all values remaining in list y are put into the result list
       (and vice versa) *)
    else 
         if true=null(x) 
         then y
         else x;


(* ============================================================================================ *)


(* PL_HW1_Problem2, ComputerSoftware 2017029343 김기환 *)

(* A program that reverses elements in the list 
   when a specific int list is given as input *)
    

fun reverse(x : int list) : int list =
    (* If input list is empty, return empty list *)
    if null(x)
    then []
    else
        let fun rev_help(x_ : int list, y_ : int list) : int list = 
                if null(tl(x_))
                then hd(x_)::y_
                else rev_help(tl(x_), hd(x_)::y_)
        in rev_help(x,[])
        end;



(* ============================================================================================ *)

        
(* PL_HW1_Problem3, ComputerSoftware 2017029343 김기환 *)

(* Implement the pi function that continuously multiplies the result of the function add_f *)

fun pi(x : int, y : int, add_f : int->int) : int =
    if y >= x
    then add_f(y) * pi(x, y-1, add_f)
    else 1;



(* ============================================================================================ *)



(* PL_HW1_Problem4, ComputerSoftware 2017029343 김기환 *)

(* Given an integer as an input,
   a program that seperates each digit of that integer into a list. *)


fun digits(x : int) : int list = 
    let fun digits_help(x_ : int, y_ : int list) : int list =
            if (x_ div 10)  = 0
            then x_::y_
            else digits_help(x_ div 10, (x_ mod 10)::y_)
        in digits_help(x, [])
        end;


(* ============================================================================================ *)



(* PL_HW1_Problem5, ComputerSoftware 2017029343 김기환 *)

fun digitalRoot(x : int) : int = 
    if x <= 9
    then x
    else
        let val ans = (x mod 10) + digitalRoot(x div 10)
        in 
            if ans > 9
            then digitalRoot(ans)
            else ans
        end;

fun additivePersistence(x : int) : int =
    if x <= 9
    then 1
    else 
         let fun add_help(x : int) = 
                 if (x div 10) = 0
                 then x
                 else (x mod 10) + add_help(x div 10)
         in 
            if add_help(x) >= 10
            then 1 + additivePersistence(add_help(x))
            else 1
         end;
