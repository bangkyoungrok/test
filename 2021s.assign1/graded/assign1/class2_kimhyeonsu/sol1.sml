fun merge (xs : int list, ys : int list) =
    case
        (xs, ys) 
    of
        ([], []) => []
        | ([], y::ys') => ys
        | (x::xs', []) => xs
        | (x::xs', y::ys') =>
            if
                x > y
            then
                y::merge(xs, ys')
            else
                x::merge(xs', ys)


fun reverse (xs : int list) = 
    let
        fun reverse_ (lst, ret) =
        case
            (lst, ret)
        of
            ([], ret) => ret
            | (f::lst', ret) => reverse_(lst', f::ret)
    in
        reverse_(xs, [])
    end


fun pi (a, b, f) =
    if
        a > b
    then
        1
    else
        if
            a = b
        then
            f(a)
        else
            f(a) * pi(a + 1, b, f)


fun digits (i) = 
    let
        fun digits (i, ret) =
            if
                i = 0
            then
                ret
            else
                digits(i div 10, (i mod 10)::ret)
    in
        digits(i, [])
    end


fun additivePersistence_ (i) =
    let
        fun sumList (lst) =
            case 
                lst 
            of
                [] => 0
                | f::lst' => f + sumList(lst')
    in
        if
            i < 10
        then
            (i, 0)
        else
            let
                val ret = additivePersistence_(sumList(digits(i)))
            in
                (#1 ret, #2 ret + 1)
            end
    end


fun additivePersistence (i) = 
    let
        val ret = additivePersistence_(i)
    in
        #2 ret
    end


fun digitalRoot (i) =
    let
        val ret = additivePersistence_(i)
    in
        #1 ret
    end
