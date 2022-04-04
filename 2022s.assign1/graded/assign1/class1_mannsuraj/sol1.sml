fun merge (l1: int list, l2: int list) =
    (* merge two sorted lists *)
    if null l1
    then l2
    else hd (l1) :: merge (tl(l1), l2);

fun reverse ([]: int list ) = [] : int list
    | reverse (x::xs) = reverse xs @ [x];

fun convert1 (a : int) = 
 	Int.toString a;

fun convert2 ( a : int) = 
 	explode ( convert1(a) );

fun digits ( a : int ) = 
 	let val x : char list = convert2(a)
 	in
 		let val SOME x1 = Int.fromString ( Char.toString ( hd x ) )
 		in
 			x1 :: []
 		end
 	end;