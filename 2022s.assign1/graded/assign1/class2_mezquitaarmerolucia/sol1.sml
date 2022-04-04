(* PROBLEMS *)

(* 1. Merge	Lists (10pt)*)

fun merge (xs, nil) = xs
	|	merge (nil,  ys) = ys
	|	merge (x :: xs, y :: ys) =
			if (x < y)
			then x :: merge (xs, y :: ys)
			else y :: merge(x :: xs, ys);


(* merge ([1,4,5],[2,6,7]); *)


(* 2. Reverse	List (10pt) *)

fun reversebackwards(nil) = (nil)
	|	reversebackwards(y :: ys) =
		reversebackwards(ys) @ [y];


(* 3. Pi Function (10pt) *)

(*4. Digits	Function (10pt) *)

(* 5. Digital	Roots	and	Additive	Persistence ()*)