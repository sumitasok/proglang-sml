fun oldest(date_list : (int * int * int) list) =
  if null date_list
  then NONE
  else
    let
      fun is_older(date1 : int * int * int, date2 : int * int * int) =
        if #1 date1 < #1 date2 then true else 
          if #1 date1 > #1 date2 then false else
            if #2 date1 < #2 date2 then true else 
              if #2 date1 > #2 date2 then false else
                if #3 date1 < #3 date2 then true else 
                  false
      fun oldest_nonempty (date_list : (int * int * int) list) =
        if null (tl date_list)
        then hd date_list
        else
          let val tl_date_list = oldest_nonempty(tl date_list)
          in
            if is_older(hd date_list, tl_date_list)
            then hd date_list
            else tl_date_list
          end
    in
      SOME (oldest_nonempty date_list)
    end



(*if #3hd date_list < hd (tl date_list) then oldest(tl date_list) else oldest((hd date_list)::(tl (tl date_list)))*)




val oldest1 = oldest([(2013,09,10),(2013,09,11),(2013,09,21)]);
val oldest2 = oldest([(2013,09,10),(2012,09,11),(2013,09,21)]);
val oldest3 = oldest([(2013,09,10),(2012,09,11),(2011,09,21)]);


(*
  val oldest = fn : (int * int * int) list -> (int * int * int) option
  val oldest1 = SOME (2013,9,10) : (int * int * int) option
  val oldest2 = SOME (2012,9,11) : (int * int * int) option
  val oldest3 = SOME (2011,9,21) : (int * int * int) option
*)