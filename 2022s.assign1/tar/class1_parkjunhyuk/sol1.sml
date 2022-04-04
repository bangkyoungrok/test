fun merge (nil, ys) = ys
|   merge (xs, nil) = xs
|   merge (x::xs, y::ys) =
        if (x < y) then x :: merge(xs, y::ys)
        else y :: merge(x::xs, ys);

fun reverse(nil) = (nil)
|   reverse(x::xs) =
        reverse(xs) @   [x];
