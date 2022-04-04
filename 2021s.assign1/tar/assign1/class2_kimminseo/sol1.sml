fun merge(xs:int list, ys:int list) =
  if null(xs)
  then ys
  else
    if null(ys)
    then xs
    else 
      if hd(xs) < hd(ys)
      then hd(xs)::merge(tl(xs), ys)
      else hd(ys)::merge(xs, tl(ys))

fun reverse(xs:int list) =
  let
    fun f(xs:int list, ys:int list) =
      if null(xs)
      then ys
      else 
        let val x = hd(xs)::ys
        in  f(tl(xs), x)
        end
    val x = hd(xs)::[]
  in f(tl(xs), x)
  end
 
fun pi(x:int, y:int, f:int -> int) =
  if x <= y
  then f(x) * pi(x + 1, y, f)
  else 1

fun digits(x:int) =
  let 
    val y = 10
    val z = (x mod y)::[]
    val w = x div y
    fun f(x:int, xs:int list) =
      if x < 10
      then x::xs
      else
        let 
          val y = 10
          val z = (x mod y)::xs
          val w = x div y
        in  f(w, z)
        end
  in f(w, z)
  end

fun additivePersistence(x:int) =
  if x < 10
  then 0
  else
    let 
      val y = digits(x)
      fun sumList(ys:int list) =
        if null(ys)
        then 0
        else hd(ys) + sumList(tl(ys))
      val z = sumList(y)
    in
      1 + additivePersistence(z)
    end

fun digitalRoot(x:int) =
  if x < 10
  then x
  else
    let
      val y = digits(x)
      fun sumList(ys:int list) =
        if null(ys)
        then 0
        else hd(ys) + sumList(tl(ys))
      val z = sumList(y)
    in
      digitalRoot(z)
    end
