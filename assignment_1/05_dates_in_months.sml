fun month_day_max_limit (month : int) =
  if month = 4 orelse month = 6 orelse month = 9 orelse month = 11
  then 30
  else
    if month = 2
    then 28
    else 31

  

fun dates_in_month (dates_list : ( int * int * int ) list, month : int) =
  if null dates_list
  then []
  else
    if #3 (hd dates_list) > 0 andalso #3 (hd dates_list) < month_day_max_limit(month)
    then (hd dates_list)::dates_in_month(tl dates_list, month)
    else dates_in_month(tl dates_list, month)

fun dates_in_months (dates_list : ( int * int * int ) list, months : int list) =
  if null months
  then []
  else dates_in_month(dates_list, hd months) @ dates_in_months(dates_list, tl months)

(*val dates_in_months = fn : (int * int * int) list * int list -> (int * int * int) list*)

val date_list1 = dates_in_months([(2013,09,31),(2013,09,21),(2013,09,51)], [2,3]); (* val date_list1 = [(2013,9,10)] : (int * int * int) list *)
val date_list2 = dates_in_months([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], [1,2]); (* val date_list1 = [(2013,9,10),(2013,9,20)] : (int * int * int) list *)
val date_list3 = dates_in_months([(2013,02,31),(2013,09,21),(2013,09,51),(2013,09,20)], [2,3]); (* val date_list1 = [(2013,9,21),(2013,9,20)] : (int * int * int) list *)


(*
  val month_day_max_limit = fn : int -> int
  val dates_in_month = fn
    : (int * int * int) list * int -> (int * int * int) list
  val dates_in_months = fn
    : (int * int * int) list * int list -> (int * int * int) list
  val date_list1 = [(2013,9,21),(2013,9,21)] : (int * int * int) list
  val date_list2 = [(2013,9,10),(2013,9,20),(2013,9,10),(2013,9,20)]
    : (int * int * int) list
  val date_list3 = [(2013,9,21),(2013,9,20),(2013,9,21),(2013,9,20)]
    : (int * int * int) list
*)