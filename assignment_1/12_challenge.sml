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


val number_in_months_challenge1 = number_in_months_challenge([(2013,09,10),(2013,09,41),(2013,09,51)], [1]); (* val number_in_months_challenge1 = 0 : int *)
val number_in_months_challenge2 = number_in_months_challenge([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], [9,2]); (* val number_in_months_challenge1 = 4 : int *)
val number_in_months_challenge3 = number_in_months_challenge([(2013,02,31),(2013,09,41),(2013,09,51),(2013,09,20)], [09,02]); (* val number_in_months_challenge1 = 4 : int *)
val number_in_months_challenge4 = number_in_months_challenge([(2013,02,31),(2013,09,41),(2013,09,51),(2013,07,20)], [09,02]); (* val number_in_months_challenge1 = 3 : int *)


(*
  val number_in_months_challenge = fn
    : (int * int * int) list * int list -> int list
  val number_in_months_challenge1 = [] : int list
  val number_in_months_challenge2 = [9] : int list
  val number_in_months_challenge3 = [9,2] : int list
  val number_in_months_challenge4 = [9,2] : int list
*)