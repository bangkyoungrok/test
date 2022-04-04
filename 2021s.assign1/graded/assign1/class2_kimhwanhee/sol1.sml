(* Helper functions *)

datatype 'a Maybe = Nothing | Just of 'a;

fun maybe (x, _, Nothing) = x
  | maybe (_, f, Just x ) = f x;

fun toMaybe (cond, x) = if cond then Just x else Nothing;

fun range (a, b) = if a < b then a::range (a + 1, b) else [];

fun foldl (f, init, lh::lt) = foldl (f, f (init, lh), lt)
  | foldl (_, init,     []) = init

fun unfoldr (f, init) = maybe ([], fn (x, ninit) => x::unfoldr (f, ninit), f init);

fun minori (f, init) = maybe (init, fn x => minori (f, x), f init);

fun sum l = foldl (fn (acc, x) => acc + x, 0, l);

fun length l = foldl (fn (acc, x) => acc + 1, 0, l);

(* Assignments *)

(* #1 Merge lists *)
fun merge (al: int list, []: int list) = al
  | merge ([]: int list, bl: int list) = bl
  | merge (al as ah::at: int list, bl as bh::bt: int list) =
    if ah < bh then ah::merge (at, bl) else bh::merge (al, bt);

(* #2 Reverse list *)
fun reverse (l: int list) = foldl (fn (acc, x) => x::acc, [], l);

(* #3 Pi function *)
fun pi (a: int, b: int, f: int -> int) = foldl (fn (acc, x) => f x * acc, 1, range (a, b + 1));

(* #4 Digits function *)
fun digits (x: int) = let
  fun go (y: int) = toMaybe (y <> 0, (y mod 10, y div 10)) in
  reverse (unfoldr (go, x)) end;

(* Helper function of #5 *)
fun go5 (x: int) = minori (fn (y, i) => toMaybe (y > 9, (sum (digits y), i + 1)), (x, 0));

(* #5-1 Digital Roots *)
fun digitalRoot (x: int) = #1(go5 x);

(* #5-2 Additive Persistence *)
fun additivePersistence (x: int) = #2(go5 x);