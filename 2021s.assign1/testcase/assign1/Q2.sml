Control.Print.out := {say=fn _=>(), flush=fn()=>()};

use "sol1.sml";

fun assert(result, expected) =
    if result = expected then true
    else false
    handle _ => false  (* This is exception handler.
                        * Exception is considered as test failure *)

val test = assert(reverse([]), []) andalso
           assert(reverse([1]), [1]) andalso
           assert(reverse([1,2]), [2,1]) andalso
           assert(reverse([1,2,9]), [9,2,1]) andalso
           assert(reverse([1,1,1,1]), [1,1,1,1]) andalso
           assert(reverse([0,1,2,9,10,11]), [11,10,9,2,1,0])
           handle _ => false

val _ = print(if test then "1" else "0");

val _ = OS.Process.exit(OS.Process.success);
