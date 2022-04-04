fun merge(nil, ys) = ys
| merge(xs, nil) = xs
| merge(x::xs, y::ys) =
    if(x<y) then x :: merge(xs, y::ys)
    else y :: merge(x::xs, ys);

fun reverse(L : int list)=
  if L = nil then nil
  else reverse(tl(L)) @ [hd(L)];

fun pi(a : int, b : int, f : int->int) =
  if a >= b
  then 1
  else f(a) * pi(a+1,b,f);

fun digits n =
  if n < 10 then [n]
  else (digits (n div 10)) @ [n mod 10];

fun digits n =
  if n < 10 then [n]
  else (digits (n div 10)) @ [n mod 10];

fun listAdd nil = 0
  | listAdd (x::xs) = listAdd(xs) + x;

fun persistanceAndRoots n =
  let val sum = listAdd(digits n) in
    if (sum < 10) then (1, sum)
    else 
      let val (ap, root) = persistanceAndRoots(sum) in
        (ap + 1, root)
      end
  end;

fun additivePersistence n = #1(persistanceAndRoots(n));
fun digitalRoot n = #2(persistanceAndRoots(n));