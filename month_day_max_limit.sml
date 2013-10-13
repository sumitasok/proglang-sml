fun month_day_max_limit (month : int) =
  if month = 4 orelse month = 6 orelse month = 9 orelse month = 11
  then 30
  else
    if month = 2
    then 28
    else 31