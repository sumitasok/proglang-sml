fun month_day_max_limit (month : int) =
  if month = 4 orelse month = 6 orelse month = 9 orelse month = 11
  then 30
  else
    if month = 2
    then 28
    else 31

fun number_in_month (dates_list : ( int * int * int ) list, month : int) =
  if null dates_list
  then 0
  else
    if #3 (hd dates_list) > 0 andalso #3 (hd dates_list) < month_day_max_limit(month)
    then 1 + number_in_month(tl dates_list, month)
    else 0 + number_in_month(tl dates_list, month)


(* val number_in_month = fn : (int * int * int) list * int -> int *)
val month_day_max_limit = (31,28,31,30,31,30,31,31,30,31,30,31);

val num1 = number_in_month([(2013,09,10),(2013,09,41),(2013,09,51)], 1);
val num1 = number_in_month([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], 1);

val num1 = number_in_month([(2013,02,31),(2013,09,41),(2013,09,51),(2013,09,20)], 1);
