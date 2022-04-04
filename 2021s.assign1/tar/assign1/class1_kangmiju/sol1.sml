fun merge(x : int list, y : int list)=
  if null(x)
  then y
  else if null(y)
  then x
  else if hd(x)<hd(y)
  then hd(x)::merge(tl(x),y)
  else hd(y)::merge(x,tl(y))


fun reverse(x:int list)=
   if null(x)
   then []
   else
        let fun reverse2(x1:int list,x2:int list)=
                if null(x1)
                then x2
                else reverse2(tl(x1),hd(x1)::x2)
        in reverse2(x,[])
        end
        
fun pi(x:int, y:int, f:int->int)=
  if x>y
  then 1
  else f(x)*pi(x+1,y,f)

fun digits(x:int)=
  if x<0
  then []
  else
    let fun digit2(x1:int)=
        if x1 div 10=0
        then x1::[]
        else x1 mod 10::digit2(x1 div 10)
    in reverse(digit2(x))
    end

fun additivePersistence(x:int)=
if x div 10=0
  then 0
  else
    let fun aP(x1:int, x2:int)=
        if x1 div 10=0
        then x2
        else
          let fun sum(y:int list)=
                if null(y)
                then 0
                else hd(y)+sum(tl(y))
          in  aP(sum(digits(x1)),x2+1)
          end
    in aP(x,0)
    end

fun digitalRoot (x:int)=
  if x div 10 = 0
  then x
  else
    let fun sum(y:int list)=
        if null(y)
        then 0
        else hd(y)+sum(tl(y))
    in digitalRoot(sum(digits(x)))
    end

