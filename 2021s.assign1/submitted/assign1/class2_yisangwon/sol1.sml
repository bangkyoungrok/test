(*
 * Programming Language, 2021 Spring
 * Assignment 1
 *
 * 컴퓨터전공 2014004920 이상원
 *)

(*
 * Pushes an item to the end of the list
 * I'll use this multiple times in this assignment
 *)
fun push(thelist: int list, anitem: int): int list =
  (* the base case: return an array with the item given when the list is empty *)
  if null thelist then anitem::[]
  (*
   * take the first item and call itself recursively
   * until we reach the end of the list
   *)
  else (hd thelist)::push(tl thelist, anitem)

(* solution for problem #1 *)
fun merge(l1: int list, l2: int list): int list =
  if null l1
  then if null l2
  (* the base case: return empty list when both lists are empty *)
       then []
  (* simply return l2 becasue it is supposed to be sorted and l1 is empty *)
       else l2
  else if null l2
  (* same thing goes here *)
       then l1 
  else if hd l1 > hd l2 
  (* take bigger one to the head and call itself recursively with remaining items *)
  then (hd l2)::merge(l1, tl l2)
  else (hd l1)::merge(tl l1, l2)

(* solution for problem #2 *)
fun reverse(thelist: int list): int list =
  (* the base case: reversing an empty list results to an empty list *)
  if null thelist then []
  (*
   * take out the first item
   * and put it to the end of the reversed list from the list without it
   * which means we have to recursively call itself.
   *)
  else push(reverse(tl thelist), hd thelist)

(* solution for problem #3 *)
fun pi(a: int, b: int, f: int -> int): int =
  if a > b then 1
  (*
   * the base case: when a reaches to b, simply return f(b)
   * perhaps we don't need this case becase pi(b+1, b, f) goes 1
   * but I'll keep this line because I perfer the way to
   * save a single iteration of recursion, and I also think
   * this will make the code more readable :D
   *)
  else if a = b then f(b)
  (* increase a by 1 until it gets to b, and multiply the result with f(a) *)
  else f(a) * pi(a + 1, b, f)

(* solution for problem #4 *)
fun digits(integer: int): int list =
  (* the base case: return an array with integer when it is smaller than 10 *)
  if integer < 10 then [integer]
  (*
   * pick the last digits and append it
   * to the list with digits without the last digit (recursion happens!)
   *)
  else push(digits(integer div 10), integer mod 10)

(*
 * sum up all of elements in the list.
 * it will be used when we do things for problem #5.
 *)
fun sum(integers: int list): int = 
  if null integers then 0
  else hd integers + sum(tl integers)

(*
 * I'll call this function in digitalRoot and additivePersistence.
 * It has a parameter for counting up the number of additions,
 * so when calling this funstion, it should be set to 0.
 *)
fun digitalRootAndAdditivePersistence(integer: int, numberOfAdditions: int): (int * int) =
  (* the base case: the digit has only one digit *)
  if integer < 10 then (integer, numberOfAdditions)
  (*
   * recursively call itself with the sum of all digits on the integer,
   * it also increases our addition counter by 1 to get digital root! 
   *)
  else digitalRootAndAdditivePersistence(sum(digits(integer)), numberOfAdditions + 1)

(*
 * solution for problem #5, both just calls digitalRootAndAdditivePersistence
 * and pull the desired value from the tuple, pretty simple!
 *)
fun digitalRoot(integer: int): int =
  #1(digitalRootAndAdditivePersistence(integer, 0))

fun additivePersistence(integer: int): int =
  #2(digitalRootAndAdditivePersistence(integer, 0))

(* the end *)
