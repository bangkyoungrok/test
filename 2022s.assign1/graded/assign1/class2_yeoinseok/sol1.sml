fun merge ( list1 : int list, list2 : int list) =
    if null list1
    then list2
    else if null list2
    then list1
    else if hd list1<hd list2
    then hd list1::merge(tl list1,list2)
    else hd list2::merge(list1,tl list2);


fun reverse( list3 : int list) =
    let val newlist = []
        fun temp( oldlist : int list, newlist : int list) =
            if null oldlist
            then newlist
            else temp(tl oldlist, hd oldlist::newlist);
    in temp(list3,newlist)
    end;

fun pi( a: int, b: int, funx:int->int)=
    if a>b
    then 0
    else funx(a)+pi(a+1,b,funx);

fun digits( numb:int)=
    let val digitlist = []
        fun digittemp(number:int,dlist:int list)=
            if number<1
            then dlist
            else digittemp(number div 10, number mod 10::dlist);
    in digittemp(numb,digitlist)
    end;



fun adddigit_list(dlist:int list,numb:int)=
    let fun adddigit(numb:int,total:int)=
        if numb<1
        then total
        else adddigit(numb div 10, total+ numb mod 10); 
    in
    if numb<10
    then dlist
    else 
        let val result = adddigit(numb,0)
        in adddigit_list(result::dlist,result)
        end
    end;

fun countlist(thelist:int list,result:int) =
    if null thelist
    then result
    else countlist(tl thelist,result+1);

fun additivePersistence(num:int) =
    let val resultlist = adddigit_list([],num)
    in countlist(resultlist,0)
    end;

fun digitalRoot(num:int)=
    let val resultlist = adddigit_list([],num)
    in hd resultlist
    end;
