datatype 'a maybe = Nothing | Just of 'a;
fun maybe (i, _, Nothing) = i
    | maybe (_, f, Just i ) = f i;

(*Merge Lists*)
fun mrg(L as h::t: int list, L_ as h_::t_: int list) = 
    if h > h_ then h_::mrg(L, t_) else h::mrg(t, L_)
    | mrg(L: int list, []: int list) = L
    | mrg([]: int list, L_: int list) = L_;

(*Reverse List*)
fun foldl(f, init, h::t) = foldl (f, f(init, h), t)
    | foldl (_, init, []) = init; (*when no process ordered.*)
fun reverse(L: int list) = foldl (fn(acc, i) => i::acc, [], L);

(*pi Function*)
fun range(i,i_) = if i > i_ then [] else i::range(i+1, i_); 
fun pi(a: int, b: int, f: int -> int) = foldl(fn(acc, i) => f i * acc, 1, range(a, b+1));

(*Digits Function*)
fun findBef(state, i) = if state then Just i else Nothing;
fun unfoldr(f, init) = maybe([], fn (i, init_) => i::unfoldr(f, init_), f init);
fun digits(A: int) = 
    let fun do(B: int) = findBef(B <> 0, (B mod 10, B div 10)) 
    in reverse(unfoldr(do, A)) 
    end;

(*Digital Roots, Additive Persistence(반복덧셈)*)
fun sum 0 = 0
    | sum n = (n mod 10) + (sum (n div 10));
fun addPer n = if n < 10
            then 0 else
            1 + (addPer (sum n));
fun digitRoot n = if n < 10 then n else (digitRoot (sum n));