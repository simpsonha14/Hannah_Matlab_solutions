function [maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3);
% Create a function (name it genderIsoCalc.m) that returns four outputs. The first set of outputs
% (one for males and one for females) should return a matrix with individual mean isometric strength
% values across all 3 days of lifting for the appropriate group. The second set of outputs will return 
% the single mean value for each group (mean of subject means). Call this function in your main script 
% and store the results with variable names maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean and 
% femaleGroupIsoMean. These data should not be normalized.
maleSubject = Gender == {'M'}; % Assigns "male subjects" variable to the gender column
findmaleSubject = find(maleSubject); % find male in file that was previously imported
maleIsoIndMeans = (Day1(findmaleSubject)+Day2(findmaleSubject)+Day3(findmaleSubject))/3; 
% ^^ Takes the individual subjects' days and finds the average  
femaleSubject = Gender == {'F'}; % Assigns "female subjects" variable to gender column
findfemaleSubject = find(femaleSubject); % Same as comment aboce, finds female in file that was previously imported
femaleIsoIndMeans = (Day1(findfemaleSubject) + Day2(findfemaleSubject) + Day3(findfemaleSubject))/3;
% ^^ Takes the individual subjects' days and finds the average  
maleGroupIsoMean = mean(maleIsoIndMeans); % finds (male) group mean
femaleGroupIsoMean = mean(femaleIsoIndMeans); % finds (female) group mean 
end