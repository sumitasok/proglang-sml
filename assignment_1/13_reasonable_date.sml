fun reasonable_date(date : int * int * int) =
  let
    val year = #1 date
    val month = #2 date
    fun is_leap_year(year : int) = 
      let
        val remain = year - 4
      in
        if remain = 4 then true else
          if remain > 4 then is_leap_year(remain) else false
      end

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

(*val is_leap_year1 = is_leap_year(3);
val is_leap_year2 = is_leap_year(203);
val is_leap_year3 = is_leap_year(2000);
val is_leap_year4 = is_leap_year(100);
val is_leap_year5 = is_leap_year(400);
val is_leap_year6 = is_leap_year(0);*)

val reasonable_date1 = reasonable_date(2013,02,29);
val reasonable_date2 = reasonable_date(2012,02,29);
val reasonable_date3 = reasonable_date(2013,03,15);
val reasonable_date4 = reasonable_date(0,02,29);
val reasonable_date5 = reasonable_date(2013,13,29);

(*
  val reasonable_date = fn : int * int * int -> bool
  val reasonable_date1 = false : bool
  val reasonable_date2 = true : bool
  val reasonable_date3 = true : bool
  val reasonable_date4 = false : bool
  val reasonable_date5 = false : bool
*)