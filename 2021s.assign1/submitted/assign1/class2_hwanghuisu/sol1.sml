(* 2016025069 Hwang Hui-su*)

fun merge(x : int list, y : int list) =
  if null x
  then y
  else if null y
  then x
  else if hd(x) < hd(y)
  then hd(x) :: merge(tl(x),y)
  else hd(y) :: merge(x,tl(y))
(* merge two list : [1,4,5],[2,6,7]->[1,2,4,5,6,7]*)

fun reverse(x : int list) = 
  let
    fun nontail_list(temp : int list) = (*acquire list except tail*)
      if null (tl(temp))
      then []
      else hd(temp)::nontail_list(tl(temp))
    fun tail_value(temp_2 : int list) = (*acquire tail value in list*)
      if null (tl(temp_2))
      then hd(temp_2)
      else tail_value(tl(temp_2))
  in
    if null (tl(x))
    then hd(x)::[]
    else tail_value(x)::reverse(nontail_list(x))
  end
(* reverse list : [1,5,4] -> [4,5,1]*)

fun pi(x : int, y : int, f : int->int) =
  if x<=y
  then f(x)*pi(x+1,y,f)
  else 1
(* pi function : (a,b,f)-> f(a)f(a+1).....f(b) *)


fun digits(x : int) =
  let
    fun digits_set(num : int) = (* get number like 10^y > x*)
      if num*10 > x
      then num
      else digits_set(num*10)
    fun digits_cal(ten_number : int) = 
      if ten_number < 10
      then x mod 10::[]
      else x div ten_number mod 10::digits_cal(ten_number div 10)
  in
    digits_cal(digits_set(1))
  end
(* digits : (253)-> [2,5,3]*)

fun additivePersistence(x : int) =
  let
    fun sum_list(number_list : int list) =
      if null number_list
      then 0
      else hd(number_list) + sum_list(tl(number_list))
    fun cal_sum_digit(number_1 : int) = 
      sum_list(digits(number_1))
    fun real_work(number_2 : int, ans : int) = (* get value using sum of digits list *)
      if number_2 < 10
      then ans
      else real_work(cal_sum_digit(number_2),ans+1)
  in
    real_work(x,0)
  end
(* additivePersistence : (9876)->2 *)

fun digitalRoot(x : int) =
  let
    fun sum_list(number_list : int list) =
      if null number_list
      then 0
      else hd(number_list) + sum_list(tl(number_list))
    fun cal_sum_digit(number_1 : int) =
      sum_list(digits(number_1))
    fun real_work(number_2 : int) = (* get value using sum of digits list *)
      if number_2 < 10
      then number_2
      else real_work(cal_sum_digit(number_2))
  in
    real_work(x)
  end
(* digitalRoot : (12349)->1 *)

