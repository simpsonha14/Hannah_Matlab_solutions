% Matlab Project: Individual segment markers
% Hannah Simpson
%
%
[SubFrame,X,Y,Z,X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4,X5,Y5,Z5,X6,Y6,Z6,X7,Y7,Z7,X8,Y8,Z8,X9,Y9,Z9,X10,Y10,Z10,X11,Y11,Z11,X12,Y12,Z12,X13,Y13,Z13,X14,Y14,Z14,X15,Y15,Z15] = importfile('Sticky_note_testing01.csv',2122, 2662);
%
% Function imports csv file from Pilot testing using sticky notes
% Pulls frames from 2122 to 2662, this frame represents one movement from
% the hand on the table to the execution of placing a sticky note (reaching) on the
% pegboard
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOTE: 
% segmentX_T = is X, X1, X2, X3; represents all four markers on the
% thorax rigid body
%
% ThoraxsegX = is the mean of all four markers on the rigid body, the end 
% result is one segment value for the X coordinate for that frame. 
%
% The above definitions are true for the RHand, RUpperHand, and Rforearm,
% except with their values(i.e. X4-X15, Y1-Y15, Z1-Z15) substituted in the 
% respected spots, this is calulated in this code.

[segmentX_T, ThoraxsegX, segmentY_T, ThoraxsegY, segmentZ_T, ThoraxsegZ] = XYZmean(X,X1,X2,X3,Y,Y1,Y2,Y3,Z,Z1,Z2,Z3);

% Function calls on the individual markers by their specific column and row.
% i.e Thorax marker 1 is found in the X, Y, Z plane, while marker 2 of the 
% thorax is found in the X1, Y1, Z1 plane and so on until the last marker 
% which is the fourth one and it is found in the X3,Y3,Z3 plane. 

[segmentX_U, RUpperArmsegX, segmentY_U, RUpperArmsegY, segmentZ_U, RUpperArmsegZ] = XYZmean(X4,X5,X6,X7,Y4,Y5,Y6,Y7,Z4,Z5,Z6,Z7);

% Function does the same as the thorax function above, except this function
% is calling for the mean of the right upper arm rigid body

[segmentX_H, RHandsegX, segmentY_H, RHandsegY, segmentZ_H, RHandsegZ] = XYZmean(X8,X9,X10,X11,Y8,Y9,Y10,Y11,Z8,Z9,Z10,Z11);

% Function does the same as the above functions, except this function is
% calling for the mean of the right hand rigid body

[segmentX_F, RForearmsegX, segmentY_F, RForearmsegY, segmentZ_F, RForearmsegZ] = XYZmean(X12,X13,X14,X15,Y12,Y13,Y14,Y15,Z12,Z13,Z14,Z15);

% Function does the same as the above functions, except this function is
% calling for the mean of the right forearm rigid body


figure('Name', 'Arm Trajectory Pathway', 'NumberTitle', 'off');
axis([-800 -300 100 840 100 400])
subplot(2,2,1), surf(segmentX_T,segmentY_T,segmentZ_T); title('Thorax');xlabel('X axis');zlabel('Z axis');ylabel('Y axis');
axis([-800 -300 100 840 100 400])
subplot(2,2,2), surf(segmentX_U,segmentY_U,segmentZ_U); title('Right UpperArm');xlabel('X axis');ylabel('Y axis');zlabel('Z axis');
axis([-800 -300 100 840 100 400])
subplot(2,2,3), surf(segmentX_F,segmentY_F,segmentZ_F); title('Right Forearm');xlabel('X axis');ylabel('Y axis');zlabel('Z axis');
axis([-800 -300 100 840 100 400])
subplot(2,2,4), surf(segmentX_H,segmentY_H,segmentZ_H); title('Right Hand');xlabel('X axis');ylabel('Y axis');zlabel('Z axis');
axis([-800 -300 100 840 100 400])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
promptmessage = sprintf('Would you like to find the displacement, velocity, and acceleration of the Arm Pathway');
    Note= 'Yes or No'; %prompts user to select one of two options
     user=1;
    select= zeros(1,user);
    for userAnswer1= 1: user
        userAnswer2= 0: user;
    button=questdlg(promptmessage, Note, 'Yes','No','yes');
    if strcmpi(button, 'Yes')
        Yes = 1;
    else, strcmpi(button,'No')
        No = 0;
       return %If user selects No, messagebox will terminate & the vel., accel., and disp will not be found. 
    end
    end
    
% Begins function of displacement and velocity of the segments during one
% movement from table (initial) to pegboard (final) 2122 - 2468)

[ThoraxDisplacement, ThoraxVelocity,ThoraxAcceleration] = metricFunction(ThoraxsegX, ThoraxsegY, ThoraxsegZ, 346);
% displacement of the thorax: The values that are calculated in this function shows
% the displacement for each X, Y, Z mean of the thorax for each frame 

[RUpperArmDisplacement,RUpperArmVelocity,RUpperArmAcceleration] = metricFunction(RUpperArmsegX, RUpperArmsegY, RUpperArmsegZ,346);
% displacement of the Right Upper Arm: The values that are calculated in this function shows
% the displacement for each X, Y, Z mean of the right upper arm for each
% frame.

[RHandDisplacement,RHandVelocity,RHandAcceleration] = metricFunction(RHandsegX, RHandsegY, RHandsegZ, 346);
% displacement of the Right Hand: The values that are calculated in this function shows
% the displacement for each X, Y, Z mean of the right hand for each frame. 

[RForearmDisplacement,RForearmVelocity, RForearmAcceleration] = metricFunction(RForearmsegX, RForearmsegY, RForearmsegZ, 346);
% displacement of the Right Forearm: The values that are calculated in this function shows
% the displacement for each X, Y, Z mean of the right forearm for each frame. 

