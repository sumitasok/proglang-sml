fun number_in_month (dates_list : ( int * int * int ) list, month : int) =
  if null dates_list
  then 0
  else
    if #2 (hd dates_list) = month
    then 1 + number_in_month(tl dates_list, month)
    else 0 + number_in_month(tl dates_list, month)

fun number_in_months (dates_list : ( int * int * int ) list, months : int list) =
  if null months
  then 0
  else number_in_month(dates_list, hd months) + number_in_months(dates_list, tl months)

(* val number_in_months = fn : (int * int * int) list * int list -> int *)

val num1 = number_in_months([(2013,09,10),(2013,09,41),(2013,09,51)], [1]); (* val num1 = 0 : int *)
val num1 = number_in_months([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], [9,2]); (* val num1 = 4 : int *)
val num1 = number_in_months([(2013,02,31),(2013,09,41),(2013,09,51),(2013,09,20)], [09,02]); (* val num1 = 4 : int *)
val num1 = number_in_months([(2013,02,31),(2013,09,41),(2013,09,51),(2013,07,20)], [09,02]); (* val num1 = 3 : int *)