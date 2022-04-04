fun merge(xl : int list, yl : int list) =
    if null(xl) andalso null(yl)
    then []
    else if null (xl) 
    then yl
    else if null (yl)
    then xl
    else if hd(xl)>hd(yl) 
    then hd(yl) :: merge (xl,tl(yl))
    else hd(xl) :: merge (tl(xl),yl);

fun reverse(xs : int list)=
    let fun rev_help(al : int list, bs : int list)=
        if null(al)
        then []
        else rev_help(tl(al),bs)@(hd(al)::bs)
    in 
        rev_help(xs,[])
    end;

fun pi( a :int , b: int, f : int ->int)=
    if a>b
    then 1
    else f(a)*pi(a+1,b,f);


