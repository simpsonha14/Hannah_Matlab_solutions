
function [Displacement, Velocity, Acceleration] = metricFunction(Xcoordinate, Ycoordinate, Zcoordinate, contactPoint);

coordinate = [Xcoordinate, Ycoordinate, Zcoordinate];


% From the start of the movement(i.e. when the the subject's hand is on the
% table) to the frame the touch the pegboard (i.e. full extension) the
% displacement values are the differences in the x, y x means from the location 
% they are at in space when they touch the board subtracted from the value 
% of the coordinates from where they begin on the table, this is done for
% each segment.
Displacement = coordinate(contactPoint,:) - coordinate(1,:);

% Velocity: which is the displacement divided time of frame 
Velocity = Displacement/2.88;

% Acceleration: which is the change in velocity over change in time. 
Acceleration = Velocity/2.88;