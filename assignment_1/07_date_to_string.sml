fun get_nth (str_list : string list, n : int) =
  if n = 1
  then hd(str_list)
  else get_nth(tl str_list, n - 1)

val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

fun date_to_string (date : int * int * int) =
  get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)

val date1 = date_to_string(2013, 02, 02);
val date2 = date_to_string(2014, 02, 12);
val date3 = date_to_string(2012, 03, 24);

(*
  val date_to_string = fn : int * int * int -> string
  val date1 = "February 2, 2013" : string
  val date2 = "February 12, 2014" : string
  val date3 = "March 24, 2012" : string
*)