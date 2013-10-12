fun list_include (main_list : (int * int * int) list, item : (int * int * int)) =
  if null main_list then false else
    if #1 (hd main_list) = #1 item andalso #2 (hd main_list) = #2 item andalso #3 (hd main_list) = #3 item then true else list_include (tl main_list, item)

fun remaining_list (list_set : (int * int * int ) list, list_sub_set : (int * int * int ) list) =
  if null list_set
  then []
  else
    if list_include(list_sub_set, hd list_set) then remaining_list(tl list_set, list_sub_set) else (hd list_set)::remaining_list(tl list_set, list_sub_set)

val remaining_list1 : (int * int * int) list = remaining_list([(2013,02,01),(2014,01,03),(2013,02,04),(2014,01,13)],[(2014,01,03),(2014,01,13)])


(*
  val list_include = fn : (int * int * int) list * (int * int * int) -> bool
  val remaining_list = fn
    : (int * int * int) list * (int * int * int) list -> (int * int * int) list
  val remaining_list1 = [(2013,2,1),(2013,2,4)] : (int * int * int) list
*)