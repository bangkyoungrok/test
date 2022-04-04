(*
        Assignment1
        2020070164 Faiq Thaqif
*)

(*merge*)
fun merge(arr1:int list, arr2:int list) =
  if null arr1
  then arr2
  else if null arr2
       then arr1
       else if hd(arr1) < hd(arr2)
            then hd(arr1) :: merge(tl(arr1), arr2)
            else hd(arr2) :: merge(arr1, tl(arr2))

(* reverse*)
fun reverse(arr:int list) =
  let
    fun reverse_help(arr1:int list, arr2:int list) =
      if null(tl(arr1))
      then hd(arr1) :: arr2
      else reverse_help(tl(arr1), hd(arr1)::arr2)
  in reverse_help(arr, [])
  end
	
(* pi *)
	
fun pi (a : int, b : int, f : int -> int) =
	if a > b then 0
	else if a = b then f(a)
	else f(a) + pi(a + 1, b, f);

(* digits *)

fun digits (x : int) =
	let
		fun digit_help(target: int, division: int) =
        		if target div division < 10
        		then if target < 10
             			then [target]
             			else target div division :: digit_help(target mod division, division div 10)
        		else digit_help(target, division*10) 
  	in
    	 digit_help(x, 10)
  	end

(* additivePersistence *)

fun additivePersistence (x : int) = 
        let
                fun calc_digitroot(x:int, sum:int) = (*sum = plus each digits*)
                        if (x div 10) = 0 (*when x is a single digit*)
                        then sum+x
                        else calc_digitroot((x div 10),sum+(x mod 10)) (* calc each digits*)

                fun count_digitroot(x:int, cnt:int) = (*cnt++ when we calc to find digitroot*)
                        if (x div 10) = 0 (* when each digits's sum is a single digit*)
                        then cnt (* return persistence *)
                        else count_digitroot(calc_digitroot(x,0),cnt+1) (* count persistence and re_calc digitalroot*)
        in
          count_digitroot(x,0)
        end	
(* digitalRoot *)

fun digitalRoot (x:int) =
        let
                fun calc_digitroot(x:int, sum:int) = (*sum = plus each digits*)
                        if (x div 10) = 0 (*when x is a single digit*)
                        then sum+x
                        else calc_digitroot((x div 10),sum+(x mod 10)) (* calc each digits*)

                fun find_digitroot(x:int) = 
                        if (x div 10) = 0 (* when each digits's sum is a single digit => digitalRoot*)
                        then x (* return single digit => digitalRoot *)
                        else find_digitroot(calc_digitroot(x,0)) (* if x is not a single digit, re_calc digitalroot*)
        in
                find_digitroot(x)
        end
