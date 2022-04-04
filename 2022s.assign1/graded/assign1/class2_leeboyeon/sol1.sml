(* 1. Merge Lists *)
fun merge (list1: int list, list2: int list) =
  if null(list1)
  then list2
  else if null(list2)
        then list1
        else if hd(list1) < hd(list2)
              then hd(list1)::merge(tl(list1),list2)
              else hd(list2)::merge(list1, tl(list2));

(* 2. Reverse List *)
fun reverse(int_list: int list) = 
  if null(int_list)
  then []
  else let fun rev_helper(list1: int list, list2: int list) = 
            if null(list1)
            then list2
            else rev_helper(tl(list1), hd(list1)::list2)
        in
            rev_helper(int_list, [])
        end;

 (* 3. Pi Function *)
fun pi(a: int, b: int, f: int -> int) =
  if a = b
  then f(b)
  else f(a)*pi(a+1, b, f);

(* 4. Digits Function *)
fun digits(num: int) = 
  let fun dig_helper(v: int, outList: int list) = 
        if v < 10
        then v::outList
        else dig_helper(v div 10, (v mod 10)::outList)
  in
    dig_helper(num, [])
  end;

(* 5. Digital Roots and Additive Persistence *)
fun sum_list(int_list: int list) = 
  if null(int_list)
  then 0
  else hd(int_list) + sum_list(tl(int_list));

fun additivePersistence(num: int) =
  if num < 10
  then 0
  else 1 + additivePersistence(sum_list(digits(num)));

fun digitalRoot(num: int) =
  if num < 10
  then num
  else digitalRoot(sum_list(digits(num)));