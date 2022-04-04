(*
Programming Language, 2022 Spring, Assignment 1
2018009025 이형욱 sol1.sml 과제제출
*)

(*공통함수*)
fun append(xs:int list, ys:int list) = 
    if null xs
    then ys
    else hd(xs)::append(tl(xs), ys)

fun sum_list (xs:int list) = 
    if null xs
    then 0
    else hd(xs) + sum_list(tl(xs))

(*#1 Merge List*)

fun merge(xs:int list, ys:int list) = 
    let
      val tale = 0
      val head = 1
      val ss = append(xs, ys)
      fun find_smallest(ts:int list, head_place:int, tale_place:int) =
      if null ts
      then []
      else
        if head_place+tale_place = List.length ts                 (*자리가 같다면(비교가 끝났다면)*)
        then 
            if (tale_place >= (List.length ts - 1))
            then 
                List.nth(ts, tale_place) :: find_smallest(append(List.take(ts, tale_place),[]), 1, 0) 
            else
                List.nth(ts, tale_place) :: find_smallest(append(List.take(ts, tale_place),List.drop(ts, tale_place+1)), 1, 0) (*비교를 다 끝냈다면, 가장 큰 값을 List에 더한다.*)
        else if (List.nth(ts,tale_place)<List.nth(ts,List.length(ts)-head_place))       (*비교가 끝난게 아니라면 계속 비교*)
             then find_smallest(ts, head_place+1, tale_place)      
             else find_smallest(ts, head_place, tale_place+1)                                                                                              
    in
      find_smallest(ss, head, tale)
    end

(*#2 Reverse List*)

fun reverse_help(x: int list, z: int list) = 
    if null(x) 
    then z
		else reverse_help(tl(x), hd(x)::z)

fun reverse(xs: int list) =
    if null xs
    then []
    else reverse_help(tl(xs), hd(xs)::[])

(*#3 Pi Function*)

fun f(x:int) =
    x

fun pi(a:int, b:int, f:int->int) =
    if a=b
    then f(b)
    else f(a)*pi(a+1, b, f)

(*#4 Digits Function*)
            
fun first_digit_size(x:int) =  (*몇의 자리 숫자인지 ex) 1345 => 1000*)
    if x<0
    then 0
    else 
        let
            fun counter(c:int) = 
                if x < (c*10)
                then c
                else counter(c*10)
        in
            counter(1)
        end

fun digits(x:int) = 
    if x < 10
    then [x]
    else if x<(first_digit_size(x)*10)  (*x의 자릿수 확인 x가 123일 때 x<1000(세자리숫자)*)
         then 
            let
                val digit_place = x div (first_digit_size(x)) (*digit_place: digit 의 자리*)
                val digit_num = x mod (first_digit_size(x))    (*digit_num: 나머지 숫자*)
            in
                digit_place :: digits(digit_num)  (*digit_place 를 리스트에 추가& digits(나머지숫자)로 recursion*)
            end
         else []

(*#5 Digital Roots and Additive Persistence*)

fun digitalR_additiveP(x:int) =
    if x<10
    then []
    else  
        let
            val sum = sum_list(digits(x))
        in
            append([sum], digitalR_additiveP(sum))
        end 

fun additivePersistence(x:int) =
    if x<0
    then 0
    else 
        let 
            val ap = List.length(digitalR_additiveP(x))
        in 
            ap
        end
        
fun digitalRoot(x:int) =
    if x<0
    then 0
    else
        let 
            val digital_root = List.length(digitalR_additiveP(x))
            val dR = List.nth(digitalR_additiveP(x), digital_root-1)
        in  
            dR
        end