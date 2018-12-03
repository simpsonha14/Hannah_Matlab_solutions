function [normDay1mean, normDay2mean, normDay3mean] = normDay123mean(Day1, Day2, Day3, Weight)
% Weight normalize the isokinetic data and calculate the group means for each day. 
% Store these values with the names normDay1mean, normDay2mean, normDay3mean. You
% do not need to write a function for this, but if you?d like to feel free.
normDay1mean= mean(Day1./Weight);    % Weight normalized for day 1 
normDay2mean= mean(Day2./Weight);    % Weight normalized for day 2
normDay3mean= mean(Day3./Weight);    % Weight normalized for day 3
end 