
% Assignment 4 (or 5)
% Hannah Simpson 
% 10/17/2018

% 2&3) Creating Import Function:

[SubjectID,Age,Gender,Weight,Day1,Day2,Day3] = importfile('isok_data_6803.csv', 2, 26);

% 4) Creating a function GenderIsoCalc

[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender, Day1,Day2,Day3);

% 5) Creating a function: dayComparator:

[day1toDay2] = dayComparator(SubjectID,Day1,Day2);
[day2toDay3] = dayComparator(SubjectID,Day2,Day3);

% 6) Weight normalize the isokinetic data and calculate the group means
%    for each day. Store these values with the names normDay1mean, 
%    normDay2mean, normDay3mean.
[normDay1mean, normDay2mean, normDay3mean] = normDay123mean(Day1, Day2, Day3, Weight);
 
% 7) Export your results to a csvfile using an appropriate built-in 
% function. Name the file iso_results.csv. (You do not need to submit 
% this file because your script should create this file when I run your 
% code.)

% Sets the rows equal to each other (must be done create a table) 
% Fills the columns with zeros for the variables that do not have all their
% rows filled 
femaleIsoIndMeans (13,:) = 0;
maleGroupIsoMean (13,:) = 0;
femaleGroupIsoMean (13,:)= 0;
day1toDay2 (13,:) = 0;
day2toDay3 (13,:) = 0;
normDay1mean (13,:) = 0;
normDay2mean (13,:) = 0;
normDay3mean (13,:) = 0;

% Creates a table then exports into csv file found on the computer
T = table(maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean,femaleGroupIsoMean,day1toDay2,day2toDay3,normDay1mean,normDay2mean,normDay3mean)
writetable(T,'iso_results.csv');

% Finished!!!!!! Woo Hahhhhhhhhh