Control.Print.out := {say=fn _=>(), flush=fn()=>()};

use "sol1.sml";

fun assert(result, expected) =
    if result = expected then true
    else false
    handle _ => false  (* This is exception handler.
                        * Exception is considered as test failure *)

val test = assert(digits(253),[2,5,3]) andalso
           assert(digits(1234567),[1,2,3,4,5,6,7]) andalso
           assert(digits(2346789),[2,3,4,6,7,8,9])
           handle _ => false

val _ = print(if test then "1" else "0");

val _ = OS.Process.exit(OS.Process.success);
