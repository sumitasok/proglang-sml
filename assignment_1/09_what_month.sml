fun number_before_reaching_sum(sum : int, int_list : int list) = 
  if sum <= hd int_list
  then 0
  else 1 + number_before_reaching_sum(sum - (hd int_list), tl int_list)

fun what_month(day_of_year : int) =
  let
      val month_day_list = [31,28,31,30,31,30,31,31,30,31,30,31]
  in
      1 + number_before_reaching_sum(day_of_year, month_day_list)
  end

val month1 = what_month(27);
val month2 = what_month(47);
val month3 = what_month(127);

(*
  val number_before_reaching_sum = fn : int * int list -> int
  val what_month = fn : int -> int
  val month1 = 1 : int
  val month2 = 2 : int
  val month3 = 5 : int
*)