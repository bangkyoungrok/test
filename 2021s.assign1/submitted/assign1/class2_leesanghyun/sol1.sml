fun merge ( xs : int list, ys : int list) =
  if null xs
  then ys
  else
    if null ys
    then xs
    else
      if hd (xs) < hd (ys)
      then hd (xs) :: merge (tl(xs), ys)
      else hd (ys) :: merge (xs, tl(ys))

fun reverse ( xs : int list) =
let fun excution(a : int list, b : int list) =
if null a
then b 
else excution(tl(a),hd(a) :: b)
in 
  excution(xs, [])
end

fun pi (a : int, b : int, f : int->int)=
  if a>b
  then 1
  else let fun excution(temp1 : int, temp2 : int, func: int->int, accum : int)=
  if temp1 > temp2
  then accum
  else excution(temp1+1, temp2, func, func(temp1)*accum)
       in excution(a, b, f, 1)
       end

fun digits(a : int)=
let fun excution( temp1 : int, temp2 : int list) =
if temp1<1
then temp2
else let val temp3 = (Real.fromInt(temp1)/Real.fromInt(10))
     in
       excution(floor(temp3),round((temp3-Real.fromInt(floor(temp3)))*Real.fromInt(10))::temp2)
     end
in excution(a, [])
end 

fun additivePersistence(n : int)=
let fun excution( a : int, b : int) =
if a<10
then b
else let fun adddigits( digitlist : int list, temp : int )=
if null digitlist
then temp
else adddigits(tl(digitlist), hd(digitlist)+temp)
     in excution( adddigits( digits(a), 0 ), b+1)
     end
in excution( n, 0 )
end

fun digitalRoot(n : int) =
if n<10
then n
else let fun adddigits( digitlist : int list, temp : int ) =
if null digitlist
then temp
else adddigits(tl(digitlist), hd(digitlist)+temp)
     in digitalRoot( adddigits(digits(n), 0 ) )
     end

