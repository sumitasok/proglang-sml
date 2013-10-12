fun get_nth (str_list : string list, n : int) =
  if n = 1
  then hd(str_list)
  else get_nth(tl str_list, n - 1)

val get_nth1 = get_nth(["asd", "wer", "xcv", "ase"], 3);

(*
  val get_nth = fn : string list * int -> string
  val get_nth1 = "xcv" : string
*)