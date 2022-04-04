fun merge(xs : int list, ys: int list) = 
  if null xs
  then
    let
    in
      if null ys
      then []
      else ys
    end

  else if null ys
  then xs

  else
    let 
      val hd_1 = hd xs
      val hd_2 = hd ys
    in
      if hd_1 < hd_2
      then hd_1::merge(tl xs,ys)
      else hd_2::merge(xs,tl ys)
    end

fun reverse(xs: int list) =
  if null xs
  then []
  else
    let
      fun revhelp(xs: int list, temp: int list) = 
        if null xs
        then temp
        else
          revhelp(tl xs, hd xs::temp)
    in
      revhelp(xs,[])
    end

fun pi(a: int, b: int, f:int->int) = 
  if a > b
  then 0
  else pi(a+1,b,f) + f(a)

fun digits (x : int) =
  if x = 0 
  then []
  else 
    let
      fun dighelp(a: int, temp: int list) =
        if a = 0
        then temp
        else
          dighelp(a div 10, a mod 10:: temp)
    in
      dighelp(x, [])
    end

fun additivePersistence(x: int) =
  if x = 0
  then 0
  else 
    let
      fun addDigits (x: int, sum: int) =
        if x = 0
        then sum
        else addDigits((x div 10), sum + (x mod 10))

      fun countPersistence (x: int, count: int) =
        if (x div 10) = 0
        then count
        else countPersistence(addDigits(x,0), count+1)
    in
      countPersistence(x,0)
    end
      

fun digitalRoot (x: int) =
  if x = 0
  then 0
  else
    let 
      fun addDigits (x: int, sum : int) = 
        if x = 0
        then sum
        else addDigits((x div 10), sum + (x mod 10))

      fun root(x: int) = 
        if (x div 10) = 0
        then x
        else root(addDigits(x,0))
    in
      root(x)
    end


