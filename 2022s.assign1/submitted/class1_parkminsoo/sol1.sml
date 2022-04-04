fun append(l, r) =
  if null l then r
  else hd(l) :: append( tl l, r );

fun merge (l, r) =
  if null l then r
  else if null r then l
  else if hd l < hd r then hd l :: merge( tl l, hd r :: tl r )
  else hd r :: merge( hd l :: tl l, tl r );

fun reverse(l) = 
  if null l then l
  else append(reverse(tl l), [ hd l ]);

fun pi (a, b, f) =
  if a > b then 1
  else f(a) * pi(a + 1, b, f);

fun digits (n) = 
  if n < 10 then [ n ]
  else append(digits(n div 10), [ n mod 10 ]);

fun sumList(l) = 
  if null l then 0
  else hd l + sumList(tl l);

fun additivePersistence (n) = 
  if n < 10 then 0
  else 1 + additivePersistence( sumList (digits n) );

fun digitalRoot (n) = 
  if n < 10 then n
  else digitalRoot( sumList (digits n) );