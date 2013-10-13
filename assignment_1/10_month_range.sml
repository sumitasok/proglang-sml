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

fun month_range (day_of_year1 : int, day_of_year2 : int) =
  if day_of_year1 > day_of_year2 then [] else
    what_month(day_of_year1)::month_range(day_of_year1 + 1, day_of_year2)

val month_range1 = month_range(25,27);
val month_range2 = month_range(25,26);
val month_range3 = month_range(25,12);
val month_range3 = month_range(25,33);

(*
  val number_before_reaching_sum = fn : int * int list -> int
  val what_month = fn : int -> int
  val month_range = fn : int * int -> int list
  val month_range1 = [1,1,1] : int list
  val month_range2 = [1,1] : int list
  val month_range3 = [] : int list
  val month_range3 = [1,1,1,1,1,1,1,2,2] : int list
*)