(*PROBLEM 1*)
fun merge (nil, L) = L (*case 1 : the first list is null*)
 |  merge (M, nil) = M (*case 2 : the second list is null*)
 |  merge (x::M, y::L) = (*others cases*)(*x,y is the beginning of lists*)
       if (x < y) then x :: merge(M, y::L) (*comparison of the first element of lists and merging depending on that*)
       else y :: merge(x::M, L); (*case y<x, equal not possible*)


(*merge ([1,3,5,7,9],[2,4,6,8]);
merge([1,6,7],[3,4,5,8]);*)


(*2*)
fun reverse [ ] = [ ] (*if list null then return a list null*)
 |  reverse (A::B) = reverse B @ [A]; (*recur if not with concatenation in the opposite way*)
 (*reverse([1,6,2]);*) (*testing*)

(*3*)
fun pi (a : int ,b : int ,f : int->int) =
  if a=b then f(b)      (*stop condition of recur, when each part of the product are calculated*)
  else f(a)*pi(a+1,b,f); (*recur*)

(*fun f (x) = x;
pi(1,3,f)*) (*testing*)


(*4*)
(*fun digits nil = []
 |  digits (a : int) =
    let 
    val L = int list = []
    in 
    a <> 0
    end



digits(123);*)

    
    