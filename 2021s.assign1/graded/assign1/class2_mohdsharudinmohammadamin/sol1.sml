
fun merge (x : int list, y : int list) = 
  if null x
  then y
  else (hd x) :: merge((tl x), y)


fun reverse []     = []  
  | reverse (h::t) = reverse t @ [h];
  

fun digits (d : int) =
  Int.toString(d) :: []


fun additivePersistence (p : int) = 
  digits (p)
