(* PAIR *)

val pair_a = (1,2);
(* val pair_a = (1,2) : int * int *)

val pair_b = (2, "sumit");
(* val pair_b = (2, "sumit") : int * string *)

#1 pair_b;
(* val it = 2 : int *)
#2 pair_b;
(* val it = "sumit" : string *)

val sum_ab = #1 pair_a + #1 pair_b;
(* val sum_ab = 3 : int *)


(* TUPLE *)

val tuple_a = (1,"sumit", true);                    (* val tuple_a = (1,"sumit",true) : int * string * bool *)

#3 tuple_a;                                         (* val it = true : bool *)

val x4 = ((1,2),(2,3),(3,4));                       (* val x4 = ((1,2),(2,3),(3,4)) : (int * int) * (int * int) * (int * int) *)

#2 ((1,2),(2,3));                                   (* val it = (2,3) : int * int *)