(*Author: Shaylyn McKenna*)
(*Date: 3/19/2021*)

(*Merge and sort two already sorted lists*)
fun merge (list1: int list, list2: int list) =
  if null list1 then list2 else 
    if null list2 then list1 else
      let val it = [] : int list
      if nth(list1, 0) > nth(list2, 0)
      then 
        merge(List.concat [it, [nth(list2, 0)]])
            list2 = drop(list2, 1)
      else
        List.concat [it, [nth(list1, 0)]]
        drop(list1, 1)
  end

(*Reverse a list*)
fun reverse (lst: int list) = 
  reverse (hd::tl, lst) = reverse(tl, hd::lst)

(*Create a pi function from a to b*)
fun pi (a: int, b: int, f: fun)=
  if a <= b then f(a) else f(a) * pi(a+1, b, f)
  
(*Turn a number into a list*)
fun digits (num, int) = it
  let val word = Int.toString num: string
  let val it = []: int list
  let val n = size word: int
  let val cur = 0: int
  while cur < n
    let val c = substring(word, cur, 1): string
    let val i : int = valOf(Int.fromString c)
    i :: it
    cur = cur + 1

(*Find how many times all the digits in a number can be added together*)   
fun additivePersistence(i: int) =
  fun sumList (x::xy::xs) = 
    x :: sumList (x+xy::xs)
    sumList1 xs = xs
  if i < 10 then i else
    let val xs = digits(i): int list
    additivePersistence(sumList(xs))

(*Same as additivePersistence, but it finds the smallest value that can be created*)
fun digitalRoot(i: int) = num
  fun sumList (x::xy::xs) = 
    x :: sumList (x+xy::xs)
    sumList1 xs = xs
  let val num = 0:
    while i > 9
      let val xs = digits(i): int list
      addit ivePersistence(sumList(xs))
      num = num + 1