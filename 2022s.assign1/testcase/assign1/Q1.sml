Control.Print.out := {say=fn _=>(), flush=fn()=>()};

use "sol1.sml";

fun assert(result, expected) =
    if result = expected then true
    else false
    handle _ => false  (* This is exception handler.
                        * Exception is considered as test failure *)

val test = assert(merge([],[]), []) andalso
           assert(merge([1],[]), [1]) andalso
           assert(merge([],[1]), [1]) andalso
           assert(merge([1],[2]), [1,2]) andalso
           assert(merge([1,3,4],[2]), [1,2,3,4]) andalso
           assert(merge([10,20,30],[11,21,31]),[10,11,20,21,30,31]) andalso
           assert(merge([100,101],[1,2]), [1,2,100,101]) andalso
           assert(merge([1,2],[100,101]), [1,2,100,101])
           handle _ => false

val _ = print(if test then "1" else "0");

val _ = OS.Process.exit(OS.Process.success);
