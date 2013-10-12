fun is_older (date1 : int*int*int, date2 : int*int*int ) =
  if #1 date1 > #1 date2
  then false
  else
    if #1 date1 < #1 date2
    then true
    else
      if #2 date2 > #2 date1
      then true
      else
        if #2 date2 < #2 date1
        then false
        else
          if #3 date1 < #3 date2
          then true
          else false


val test_1 = is_older((2013,03,02),(2012,03,03)); (* date1 year later to date2 year val test_1 = false : bool *)
val test_2 = is_older((2012,03,02),(2013,03,03)); (* date1 year before date2 year val test_1 = true : bool *)
val test_2 = is_older((2012,02,02),(2012,02,02)); (* date1 year before date2 year val test_1 = false : bool *)
val test_2 = is_older((2012,03,02),(2012,02,02)); (* date1 year before date2 year val test_1 = false : bool *)
val test_2 = is_older((2012,02,02),(2012,03,02)); (* date1 year before date2 year val test_1 = true : bool *)
val test_2 = is_older((2012,02,03),(2012,02,02)); (* date1 year before date2 year val test_1 = false : bool *)
val test_2 = is_older((2012,02,02),(2012,02,04)); (* date1 year before date2 year val test_1 = true : bool *)
