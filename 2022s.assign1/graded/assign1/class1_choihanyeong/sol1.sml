(*
    Programming Language, 2022 Spring, Assignment 1
    Due: March 20 Sun, 11:59 pm
    student number : 2017030428
    student name : hanyoung choi
*)

fun merge (list1:int list, list2:int list) = (* 편의를 위해, 두 리스트의 이름을 리스트1, 리스트2로 정했다. *)
    if null list1 andalso null list2 (* 둘다 빈 리스트라면 *)
    then [] (* 빈 리스트를 반환한다. *)
    else
        if null (list1) andalso not (null list2) (* 리스트1 만 빈 리스트라면 *)
        then list2 (* 리스트2를 그대로 반환한다. *)
        else
            if null (list2) andalso not (null list1) (* 리스트2 만 빈 리스트라면 *)
            then list1 (* 리스트1을 그대로 반환한다. *)
            else (* 두 리스트 모두 데이터가 존재할 때 *)
                let
                    val hd1 = hd list1 (* 각 리스트의 제일 앞 데이터를 추출한다. *)
                    val hd2 = hd list2 (* 각 리스트의 제일 앞 데이터를 추출한다. *)
                in
                    if hd1 < hd2 (* 각 두 리스트의 제일 앞 데이터 중 더 작은 값을 결과 리스트에 넣는다. *)
                    then hd1::merge(tl list1, list2) (* 재귀적 호출 *)
                    else hd2::merge(list1, tl list2) (* 재귀적 호출 *)
                end

fun reverse (inputList: int list) =
    if not (null inputList)
    then
        let
            fun custom_reverse(originList: int list, resultList: int list) = (* 실제 동작을 할 함수를 구현한다. 두번째 인자는 결과가 담길 리스트이다. *)
                if not (null originList)
                then custom_reverse(tl originList, hd originList::resultList) (* 원래 리스트의 제일 앞에있던 원소를 새로 만든 리스트의 앞쪽에다 붙인다. 그러면 역순으로 쌓인다. *)
                else resultList
        in
            custom_reverse(inputList, [])
        end
    else [] (* 인풋 리스트가 비어있다면 그냥 빈 리스트 반환 *)

fun sigma (a: int, b: int, f: int->int) =
   if a <= b
   then f(a) * sigma(a + 1, b, f) (* 현재 변수의 함수 결과값 x (나머지 결과) *)
   else 1

fun digits (originNum: int) =
    if originNum <> 0
    then
        let
            fun split(num: int, resultList: int list) = (* num은 현재 남은 수이고, resultList는 자리수가 하나씩 채워지는 리스트이다. *)
                if num <> 0
                then split((num div 10), (num mod 10)::resultList) (* 남게되는 수는 제일 작은 자리수만 제외한 것이므로, 10으로 나눈 값을 넣어주고, 배열에는 그 수(10으로 나눈 나머지)를 넣어준다. *)
                else resultList
        in
            split(originNum,[])
        end
    else [] (* 0이면 할 것이 없다. *)

fun additivePersistence (originNum: int) =
    let
        fun next(num: int, sum: int) =  (* digitalRoot 가 아닌 수일 때, 그 다음 타겟 넘버를 찾는 함수이다. *)
            if num >= 10
            then next((num div 10), sum + (num mod 10))  (* 한자리씩 sum에 추가하면서 total 합을 구한다. *)
            else sum + num

        fun count(num: int, cnt: int) = (* 변환된 횟수를 구하는 함수이다. *)
            if num >= 10
            then count(next(num, 0), cnt + 1) (* 아직 최종값이 아닌 경우 다음 수로 먼저 변환 후 그 수를 대상으로 재귀를 호출해야 한다. *)
            else cnt
    in
        count(originNum, 0)
    end

fun digitalRoot (originNum: int) =
    let
        fun next(num: int, sum: int) =  (* digitalRoot 가 아닌 수일 때, 그 다음 타겟 넘버를 찾는 함수이다. *)
            if num >= 10
            then next((num div 10), sum + (num mod 10)) (* 한자리씩 sum에 추가하면서 total 합을 구한다. *)
            else sum + num

        fun find(num: int) = (* 목표값을 찾는 함수이다. *)
            if num >= 10
            then find(next(num, 0)) (* 먼저 변환된 다음 수를 구한 다음, 그 수를 인자로 삼아 다시 재귀를 호출해야 한다. *)
            else num
    in
        find(originNum)
    end

(*test
val test1 = merge([7, 8, 9], [3, 4, 5])
val test2 = reverse([1, 7, 2, 4, 5, 1])
val test3 = sigma(1, 1, fn para => para + para)
val test4 = digits(1800)
val test5 = additivePersistence(12321)
val test6 = digitalRoot(12123)
test*)