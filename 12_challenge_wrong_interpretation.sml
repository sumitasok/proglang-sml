fun number_in_months_challenge (dates_list : ( int * int * int ) list, months : int list) =
  let
    fun is_of_month (date : int * int * int, month : int) =
      if #2 date = month then true else false

    fun count(date_list : (int * int * int) list) = 
      if null date_list then 0 else 1 + count(tl date_list)

    fun minus (final_list : ( int * int * int ) list, actual_dates_list : ( int * int * int ) list) =
      count(final_list)

    fun iterate_over_month (dates_list : ( int * int * int ) list, month : int) =
      if null dates_list
      then []
      else
        if is_of_month (hd dates_list, month)
        then iterate_over_month(tl dates_list, month)
        else (hd dates_list)::iterate_over_month(tl dates_list, month)

    fun iterate_over_months (dates_list : ( int * int * int ) list, months : int list) =
      let
        val dates_remaining = iterate_over_month(dates_list, hd months)
      in
        if null (tl months)
        then dates_remaining
        else iterate_over_months (dates_remaining, tl months)
      end

    val final_list = iterate_over_months(dates_list, months)
  in
    minus(final_list, dates_list)
  end

val num1 = number_in_months_challenge([(2013,09,10),(2013,09,41),(2013,09,51)], [1]); (* val num1 = 0 : int *)
val num1 = number_in_months_challenge([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], [9,2]); (* val num1 = 4 : int *)
val num1 = number_in_months_challenge([(2013,02,31),(2013,09,41),(2013,09,51),(2013,09,20)], [09,02]); (* val num1 = 4 : int *)
val num1 = number_in_months_challenge([(2013,02,31),(2013,09,41),(2013,09,51),(2013,07,20)], [09,02]); (* val num1 = 3 : int *)
