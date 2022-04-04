Control.Print.out := {say=fn _=>(), flush=fn()=>()};

use "sol1.sml";

fun assert(result, expected) =
    if result = expected then true
    else false
    handle _ => false  (* This is exception handler.
                        * Exception is considered as test failure *)

fun test3_temp1 (x:int) =
  0
fun test3_temp2 (x:int) =
  2*x
fun test3_temp3 (x:int) =
  x*x
fun test3_temp4 (x:int) =
  x mod 5
val test = assert(pi(1,1,test3_temp1),0) andalso
           assert(pi(1,10,test3_temp1),0) andalso
           assert(pi(1,10,test3_temp2),3715891200) andalso
           assert(pi(1,8,test3_temp3),1625702400) andalso
           assert(pi(1,100,test3_temp4),0) andalso
           assert(pi(1,0,test3_temp3),1) andalso
           assert(pi(10,4,test3_temp2),1)
           handle _ => false

val _ = print(if test then "1" else "0");

val _ = OS.Process.exit(OS.Process.success);