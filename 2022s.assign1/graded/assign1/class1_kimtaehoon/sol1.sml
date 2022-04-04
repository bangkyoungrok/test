fun merge(li1 : int list, li2 : int list) : int list =
if null(li1)
then li2
else if null(li2)
then li1
else if hd(li1)<hd(li2) 
then hd(li1) :: merge(tl(li1),li2)
else hd(li2) :: merge(li1, tl(li2));


fun reverse(li : int list): int list=
let fun rvrse(l1: int list, l2: int list)=
    if null l1
    then l2
    else rvrse(tl(l1), hd(l1)::l2)
in rvrse(li, [])
end;


fun pi(a: int, b: int, f: int->int) : int=
if a = b
then f(b)
else f(a) * pi(a+1, b, f);



fun digits(num : int) : int list=
let fun dgt(a : int,  l: int list): int list=
    if a <= 0
    then l
    else dgt(a div 10 , a mod 10::l)
in dgt(num,  [])
end; 


fun additivePersistence( c:int ) : int=
let fun ap(a : int,  b: int): int =
    if a <= 0
    then b
    else ap(a div 10 , a mod 10 + b)

    fun ap_rec(a : int, b : int, count:int): int=
    if b < 10
    then count
    else ap_rec(b,ap(b,0),count+1)
in ap_rec(c, ap(c,0),1)
end;

fun digitalRoot( c:int ) : int=
let fun dr(a : int,  b: int): int =
    if a <= 0
    then b
    else dr(a div 10 , a mod 10 + b)

    fun dr_rec(a : int, b : int): int=
    if b < 10
    then b
    else dr_rec(b,dr(b,0))
in dr_rec(c, dr(c,0))
end;
