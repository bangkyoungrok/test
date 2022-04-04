(*problem 1*)
fun merge (inputlist1 : int list, inputlist2 : int list):int list=
    if null(inputlist1)
    then if null(inputlist2)
        then []
        else inputlist2
    else if null(inputlist2)
        then inputlist1
        else if hd (inputlist1) < hd (inputlist2) 
            then hd (inputlist1)::merge(tl (inputlist1),inputlist2)         
            else hd (inputlist2)::merge(inputlist1,tl (inputlist2));

(*additional function for problem 2*)
fun lastlist (inputlist : int list):int list=
    if null(inputlist)
    then []
    else if tl(inputlist)=[]
        then (inputlist)
        else lastlist(tl inputlist);

(*additional function for problem 2*)
fun cutlastlist (inputlist : int list):int list=
    if null(inputlist)
    then []
    else if tl(inputlist)=[]
        then (inputlist)
        else if length inputlist = 2
            then [hd inputlist]
            else hd inputlist :: cutlastlist(tl inputlist); 

(*problem 2*)
fun reverse (inputlist : int list):int list =
    if null(inputlist)
    then []
    else if tl(inputlist) =[]
        then inputlist
        else hd(lastlist(inputlist)) :: reverse(cutlastlist(inputlist));


(*problem 3*)
fun pi (startnum : int, endnum : int,funcx : int->int):int=
    if startnum > endnum
    then 1
    else if startnum = endnum
        then funcx(endnum)
        else funcx(startnum)* pi(startnum+1,endnum,funcx);

(*additional function for problem 4*)
fun mod_10_list(a : int):int list= 
            if (a div 10) = 0
            then [a]
            else (a mod 10) :: mod_10_list(a div 10);

(*problem 4*)
fun digits (input : int):int list=
    let val x = mod_10_list(input)
    in
        reverse(x)
    end;

(*additional function for problem 5*)
fun sumList(inputlist : int list): int=
    if null(inputlist)
    then 0
    else hd(inputlist) + sumList(tl inputlist);

(*problem 5(1)*)
fun additivePersistence (input : int):int=
    let val count = 0
        fun recurSum (input3 : int,c : int) : int=
            if input3 <10
            then c
            else recurSum(sumList(digits(input3)),c+1)
    in
        recurSum(input,count)
    end;    

(*problem 5(2)*)
fun digitalRoot (input : int):int=
    if input <10
    then input
    else digitalRoot(sumList(digits(input)));