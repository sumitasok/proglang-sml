fun add_array(x : int list) =
  if null x
  then 0
  else hd x + add_array(tl x);

val ar_1 = add_array([1,2,3,4,5,6,7,8]);
val ar = [24, 65];
val ar_2 = add_array(ar);
