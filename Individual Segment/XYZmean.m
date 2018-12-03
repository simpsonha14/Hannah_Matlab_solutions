function [segmentX, segX, segmentY, segY, segmentZ, segZ] = XYZmean(X,X1,X2,X3,Y,Y1,Y2,Y3,Z,Z1,Z2,Z3)

segmentX = [X,X1,X2,X3];
segX = mean(segmentX,2);
%EXAMPLE: segmentX_T= calls the markers on the thorax rigid body in the X coordinate
%EXAMPLE: ThoraxsegX= takes the means of the individual markers in the X coordinate during
% an individual frame and does so from frame 2122 to 2662

segmentY = [Y,Y1,Y2,Y3];
segY = mean(segmentY,2);
% EXAMPLE: SegmentY_T= calls the markers on the thorax body in the Y coordinate
% EXAMPLE: ThoraxSegY= takes the means of the individual markers in the Y coordinate
% during an individual from and does so from frame 2122 to 2662

segmentZ = [Z,Z1,Z2,Z3];
segZ = mean(segmentZ,2);
% EXAMPLE: SegmentZ_T= calls the markers on the thorax body in the Z coordinate
% EXAMPLE: ThoraxSegZ= takes the means of the individual markers in the Z coordinate
% during an individual from and does so from frame 2122 to 2662

% THIS IS DONE WITH EACH AND EVERY SEGMENT A.K.A thorax, right hand, right
% upper arm, right forearm 
end
