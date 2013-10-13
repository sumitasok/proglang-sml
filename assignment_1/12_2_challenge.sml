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




val dates_in_months_challenge1 = dates_in_months_challenge([(2013,09,31),(2013,09,21),(2013,09,51)], [2,3]); (* val date_list1 = [(2013,9,10)] : (int * int * int) list *)
val dates_in_months_challenge2 = dates_in_months_challenge([(2013,09,10),(2013,02,41),(2013,02,51),(2013,09,20)], [1,2]); (* val date_list1 = [(2013,9,10),(2013,9,20)] : (int * int * int) list *)
val dates_in_months_challenge3 = dates_in_months_challenge([(2013,01,31),(2013,02,21),(2013,03,51),(2013,02,20)], [2,3]); (* val date_list1 = [(2013,9,21),(2013,9,20)] : (int * int * int) list *)
