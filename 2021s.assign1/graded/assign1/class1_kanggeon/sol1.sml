fun merge (nil, List2) = List2
|   merge (List1, nil) = List1
|   merge (List1 as List1Head::List1Tail, List2 as List2Head::List2Tail) =
        if List1Head < List2Head
        then List1Head::merge(List1Tail, List2)
        else List2Head::merge(List1, List2Tail)

fun reverse (nil) = nil
|   reverse (List as ListHead::ListTail) = reverse(ListTail) @ [ListHead]

fun pi (a : int, b: int, f : (int -> int)) =
        if a = b
        then f(a)
        else f(a) * pi(a+1, b, f)

fun digits (number : int) =
        if number = 0
        then nil
        else reverse((number mod 10) :: reverse(digits(number div 10)))

fun sumList(nil) = 0
|   sumList(List as ListHead::ListTail) =
        ListHead + sumList(ListTail)

fun additivePersistence(number : int) =
        if number < 10
        then 0
        else 1 + additivePersistence(sumList(digits(number)))

fun digitalRoot(number) =
        if number < 10
        then number
        else digitalRoot(sumList(digits(number)))
