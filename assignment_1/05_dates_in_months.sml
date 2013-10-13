fun month_day_max_limit (month : int) =
  if month = 4 orelse month = 6 orelse month = 9 orelse month = 11
  then 30
  else
    if month = 2
    then 28
    else 31

fun list_include (main_list : (int * int * int) list, item : (int * int * int)) =
  if null main_list then false else
    if #1 (hd main_list) = #1 item andalso #2 (hd main_list) = #2 item andalso #3 (hd main_list) = #3 item then true else list_include (tl main_list, item)

fun remaining_list (list_set : (int * int * int ) list, list_sub_set : (int * int * int ) list) =
  if null list_set
  then []
  else
    if list_include(list_sub_set, hd list_set) then remaining_list(tl list_set, list_sub_set) else (hd list_set)::remaining_list(tl list_set, list_sub_set)

fun dates_in_month (dates_list : ( int * int * int ) list, month : int) =
  if null dates_list then [] else
    if #2 (hd dates_list) = month
    then (hd dates_list)::dates_in_month(tl dates_list, month)
    else dates_in_month(tl dates_list, month)

fun dates_in_months (dates_list : ( int * int * int ) list, months : int list) =
  if null months
  then []
  else dates_in_month(dates_list, hd months) @ dates_in_months(remaining_list(dates_list, dates_in_month(dates_list, hd months)), tl months)

(*val dates_in_months = fn : (int * int * int) list * int list -> (int * int * int) list*)

val date_list1 = dates_in_months([(2013,09,31),(2013,09,21),(2013,09,51)], [2,3]); (* val date_list1 = [(2013,9,10)] : (int * int * int) list *)
val date_list2 = dates_in_months([(2013,09,10),(2013,02,41),(2013,02,51),(2013,02,20)], [1,2]); (* val date_list1 = [(2013,9,10),(2013,9,20)] : (int * int * int) list *)
val date_list3 = dates_in_months([(2013,02,31),(2013,09,21),(2013,09,51),(2013,03,20)], [2,3]); (* val date_list1 = [(2013,9,21),(2013,9,20)] : (int * int * int) list *)


(*
  val month_day_max_limit = fn : int -> int
  val list_include = fn : (int * int * int) list * (int * int * int) -> bool
  val remaining_list = fn
    : (int * int * int) list * (int * int * int) list -> (int * int * int) list
  val dates_in_month = fn
    : (int * int * int) list * int -> (int * int * int) list
  val dates_in_months = fn
    : (int * int * int) list * int list -> (int * int * int) list
  val date_list1 = [] : (int * int * int) list
  val date_list2 = [(2013,2,41),(2013,2,51),(2013,2,20)]
    : (int * int * int) list
  val date_list3 = [(2013,2,31),(2013,3,20)] : (int * int * int) list
*)