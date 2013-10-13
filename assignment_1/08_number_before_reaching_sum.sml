fun number_before_reaching_sum(sum : int, int_list : int list) = 
  if sum <= hd int_list
  then 0
  else 1 + number_before_reaching_sum(sum - (hd int_list), tl int_list)

val number_before_reaching_sum1 = number_before_reaching_sum(7, [1,2,3,4,5,6,7])
val number_before_reaching_sum2 = number_before_reaching_sum(15, [1,2,3,4,5,6,7])
val number_before_reaching_sum3 = number_before_reaching_sum(25, [1,2,3,4,5,6,27])

(*
  val number_before_reaching_sum = fn : int * int list -> int
  val number_before_reaching_sum1 = 3 : int
  val number_before_reaching_sum2 = 4 : int
  val number_before_reaching_sum3 = 6 : int
*)