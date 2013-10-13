fun count(date_list : (int * int * int) list) = 
  if null date_list then 0 else 1 + count(tl date_list)

val count1 = count([(2013,07,13), (2014,05,02)]);

(*
  val count = fn : (int * int * int) list -> int
  val count1 = 2 : int
*)