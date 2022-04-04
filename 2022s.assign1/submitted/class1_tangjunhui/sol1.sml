 fun merge (nil, nil) = nil

 |   merge (nil, L) = L

 |   merge (L, nil) = L

 |   merge (L1, L2) =

     if (hd L1) < (hd L2)

     then (hd L1)::merge(tl L1, L2)

     else (hd L2)::merge(L1, tl L2);


 fun reverse(nil)= (nil)
 |     reverse(x::xs)=
              reverse(xs) @[x];

