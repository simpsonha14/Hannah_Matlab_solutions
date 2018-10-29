function [dayAtoDayB] = dayComparator(SubjectID,DayA,DayB);
% Create a function (name it dayComparator.m) that takes the subject ids 
% and two days as inputs and returns a matrix with the subject IDs of the
% subjects who had an increase from the first day to the second day (it 
% should also work for the second day to the third day). Run this function 
% in your main script twice (be sure to update your inputs when you call 
% the function the second time) and store the outputs as day1toDay2 and 
% day2toDay3.

dayAtoDayB= SubjectID(DayA<DayB);

% Day a = the day of lesser value AKA day 1 (compared to day 2) 
% Day B = the day of greater value AKA day 3 (compare to day 2)
% Take the sibject ID compare the days that the subjects had an increase in
% weight value from 1 day to the next 
end