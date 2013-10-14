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
  if null dates_list then [] else
    if #2 (hd dates_list) = month
    then (hd dates_list)::dates_in_month(tl dates_list, month)
    else dates_in_month(tl dates_list, month)

fun dates_in_months (dates_list : ( int * int * int ) list, months : int list) =
  let
    fun list_include (main_list : (int * int * int) list, item : (int * int * int)) =
      if null main_list then false else
        if #1 (hd main_list) = #1 item andalso #2 (hd main_list) = #2 item andalso #3 (hd main_list) = #3 item then true else list_include (tl main_list, item)

    fun remaining_list (list_set : (int * int * int ) list, list_sub_set : (int * int * int ) list) =
      if null list_set then [] else
        if list_include(list_sub_set, hd list_set) then remaining_list(tl list_set, list_sub_set) else (hd list_set)::remaining_list(tl list_set, list_sub_set)
  in
    if null months then []
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

fun number_in_months_challenge (dates_list : ( int * int * int ) list, months : int list) =
  let
    fun any(int_list : int list, search_int : int) =
      if null int_list then false else
        if search_int = hd int_list then true else any(tl int_list, search_int)

    fun remove_duplicate(int_list : int list) =
      if null int_list then [] else
        if any(tl int_list, hd int_list) then remove_duplicate(tl int_list) else (hd int_list)::remove_duplicate(tl int_list)

    fun collect_months (dates_list : (int * int * int) list) =
      if null dates_list then [] else #2 (hd dates_list)::collect_months(tl dates_list)

    fun included_in(main_list : int list, sub_list : int list) = 
      if null sub_list then [] else
        if any(main_list, hd sub_list) then (hd sub_list)::included_in(main_list, tl sub_list) else included_in(main_list, tl sub_list)
  in
    included_in(remove_duplicate(collect_months(dates_list)), months)
  end

fun dates_in_months_challenge (dates_list : ( int * int * int ) list, months : int list) =
  let
    fun any(int_list : (int * int * int) list, search_int : (int * int * int)) =
      if null int_list then false else
        if #2 search_int = #2 (hd int_list) then true else any(tl int_list, search_int)

    fun remove_duplicate(int_list : (int * int * int) list) =
      if null int_list then [] else
        if any(tl int_list, hd int_list) then remove_duplicate(tl int_list) else (hd int_list)::remove_duplicate(tl int_list)

    fun included_in(main_list : (int * int * int) list, sub_list : (int * int * int) list) = 
      if null sub_list then [] else
        if any(main_list, hd sub_list) then (hd sub_list)::included_in(main_list, tl sub_list) else included_in(main_list, tl sub_list)
  in
    remove_duplicate(dates_in_months(dates_list, months))
  end

fun reasonable_date(date : int * int * int) =
  let
    val year = #1 date
    val month = #2 date

    fun divisible_by(value : int, by : int) =
      if value >= by then divisible_by(value - by, by) else
        if value = 0 then true else false

    fun is_leap_year(year : int) = 
      if (divisible_by(year, 400) orelse divisible_by(year, 4) andalso (not(divisible_by(year, 100)))) then true else false

    fun month_day_max_limit (month : int) =
      if month = 4 orelse month = 6 orelse month = 9 orelse month = 11 then 30 else
        if month = 2 then 28 else 31

    fun valid_date_range (date : int * int * int) =
      if #2 date = 2 andalso is_leap_year(#1 date) andalso #3 date > 0 andalso #3 date < 30
      then true
      else #3 date > 0 andalso #3 date < (month_day_max_limit(#2 date) + 1)
  in
    if year <> 0 andalso month > 0 andalso month < 13 andalso valid_date_range(date) then true else false
  end