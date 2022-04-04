(*https://smlfamily.github.io/Basis/list.html*)
fun merge( a: int list,  b: int list):int list =
  let
    fun insert(a : int list, b: int , idx : int) =if idx<=0 then b::a else
      hd(a)::insert(tl(a),b,idx-1); 
    fun find_idx(a :int list , b : int, count : int) =
      if null(a) orelse hd(a) > b then count 
      else find_idx(tl(a),b,count+1)
  in
    (*find min -> check in ret -> add ret*)
    if null(b) 
    then a
    else (
        merge( insert(a,hd(b) , find_idx(a,hd(b),0) ) ,tl(b))
    )
  end;

fun reverse (a : int list):int list = 
  if null a
  then [] 
  else reverse(tl(a))@[hd(a)]


fun pi(a:int ,b:int ,c:int -> int)=
  if a<b  
  then c(a) *pi(a+1,b,c)
  else if a > b then 1
  else c(b)


fun digits(a: int) : int list=
  if a >10
  then digits(a div 10) @ [a mod 10]
  else [a mod 10]



fun digitalRoot( a: int) : int =
  let
    fun sum(a:int list): int =  if null a then 0  else hd(a) +  sum(tl(a))
  in
  if a <10
  then a
  else digitalRoot(sum(digits(a)))
  end;


fun additivePersistence( a : int ) : int =  
    let
      val i = ref 0;
      val tmp = ref a;
      fun sum(a:int list): int =  if null a then 0 else hd(a) +  sum(tl(a));
      fun dr(a:int , count:int) :int = 
        if a<10 then count else dr(sum(digits(a)),count+1)
    in
      dr(a,0)
    end;
(*
print("merge : need to be [1,2,3,4,5,6]\n");
merge([1,3,5],[2,4,6]);
print("merge : need to be [1,2,3,4,5,6]\n");
merge([2,4,6],[1,3,6]);
print("reverse : need to be [1,1,2,3]\n");
reverse([3,2,1,1]);
print("pi : need to be 120\n");
pi(1,5,pi_test);
print("digitalRoot : need to be 3\n");
digitalRoot(9876);
print("add : need to be 2\n");
additivePersistence(9876);
*)
