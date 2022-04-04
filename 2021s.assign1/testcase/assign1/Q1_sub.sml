Control.Print.out := {say=fn _=>(), flush=fn()=>()};

use "sol1.sml";

fun assert(result, expected) =
    if result = expected then true
    else false
    handle _ => false  (* This is exception handler.
                        * Exception is considered as test failure *)

val test = assert(merge([10,20,30],[10,15,25]),[10,10,15,20,25,30]) andalso
           assert(merge([1,2,4,9],[2,4,5,9,11,12]),
                  [1,2,2,4,4,5,9,9,11,12])
           handle _ => false

val _ = print(if test then "1" else "0");

val _ = OS.Process.exit(OS.Process.success);
