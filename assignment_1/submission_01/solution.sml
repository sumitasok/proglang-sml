fun is_older (date1 : int * int * int, date2 : int * int * int ) =
  if #1 date1 > #1 date2 then false else
    if #1 date1 < #1 date2 then true else
      if #2 date2 > #2 date1 then true else
        if #2 date2 < #2 date1 then false else
          if #3 date1 < #3 date2 then true else false

fun number_in_month (dates_list : ( int * int * int ) list, month : int) =
  if null dates_list then 0 else
    if #2 (hd dates_list) = month then 1 + number_in_month(tl dates_list, month) else 0 + number_in_month(tl dates_list, month)

fun number_in_months (dates_list : ( int * int * int ) list, months : int list) =
  if null months then 0 else number_in_month(dates_list, hd months) + number_in_months(dates_list, tl months)

fun dates_in_month (dates_list : ( int * int * int ) list, month : int) =
  let
    fun month_day_max_limit (month : int) =
      if month = 4 orelse month = 6 orelse month = 9 orelse month = 11 then 30 else
        if month = 2 then 28 else 31
  in
    if null dates_list then [] else
      if #3 (hd dates_list) > 0 andalso #3 (hd dates_list) < month_day_max_limit(month)
      then (hd dates_list)::dates_in_month(tl dates_list, month)
      else dates_in_month(tl dates_list, month)
  end

fun dates_in_months (dates_list : ( int * int * int ) list, months : int list) =
  let
    fun month_day_max_limit (month : int) =
      if month = 4 orelse month = 6 orelse month = 9 orelse month = 11 then 30 else
        if month = 2 then 28 else 31

    fun list_include (main_list : (int * int * int) list, item : (int * int * int)) =
      if null main_list then false else
        if #1 (hd main_list) = #1 item andalso #2 (hd main_list) = #2 item andalso #3 (hd main_list) = #3 item then true else list_include (tl main_list, item)

    fun remaining_list (list_set : (int * int * int ) list, list_sub_set : (int * int * int ) list) =
      if null list_set then [] else
        if list_include(list_sub_set, hd list_set) then remaining_list(tl list_set, list_sub_set) else (hd list_set)::remaining_list(tl list_set, list_sub_set)
  in
    if null months
    then []
    else dates_in_month(dates_list, hd months) @ dates_in_months(remaining_list(dates_list, dates_in_month(dates_list, hd months)), tl months)
  end

fun get_nth (str_list : string list, n : int) =
  if n = 1 then hd(str_list) else get_nth(tl str_list, n - 1)

fun date_to_string (date : int * int * int) =
  let
    val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  in
    get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
  end

fun number_before_reaching_sum(sum : int, int_list : int list) = 
  if sum <= hd int_list then 0 else 1 + number_before_reaching_sum(sum - (hd int_list), tl int_list)

fun what_month(day_of_year : int) =
  let
      val month_day_list = [31,28,31,30,31,30,31,31,30,31,30,31]
  in
      1 + number_before_reaching_sum(day_of_year, month_day_list)
  end

fun month_range (day_of_year1 : int, day_of_year2 : int) =
  if day_of_year1 > day_of_year2 then [] else
    what_month(day_of_year1)::month_range(day_of_year1 + 1, day_of_year2)

fun oldest(date_list : (int * int * int) list) =
  if null date_list then NONE else
    let
      fun oldest_nonempty (date_list : (int * int * int) list) =
        if null (tl date_list) then hd date_list else
          let val tl_date_list = oldest_nonempty(tl date_list)
          in
            if is_older(hd date_list, tl_date_list) then hd date_list else tl_date_list
          end
    in
      SOME (oldest_nonempty date_list)
    end


(*
  Tests
*)

val test_1 = is_older((2013,03,02),(2012,03,03)); (* date1 year later to date2 year val test_1 = false : bool *)
val test_2 = is_older((2012,03,02),(2013,03,03)); (* date1 year before date2 year val test_1 = true : bool *)
val test_2 = is_older((2012,02,02),(2012,02,02)); (* date1 year before date2 year val test_1 = false : bool *)
val test_2 = is_older((2012,03,02),(2012,02,02)); (* date1 year before date2 year val test_1 = false : bool *)
val test_2 = is_older((2012,02,02),(2012,03,02)); (* date1 year before date2 year val test_1 = true : bool *)
val test_2 = is_older((2012,02,03),(2012,02,02)); (* date1 year before date2 year val test_1 = false : bool *)
val test_2 = is_older((2012,02,02),(2012,02,04)); (* date1 year before date2 year val test_1 = true : bool *)


val num1 = number_in_month([(2013,09,10),(2013,09,41),(2013,09,51)], 1); (* val num1 = 0 : int *)
val num1 = number_in_month([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], 9); (* val num1 = 4 : int *)
val num1 = number_in_month([(2013,02,31),(2013,09,41),(2013,09,51),(2013,09,20)], 02); (* val num1 = 1 : int *)

val num1 = number_in_months([(2013,09,10),(2013,09,41),(2013,09,51)], [1]); (* val num1 = 0 : int *)
val num1 = number_in_months([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], [9,2]); (* val num1 = 4 : int *)
val num1 = number_in_months([(2013,02,31),(2013,09,41),(2013,09,51),(2013,09,20)], [09,02]); (* val num1 = 4 : int *)
val num1 = number_in_months([(2013,02,31),(2013,09,41),(2013,09,51),(2013,07,20)], [09,02]); (* val num1 = 3 : int *)

val date_list1 = dates_in_month([(2013,09,10),(2013,09,41),(2013,09,51)], 1); (* val date_list1 = [(2013,9,10)] : (int * int * int) list *)
val date_list2 = dates_in_month([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], 1); (* val date_list1 = [(2013,9,10),(2013,9,20)] : (int * int * int) list *)
val date_list3 = dates_in_month([(2013,02,31),(2013,09,21),(2013,09,51),(2013,09,20)], 2); (* val date_list1 = [(2013,9,21),(2013,9,20)] : (int * int * int) list *)


val date_list1 = dates_in_months([(2013,09,31),(2013,09,21),(2013,09,51)], [2,3]); (* val date_list1 = [(2013,9,10)] : (int * int * int) list *)
val date_list2 = dates_in_months([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], [1,2]); (* val date_list1 = [(2013,9,10),(2013,9,20)] : (int * int * int) list *)
val date_list3 = dates_in_months([(2013,02,31),(2013,09,21),(2013,09,51),(2013,09,20)], [2,3]); (* val date_list1 = [(2013,9,21),(2013,9,20)] : (int * int * int) list *)

val get_nth1 = get_nth(["asd", "wer", "xcv", "ase"], 3);

val date1 = date_to_string(2013, 02, 02);
val date2 = date_to_string(2014, 02, 12);
val date3 = date_to_string(2012, 03, 24);

val number_before_reaching_sum1 = number_before_reaching_sum(7, [1,2,3,4,5,6,7])
val number_before_reaching_sum2 = number_before_reaching_sum(15, [1,2,3,4,5,6,7])
val number_before_reaching_sum3 = number_before_reaching_sum(25, [1,2,3,4,5,6,27])

val month1 = what_month(27);
val month2 = what_month(47);
val month3 = what_month(127);

val month_range1 = month_range(25,27);
val month_range2 = month_range(25,26);
val month_range3 = month_range(25,12);
val month_range3 = month_range(25,33);

val oldest1 = oldest([(2013,09,10),(2013,09,11),(2013,09,21)]);
val oldest2 = oldest([(2013,09,10),(2012,09,11),(2013,09,21)]);
val oldest3 = oldest([(2013,09,10),(2012,09,11),(2011,09,21)]);
val oldest5 = oldest([]);
