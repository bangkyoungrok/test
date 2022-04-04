(* 1. Merge List *)
fun merge([], ys) = ys
  | merge(xs, []) = xs
  | merge(x::xs, y::ys) = 
        if x < y 
        then x::merge(xs, y::ys)
        else y::merge(x::xs, ys)

(* 2. Reverse List *)
fun reverse nil = nil
        | reverse(x::xs) = (reverse xs) @ [x]

(* 3. Pi Function *) 
fun pi(a,b,f) = 
                if a=b
                then f(b)
                else
                  f(a)*pi(a+1,b,f)

(* 4. Digits Function \\ I solve question 4 altogether with my friend Matthew  *)
fun digits(n) = 
                if n = 0
                then []
                else 
                  let
                        fun append(x,y) = 
                          if x = 0 
                          then y
                          else append((x div 10), (x mod 10)::y)
                  in
                        append(n,[])
                  end
                
(* 5. Digital Roots and Addictive Persistence *)
fun addDigits 0 = 0
  |addDigits n = (n mod 10) + ( addDigits(n div 10));
fun additivePersistence n = if n < 10
                                then 0 
                                else 1 + (additivePersistence(addDigits n));
fun digitalRoot n = if n < 10 
                        then n 
                        else (digitalRoot(addDigits n));
