val is_older1 = is_older((2013,03,02),(2012,03,03)) = false;
val is_older2 = is_older((2012,03,02),(2013,03,03)) = true;
val is_older3 = is_older((2012,02,02),(2012,02,02)) = false;
val is_older4 = is_older((2012,03,02),(2012,02,02)) = false;
val is_older5 = is_older((2012,02,02),(2012,03,02)) = true;
val is_older6 = is_older((2012,02,03),(2012,02,02)) = false;
val is_older7 = is_older((2012,02,02),(2012,02,04)) = true;


val number_in_month1 = number_in_month([(2013,09,10),(2013,09,41),(2013,09,51)], 1) = 0;
val number_in_month2 = number_in_month([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], 9) = 4;
val number_in_month3 = number_in_month([(2013,02,31),(2013,09,41),(2013,09,51),(2013,09,20)], 02) = 1;

val number_in_months1 = number_in_months([(2013,09,10),(2013,09,41),(2013,09,51)], [1]) = 0;
val number_in_months2 = number_in_months([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], [9,2]) = 4;
val number_in_months3 = number_in_months([(2013,02,31),(2013,09,41),(2013,09,51),(2013,09,20)], [09,02]) = 4;
val number_in_months4 = number_in_months([(2013,02,31),(2013,09,41),(2013,09,51),(2013,07,20)], [09,02]) = 3;

val dates_in_month1 = dates_in_month([(2013,01,10),(2013,02,41),(2013,09,51)], 1) = [(2013,1,10)];
val dates_in_month2 = dates_in_month([(2013,01,10),(2013,02,41),(2013,09,51),(2013,09,20)], 2) = [(2013,2,41)];
val dates_in_month3 = dates_in_month([(2013,02,31),(2013,02,21),(2013,02,51),(2013,09,20)], 2) = [(2013,2,31),(2013,2,21),(2013,2,51)];


val dates_in_months1 = dates_in_months([(2013,09,31),(2013,09,21),(2013,09,51)], [2,3]) = [];
val dates_in_months2 = dates_in_months([(2013,09,10),(2013,09,41),(2013,02,51),(2013,02,20)], [1,2]) = [(2013,2,51),(2013,2,20)];
val dates_in_months3 = dates_in_months([(2013,02,31),(2013,03,21),(2013,03,51),(2013,09,20)], [2,3]) = [(2013,2,31),(2013,3,21),(2013,3,51)];

val get_nth1 = get_nth(["asd", "wer", "xcv", "ase"], 3) = "xcv";

val date1 = date_to_string(2013, 02, 02) = "February 2, 2013";
val date2 = date_to_string(2014, 02, 12) = "February 12, 2014";
val date3 = date_to_string(2012, 03, 24) = "March 24, 2012";

val number_before_reaching_sum1 = number_before_reaching_sum(7, [1,2,3,4,5,6,7]) = 3;
val number_before_reaching_sum2 = number_before_reaching_sum(15, [1,2,3,4,5,6,7]) = 4;
val number_before_reaching_sum3 = number_before_reaching_sum(25, [1,2,3,4,5,7,27]) = 6;

val what_month1 = what_month(27) = 1;
val what_month2 = what_month(47) = 2;
val what_month3 = what_month(127) = 5;

val month_range1 = month_range(25,27) = [1,1,1];
val month_range2 = month_range(25,26) = [1,1];
val month_range3 = month_range(25,12) = [];
val month_range3 = month_range(25,33) = [1,1,1,1,1,1,1,2,2];

val oldest1 = oldest([(2013,09,10),(2013,09,11),(2013,09,21)]) = SOME (2013,9,10);
val oldest2 = oldest([(2013,09,10),(2012,09,11),(2013,09,21)]) = SOME (2012,9,11);
val oldest3 = oldest([(2013,09,10),(2012,09,11),(2011,09,21)]) = SOME (2011,9,21);
val oldest5 = oldest([]) = NONE;

val number_in_months_challenge1 = number_in_months_challenge([(2013,09,10),(2013,09,41),(2013,09,51)], [1]) = [];
val number_in_months_challenge2 = number_in_months_challenge([(2013,09,10),(2013,09,41),(2013,09,51),(2013,09,20)], [9,2]) = [9];
val number_in_months_challenge3 = number_in_months_challenge([(2013,02,31),(2013,09,41),(2013,09,51),(2013,09,20)], [09,02]) = [9,2];
val number_in_months_challenge4 = number_in_months_challenge([(2013,02,31),(2013,09,41),(2013,09,51),(2013,07,20)], [09,02]) = [9,2];

val dates_in_months_challenge1 = dates_in_months_challenge([(2013,09,31),(2013,09,21),(2013,09,51)], [2,3]) = [];
val dates_in_months_challenge2 = dates_in_months_challenge([(2013,09,10),(2013,02,41),(2013,02,51),(2013,09,20)], [1,2]) = [(2013,2,51)];
val dates_in_months_challenge3 = dates_in_months_challenge([(2013,01,31),(2013,02,21),(2013,03,51),(2013,02,20)], [2,3]) = [(2013,2,20),(2013,3,51)];

val reasonable_date1 = reasonable_date(2013,02,29) = false;
val reasonable_date2 = reasonable_date(2012,02,29) = true;
val reasonable_date3 = reasonable_date(2013,03,15) = true;
val reasonable_date4 = reasonable_date(0,02,29) = false;
val reasonable_date5 = reasonable_date(2013,13,29) = false;
val reasonable_date6 = reasonable_date(2100,2,29) = false;
