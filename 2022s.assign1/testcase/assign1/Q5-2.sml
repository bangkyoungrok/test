Control.Print.out := {say=fn _=>(), flush=fn()=>()};

use "sol1.sml";

fun assert(result, expected) =
    if result = expected then true
    else false
    handle _ => false  (* This is exception handler.
                        * Exception is considered as test failure *)

val test = assert(digitalRoot(9876),3) andalso
           assert(digitalRoot(12349),1) andalso
           assert(digitalRoot(1234567),1) andalso
           assert(digitalRoot(2346789),3)
           handle _ => false

val _ = print(if test then "1" else "0");

val _ = OS.Process.exit(OS.Process.success);
