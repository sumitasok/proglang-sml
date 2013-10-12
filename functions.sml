fun pow (x : int, y : int) =
  if y = 0
  then 1
  else x * pow (x, y-1)

(* val pow fn = : int * int -> int *)

val power_of_2 = pow(2,3);