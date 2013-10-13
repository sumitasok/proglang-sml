fun dates_in_month (dates_list : ( int * int * int ) list, month : int) =
  if null dates_list then [] else
    if #2 (hd dates_list) = month
    then (hd dates_list)::dates_in_month(tl dates_list, month)
    else dates_in_month(tl dates_list, month)
(* val dates_in_month = fn : (int * int * int) list * int -> (int * int * int) list *)

val date_list1 = dates_in_month([(2013,09,10),(2013,02,41),(2013,09,51)], 2); (* val date_list1 = [(2013,9,10)] : (int * int * int) list *)
val date_list2 = dates_in_month([(2013,09,10),(2013,02,41),(2013,02,51),(2013,09,20)], 2); (* val date_list1 = [(2013,9,10),(2013,9,20)] : (int * int * int) list *)
val date_list3 = dates_in_month([(2013,02,31),(2013,09,21),(2013,09,51),(2013,09,20)], 3); (* val date_list1 = [(2013,9,21),(2013,9,20)] : (int * int * int) list *)

(*
  val dates_in_month = fn
    : (int * int * int) list * int -> (int * int * int) list
  val date_list1 = [(2013,2,41)] : (int * int * int) list
  val date_list2 = [(2013,2,41),(2013,2,51)] : (int * int * int) list
  val date_list3 = [] : (int * int * int) list
*)