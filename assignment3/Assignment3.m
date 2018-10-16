%Hannah Simpson 
% 9/25/2018
% Description: This code was created to play the game of TicTacToe. Two
% players: one human player and a computer player.

clc

% Prompt Message box 1: Asking user if they would like to play 
    promptmessage = sprintf('Would you like to play the game of Tic-Tac-Toe?');
    Note= 'Yes or No'; %prompts user to select one of two options
     player=1;
    select= zeros(1,player);
    for userNum= 1: player
    button=questdlg(promptmessage, Note, 'Yes','No','yes');
    if strcmpi(button, 'Yes')
        Yes = 1;
    else, strcmpi(button,'No')
        No = 0;
       return  %If user selects No, messagebox will terminate & game won't cont. 
    end
    end
    
% Prompt Message box 2: Instructions 
  promptmessage =sprintf('Welcome! Glad you decided to play! Few quick rules: Be sure to only pick spaces that are open. If you do not pick an open space an error will occur and you will have to start over. Keep your mouse on the gameboard that will be the only way to make your next move. First move is on you! Click OK to continue, or cancel to exit game. GOOD LUCK!');
    Note= 'OK or Cancel'; %prompts user to select OK
     player=1;
     select= zeros(1,player);
    for userNum= 1: player
    button=questdlg(promptmessage, Note, 'OK','Cancel', 'OK');
    if strcmpi(button, 'OK')
      OK = 1;
    else, strcmpi(button,'Cancel')
       Cancel = 0;
       return
    end
    end 
   
%Prompt Message Box 2: First Move
promptmessage =sprintf('Ready to go first?');
    Note= 'yes'; %prompts user to select one of two options
     player=1;
     select= zeros(1,player);
    for userNum= 1: player
    button=questdlg(promptmessage, Note, 'yes','no' ,'yes');
    if strcmpi(button, 'yes')
      yes = 1;
    else, strcmpi(button,'no')
        no = 0;
        return
    end
    end 


    % Next creating the gameboard:
   axis([0 3 0 3]);                           % Sets the dimensions of axis on board
   ax = gca;
   set(ax, 'xTick', 0:3)                       % Sets the Tick marks for x axis on grid
   set(ax, 'yTick', 0:3)                       % Sets the Tick marks for y axis on grid
   set(ax,'XColor','b','linewidth',5)          % Changes the X axis color
   set(ax,'YColor','b','linewidth',5)          % Changes the Y axis color
   xlabel('Let the games begin!')              % Labels the bottom of the grid 
   set(ax,'color','m')
   grid on
   hold on
 
   
   %Place holders of the Tic Tac Toe board
   % Represents each box on the grid
   % Column 1 - 
   box_1 = 5; % square on top left (1,1)
   box_2 = 5; % square on middle left (1,2)
   box_3 = 5; % square on bottom left (1,3)
   % Column 2 -
   box_4 = 5; % square on top middle (2,1)
   box_5 = 5; % square on middle middle (2,2)
   box_6 = 5; % square on bottom middle (2,3)
   % Column 3 - 
   box_7 = 5; % square on top right (3,1)
   box_8 = 5; % square on middle right (3,2)
   box_9 = 5; % square on bottom right (3,3)

%Ranges provided for points of axis inside of the Tic Tac Toe Board: Point
%of reference (0,0) is the top left of the Grid
bx_1 = [3.0 2.0;0.0 1.0];   %coordinates for box 1
bx_2 = [3.0 2.0;1.0 2.0];   %coordinates for box 2
bx_3 = [3.0 2.0;2.0 3.0];   %coordinates for box 3

bx_4 = [2.0 1.0;0.0 1.0];  %coordinates for box 4
bx_5 = [2.0 1.0;1.0 2.0];  %coordinates for box 5
bx_6 = [2.0 1.0;2.0 3.0];  %coordinates for box 6

bx_7 = [1.0 0.0;0.0 1.0];   %coordinates for box 7
bx_8 = [1.0 0.0;1.0 2.0];   %coordinates for box 8
bx_9 = [1.0 0.0;2.0 3.0];   %coordinates for box 9

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main Game Loop Continue until the game ends with a winner or tie.
% Row/Column counter for Player 1 (human)

% Rows of Tic Tac Toe board
R1_Player1 = 0;         % Row One = [3 2];
R2_Player1 = 0;         % Row Two = [2 1];
R3_Player1 = 0;         % Row Three = [1 0];
% Columns of Tic Tac Toe board 
C1_Player1 = 0;         % Column One = [0 1];
C2_Player1 = 0;         % Column Two= [1 2];
C3_Player1 = 0;         % Column Three [2 3];

% Row/column counter for Player 2 (computer)

% Rows of Tic Tac Toe board
R1_Player2 = 0;               % Row One = [3 2];
R2_Player2 = 0;               % Row Two = [2 1];
R3_Player2 = 0;               % Row Three = [1 0];
% Columns of Tic Tac Toe board 
C1_Player2 = 0;               % Column One = [0 1];
C2_Player2 = 0;               % Column Two = [1 2];
C3_Player2 = 0;               % Column Three = [2 3];


% BEGIN THE BEAUTIFUL GAME OF TIC TAC TOE 

% %%%%%%%%%%%%% DISCLAIMER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - THIS CODE DEFINITELY DOESN'T GO WITHOUT FLAWS
% - THERE ARE DEFINITELY A FEW BUMPS - FAMILY AND FRIENDS HELPED MAKE THIS
%   POSSIBLE ... AKA GOOGLE AND FELLOW CLASSMATES .. FAMILY AND FRIENDS 
%   COULDN'T UNDERSTAND THIS EVEN IF THEY WANTED TO...
% - ALSO, AFTER THIS ASSIGNMENT, I FULLY UNDERSTAND THAT I HAVE TAKEN
%   FOR GRANTED THE SIMPLICITY OF THIS GAME SINCE I WAS 4 YEARS OLD. 
% - HOWEVER, I FULLY RESPECT THIS GAME TO THE FULLEST EXTENT NOW...NO DOUBT


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST MOVE of the Game: Human Player
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Move_1 = ginput(1);  % ginput replaces mouse with cross hairs to allow
                     % better accuracy in making a move.
scatter (Move_1(1,1), Move_1(1,2),400,[0 0 1], 'X');
% Scatter formula= scatter(x,y sz, [], 'point on grid')

% Determine the row (move with ranges) (MOVE 1):
if (Move_1(1,2) >= bx_1(2,1)) && (Move_1(1,2) <= bx_7(1,1))
 % AKA if move 1 in row 1, col. 2 is greater than the coordinates of row 2, column 1) 
R3_Player1 = R3_Player1 + 1;
    elseif (Move_1(1,2)>= bx_4(1,2)) && (Move_1(1,2) <= bx_4(1,1))
    elseif (Move_1(1,2) >= bx_1(1,2)) && (Move_1(1,2) <= bx_1(1,1))
R1_Player1 = R1_Player1 + 1;

end 

% Determine the column (move with ranges) (MOVE 1):
if (Move_1(1,1) >= bx_1(2,1)) && (Move_1(1,1) <= bx_1(2,2))
C1_Player1 = C1_Player1 + 1;
    elseif (Move_1(1,1) >= bx_2(2,1)) && (Move_1(1,1) <= bx_2 (2,2))
C2_Player1 = C2_Player1 + 1;
    elseif (Move_1(1,1) >= bx_3(2,1)) && (Move_1(1,1) <= bx_3 (2,2))
C3_Player1 = C3_Player1 + 1;
end
 
% Tic Tac Toe Box (square) description/placement (MOVE 1):
% Helps to show the computer not to move in that particular square that
% the player just made their move to
if Move_1(1,1) >= bx_9(2,1) && Move_1(1,2) <= bx_9(1,1) 
box_9 = -1;
    elseif Move_1(1,1) >= bx_8 (2,1) && Move_1(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_1(1,1) >= bx_7 (2,1) && Move_1(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_1(1,1) >= bx_6 (2,1) && Move_1(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_1(1,1) >= bx_5 (2,1) && Move_1(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_1(1,1) >= bx_4 (2,1) && Move_1(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_1(1,1) >= bx_3 (2,1) && Move_1(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_1(1,1) >= bx_2 (2,1) && Move_1(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_1(1,1) >= bx_1 (2,1) && Move_1(1,2) <= bx_1(1,1)
box_1 = -1;
end 
pause(1) % pause so that the computer's play isn't instantaneous

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE TWO (2): Computer: Player 2
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pretty much repeat all steps from first move except replace player(human)
% with computer model as well as take the mean of the ranges provided

if box_1 > 0 %If square 1 is greater than zero 
Move_2_row = mean(bx_1(1,:));     %Taking the mean(average) of ranges of rows
Move_2_col = mean(bx_1(2,:));     %Taking the mean (average) of ranges of columns
Move_2 = [Move_2_row Move_2_col]; % Move 2 -> row, col.
scatter (Move_2(1,2),Move_2(1,1),400,[0 0 0],'O'); %scatter formula
    elseif box_2 > 0
     Move_2_row = mean(bx_2(1,:));
     Move_2_col = mean(bx_2(2,:));
     Move_2 = [Move_2_row Move_2_col];
     scatter (Move_2(1,2),Move_2(1,1),400,[0 0 0],'O'); %scatter formula
end

%Determine Column (MOVE 2)
if (Move_2(1,2) >= bx_1(2,1)) && (Move_2(1,2) <= bx_1(2,2))  
C1_Comptuer = C1_Player2 + 1;
%AKA if move two in (1,2) is greater than (2,1)
    elseif (Move_2(1,2) >= bx_2(2,1)) && (Move_2(1,2) <= bx_2 (2,2)) %row2
C2_Player2 = C2_Player2 + 1;
    elseif (Move_2(1,2) >= bx_3(2,1)) && (Move_2(1,2) <= bx_3 (2,2)) %row3
C3_Player2 = C3_Player2 + 1;
end

%Determine Row (MOVE 2):
if (Move_2(1,1) <= bx_1(1,1)) && (Move_2(1,1) >= bx_1(1,2))
R1_Player2 = R1_Player2 + 1;
    elseif(Move_2(1,1) <= bx_4(1,2)) && (Move_2(1,1) >= bx_4(1,2))
R2_Player2 = R2_Player2 + 1;
    elseif(Move_2(1,1) <= bx_7(1,2)) && (Move_2(1,1) >= bx_7(1,2))
R3_Player2 = R3_Player2 + 1;
end


%%% Tic Tac Toe Box (square) description/placement (MOVE 2):

if Move_2(1,2) >= bx_9 (2,1) && Move_2(1,1) <= bx_9(1,1)
box_9 = -2;
    elseif Move_2(1,2) >= bx_8 (2,1) && Move_2(1,1) <= bx_8(1,1)
box_8 = -2;
    elseif Move_2(1,2) >= bx_7 (2,1) && Move_2(1,1) <= bx_7(1,1)
box_7 = -2;
    elseif Move_2(1,2) >= bx_6 (2,1) && Move_2(1,1) <= bx_6(1,1)
box_6 = -2;
    elseif Move_2(1,2) >= bx_5 (2,1) && Move_2(1,1) <= bx_5(1,1)
box_5 = -2;
    elseif Move_2(1,2) >= bx_4 (2,1) && Move_2(1,1) <= bx_4(1,1)
box_4 = -2;
    elseif Move_2(1,2) >= bx_3 (2,1) && Move_2(1,1) <= bx_3(1,1)
box_3 = -2;
    elseif Move_2(1,2) >= bx_2 (2,1) && Move_2(1,1) <= bx_2(1,1)
box_2 = -2;
    elseif Move_2(1,2) >= bx_1 (2,1) && Move_2(1,1) <= bx_1(1,1)
box_1 = -2;
end 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE THREE(3): Human: player 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Move_3 = ginput(1);
scatter (Move_3(1,1),Move_3(1,2),400,[0 0 1],'X'); %scatter formula

%Determine Column (MOVE 3)
if (Move_3(1,1) >= bx_1(2,1)) && (Move_3(1,1) <= bx_1(2,2)) 
C1_Player1 = C1_Player1 + 1;
    elseif (Move_3(1,1) >= bx_2(2,1)) && (Move_3(1,1) <= bx_2 (2,2)) 
C2_Player1 = C2_Player1 + 1;
    elseif (Move_3(1,1) >= bx_3(2,1)) && (Move_3(1,1) <= bx_3 (2,2)) 
C3_Player1 = C3_Player1 + 1;
end
%Determine Row (MOVE 3)
if (Move_3(1,2) >= bx_7(1,2)) && (Move_3(1,2) <= bx_7(1,1))
R3_Player1 = R3_Player1 + 1;
    elseif (Move_3(1,2) >= bx_4(1,2)) && (Move_3(1,2) <= bx_4(1,1))
R2_Player1 = R2_Player1 + 1;
    elseif (Move_3(1,2) >= bx_1(1,2)) && (Move_3(1,2) <= bx_1(1,1))
R1_Player1 = R1_Player1 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 3)
if Move_3(1,1) >= bx_9 (2,1) && Move_3(1,2) <= bx_9(1,1)
box_9 = -1;
    elseif Move_3(1,1) >= bx_8 (2,1) && Move_3(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_3(1,1) >= bx_7 (2,1) && Move_3(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_3(1,1) >= bx_6 (2,1) && Move_3(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_3(1,1) >= bx_5 (2,1) && Move_3(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_3(1,1) >= bx_4 (2,1) && Move_3(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_3(1,1) >= bx_3 (2,1) && Move_3(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_3(1,1) >= bx_2 (2,1) && Move_3(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_3(1,1) >= bx_1 (2,1) && Move_3(1,2) <= bx_1(1,1)
box_1 = -1;
end

pause (1) %pause so that the computer's play isn't instantaneous

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  MOVE FOUR(4) Computer: Player 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if box_1 > 0
Move_4_row = mean(bx_1(1,:));
Move_4_col = mean(bx_1(2,:));
Move_4 = [Move_4_row Move_4_col];
scatter (Move_4(1,2),Move_4(1,1),400,[0 0 0],'O');%Scatter formula
    elseif box_2 > 0
Move_4_row = mean(bx_2(1,:));
Move_4_col = mean(bx_2(2,:));
Move_4 = [Move_4_row Move_4_col];
scatter (Move_4(1,2),Move_4(1,1),400,[0 0 0],'O');%Scatter formula
    elseif box_3 > 0
Move_4_row = mean(bx_3(1,:));
Move_4_col = mean(bx_3(2,:));
Move_4 = [Move_4_row Move_4_col];
scatter (Move_4(1,2),Move_4(1,1),400,[0 0 0],'O');%Scatter formula
    elseif box_4 > 0
Move_4_row = mean(bx_4(1,:));
Move_4_col = mean(bx_4(2,:));
Move_4 = [Move_4_row Move_4_col];
scatter (Move_4(1,2),Move_4(1,1),400,[0 0 0],'O');%Scatter formula
end

%Determine Column (MOVE 4)
if (Move_4(1,2) >= bx_1(2,1)) && (Move_4(1,2) <= bx_1(2,2)) % row 1 & col. 2
C1_Player2 = C1_Player2 + 1;
    elseif (Move_4(1,2) >= bx_2(2,1)) && (Move_4(1,2) <= bx_2 (2,2)) %row 2 & row col. 2
C2_Player2 = C2_Player2 + 1;
    elseif (Move_4(1,2) >= bx_3(2,1)) && (Move_4(1,2) <= bx_3 (2,2)) %row 3 & col. 2
C3_Player2 = C3_Player2 + 1;
end

%Determine Row (MOVE 4)
if (Move_4(1,1) <= bx_1(1,1)) && (Move_4(1,1) >= bx_1(1,2))
R1_Player2 = R1_Player2 + 1;
    elseif(Move_4(1,1) <= bx_4(1,2)) && (Move_4(1,1) >= bx_4(1,2))
R2_Player2 = R2_Player2 + 1;
    elseif(Move_4(1,1) <= bx_7(1,2)) && (Move_4(1,1) >= bx_7(1,2))
R3_Player2 = R3_Player2 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 4):
if Move_4(1,2) >= bx_9 (2,1) && Move_4(1,1) <= bx_9(1,1)
box_9 = -2;
    elseif Move_4(1,2) >= bx_8 (2,1) && Move_4(1,1) <= bx_8(1,1)
box_8 = -2;
    elseif Move_4(1,2) >= bx_7 (2,1) && Move_4(1,1) <= bx_7(1,1)
box_7 = -2;
    elseif Move_4(1,2) >= bx_6 (2,1) && Move_4(1,1) <= bx_6(1,1)
box_6 = -2;
    elseif Move_4(1,2) >= bx_5 (2,1) && Move_4(1,1) <= bx_5(1,1)
box_5 = -2;
    elseif Move_4(1,2) >= bx_4 (2,1) && Move_4(1,1) <= bx_4(1,1)
box_4 = -2;
    elseif Move_4(1,2) >= bx_3 (2,1) && Move_4(1,1) <= bx_3(1,1)
box_3 = -2;
    elseif Move_4(1,2) >= bx_2 (2,1) && Move_4(1,1) <= bx_2(1,1)
box_2 = -2;
    elseif Move_4(1,2) >= bx_1 (2,1) && Move_4(1,1) <= bx_1(1,1)
box_1 = -2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE FIVE (5) Human: Player 1 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Move_5 = ginput(1);
scatter (Move_5(1,1),Move_5(1,2),400,[0 0 1],'X'); %scatter formula 

%Determine Column (MOVE 5)
if (Move_5(1,1) >= bx_1(2,1)) && (Move_5(1,1) <= bx_1(2,2))%row1
C1_Player1 = C1_Player1 + 1;
    elseif (Move_5(1,1) >= bx_2(2,1)) && (Move_5(1,1) <= bx_2 (2,2)) %row2
C2_Player1 = C2_Player1 + 1;
    elseif (Move_5(1,1) >= bx_3(2,1)) && (Move_5(1,1) <= bx_3 (2,2)) %row3
C3_Player1 = C3_Player1 + 1;
end

%Determine Row (MOVE 5)
if (Move_5(1,2) >= bx_7(1,2)) && (Move_5(1,2) <= bx_7(1,1))
R3_Player1 = R3_Player1 + 1;
    elseif (Move_5(1,2) >= bx_4(1,2)) && (Move_5(1,2) <= bx_4(1,1))
R2_Player1 = R2_Player1 + 1;
    elseif (Move_5(1,2) >= bx_1(1,2)) && (Move_5(1,2) <= bx_1(1,1))
R1_Player1 = R1_Player1 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 5):
if Move_5(1,1) >= bx_9 (2,1) && Move_5(1,2) <= bx_9(1,1)
box_9 = -1;
    elseif Move_5(1,1) >= bx_8 (2,1) && Move_5(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_5(1,1) >= bx_7 (2,1) && Move_5(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_5(1,1) >= bx_6 (2,1) && Move_5(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_5(1,1) >= bx_5 (2,1) && Move_5(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_5(1,1) >= bx_4 (2,1) && Move_5(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_5(1,1) >= bx_3 (2,1) && Move_5(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_5(1,1) >= bx_2 (2,1) && Move_5(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_5(1,1) >= bx_1 (2,1) && Move_5(1,2) <= bx_1(1,1)
box_1 = -1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% After five moves check conditions for a winner 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clarificaton of winner of the game

win_1 = {'You got lucky this time! Congrats on the win!','You Winnn','warn'};
win_2 = {'Guess I couldnt take it that easy on you!'}; 
win_3 = {'Looks like our skills are matched this time around. We Tied'};

Player1wins= win_1;
Player2wins= win_2;
Tie = win_3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for a Winner?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:2:9
if sum(C1_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(C2_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(C3_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(R1_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(R2_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(R3_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(box_1 + box_5 + box_9) == -3
msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(box_3 + box_5 + box_7) == -3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
end


% No Winner? Game will continue on to a move 6

pause(1) %pause so that the computer's play isn't instantaneous

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE SIX(6): Computer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if box_1 > 0
Move_6_row = mean(bx_1(1,:));
Move_6_col = mean(bx_1(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O'); %Scatter formula
    elseif box_2 > 0
Move_6_row = mean(bx_2(1,:));
Move_6_col = mean(bx_2(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O'); %Scatter formula
    elseif box_3 > 0
Move_6_row = mean(bx_3(1,:));
Move_6_col = mean(bx_3(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O'); %Scatter formula
    elseif box_4 > 0
Move_6_row = mean(bx_4(1,:));
Move_6_col = mean(bx_4(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O'); %Scatter formula
    elseif box_5 > 0
Move_6_row = mean(bx_5(1,:));
Move_6_col = mean(bx_5(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O'); %Scatter formula
    elseif box_6 > 0
Move_6_row = mean(bx_6(1,:));
Move_6_col = mean(bx_6(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O');
end

%Determine Column (MOVE 6)

if (Move_6(1,2) >= bx_1(2,1)) && (Move_6(1,2) <= bx_1(2,2))
C1_Player2 = C1_Player2 + 1;
    elseif (Move_6(1,2) >= bx_2(2,1)) && (Move_6(1,2) <= bx_2 (2,2))
C2_Player2 = C2_Player2 + 1;
    elseif (Move_6(1,2) >= bx_3(2,1)) && (Move_6(1,2) <= bx_3 (2,2))
C3_Player2 = C3_Player2 + 1;
end

%Determine Row (MOVE 6)
if (Move_6(1,1) <= bx_1(1,1)) && (Move_6(1,1) >= bx_1(1,2))
R1_Player2 = R1_Player2 + 1;
    elseif(Move_6(1,1) <= bx_4(1,1)) && (Move_6(1,1) >= bx_4(1,2))
R2_Player2 = R2_Player2 + 1;
    elseif(Move_6(1,1) <= bx_7(1,1)) && (Move_6(1,1) >= bx_7(1,2))
R3_Player2 = R3_Player2 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 6):
if Move_6(1,2) >= bx_9 (2,1) && Move_6(1,1) <= bx_9(1,1)
box_9 = -2;
    elseif Move_6(1,2) >= bx_8 (2,1) && Move_6(1,1) <= bx_8(1,1)
box_8 = -2;
    elseif Move_6(1,2) >= bx_7 (2,1) && Move_6(1,1) <= bx_7(1,1)
box_7 = -2;
    elseif Move_6(1,2) >= bx_6 (2,1) && Move_6(1,1) <= bx_6(1,1)
box_6 = -2;
    elseif Move_6(1,2) >= bx_5 (2,1) && Move_6(1,1) <= bx_5(1,1)
box_5 = -2;
    elseif Move_6(1,2) >= bx_4 (2,1) && Move_6(1,1) <= bx_4(1,1)
box_4 = -2;
    elseif Move_6(1,2) >= bx_3 (2,1) && Move_6(1,1) <= bx_3(1,1)
box_3 = -2;
    elseif Move_6(1,2) >= bx_2 (2,1) && Move_6(1,1) <= bx_2(1,1)
box_2 = -2;
    elseif Move_6(1,2) >= bx_1 (2,1) && Move_6(1,1) <= bx_1(1,1)
box_1 = -2;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for a Winner: Computer: Player 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if sum(C1_Player2) == 3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(C2_Player2) == 3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(C3_Player2) == 3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(R1_Player2) == 3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(R2_Player2) ==3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(R3_Player2) ==3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(box_1 + box_5 + box_9) == -6
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');   
break
    elseif sum(box_3 + box_5 + box_7) == -6
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
continue
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE SEVEN(7): Human: Player 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Move_7 = ginput(1);
scatter (Move_7(1,1),Move_7(1,2),400,[0 0 1],'X'); %scatter formula

%Determine Column (MOVE 7)
if (Move_7(1,1) >= bx_1(2,1)) && (Move_7(1,1) <= bx_1(2,2)) %row1
C1_Player1 = C1_Player1 + 1;
    elseif (Move_7(1,1) >= bx_2(2,1)) && (Move_7(1,1) <= bx_2 (2,2)) %row2
C2_Player1 = C2_Player1 + 1;
    elseif (Move_7(1,1) >= bx_3(2,1)) && (Move_7(1,1) <= bx_3 (2,2)) %row3
C3_Player1 = C3_Player1 + 1;
end
%Determine Row (MOVE 7)
if (Move_7(1,2) >= bx_7(1,2)) && (Move_7(1,2) <= bx_7(1,1))
R3_Player1 = R3_Player1 + 1;
    elseif (Move_7(1,2) >= bx_4(1,2)) && (Move_7(1,2) <= bx_4(1,1))
R2_Player1 = R2_Player1 + 1;
    elseif (Move_7(1,2) >= bx_1(1,2)) && (Move_7(1,2) <= bx_1(1,1))
R1_Player1= R1_Player1 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 7):
if Move_7(1,1) >= bx_9 (2,1) && Move_7(1,2) <= bx_9(1,1)
box_9 = -1;
    elseif Move_7(1,1) >= bx_8 (2,1) && Move_7(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_7(1,1) >= bx_7 (2,1) && Move_7(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_7(1,1) >= bx_6 (2,1) && Move_7(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_7(1,1) >= bx_5 (2,1) && Move_7(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_7(1,1) >= bx_4 (2,1) && Move_7(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_7(1,1) >= bx_3 (2,1) && Move_7(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_7(1,1) >= bx_2 (2,1) && Move_7(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_7(1,1) >= bx_1 (2,1) && Move_7(1,2) <= bx_1(1,1)
box_1 = -1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for Winner? Player 1 (Human)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if sum(C1_Player1) == 3
 msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(C2_Player1) == 3
  msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');   
break
    elseif sum(C3_Player1) == 3
   msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(R1_Player1) == 3
 msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(R2_Player1) ==3
 msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(R3_Player1) ==3
 msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(box_1 + box_5 + box_9) == -3
  msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(box_3 + box_5 + box_7) == -3
msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');
continue
end

pause (1) %pause so that the computer's play isn't instantaneous

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE EIGHT(8): Computer: Player 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if box_1 > 0
Move_8_row = mean(bx_1(1,:));
Move_8_col = mean(bx_1(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_2 > 0
Move_8_row = mean(bx_2(1,:));
Move_8_col = mean(bx_2(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_3 > 0
Move_8_row = mean(bx_3(1,:));
Move_8_col = mean(bx_3(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');

    elseif box_4 > 0
Move_8_row = mean(bx_4(1,:));
Move_8_col = mean(bx_4(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_5 > 0
Move_8_row = mean(bx_5(1,:));
Move_8_col = mean(bx_5(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_6 > 0
Move_8_row = mean(bx_6(1,:));
Move_8_col = mean(bx_6(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');

    elseif box_7 > 0
Move_8_row = mean(bx_7(1,:));
Move_8_col = mean(bx_7(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_8 > 0
Move_8_row = mean(bx_8(1,:));
Move_8_col = mean(bx_8(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
end
%Determine Column (MOVE 8):
if (Move_8(1,2) >= bx_1(2,1)) && (Move_8(1,2) <= bx_1(2,2))
C1_Player2 = C1_Player2 + 1;
    elseif (Move_8(1,2) >= bx_2(2,1)) && (Move_8(1,2) <= bx_2 (2,2))
C2_Player2 = C2_Player2 + 1;
    elseif (Move_8(1,2) >= bx_3(2,1)) && (Move_8(1,2) <= bx_3 (2,2))
C3_Player2 = C3_Player2 + 1;
end
%Determine Row (MOVE 8):
if (Move_8(1,1) <= bx_1(1,1)) && (Move_8(1,1) >= bx_1(1,2))
R1_Player2 = R1_Player2 + 1;
    elseif(Move_8(1,1) <= bx_4(1,1)) && (Move_8(1,1) >= bx_4(1,2))
R2_Player2 = R2_Player2 + 1;
    elseif(Move_8(1,1) <= bx_7(1,1)) && (Move_8(1,1) >= bx_7(1,2))
R3_Player2 = R3_Player2 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 8):
if Move_8(1,2) >= bx_9 (2,1) && Move_8(1,1) <= bx_9(1,1)
box_9 = -2;
    elseif Move_8(1,2) >= bx_8 (2,1) && Move_8(1,1) <= bx_8(1,1)
box_8 = -2;
    elseif Move_8(1,2) >= bx_7 (2,1) && Move_8(1,1) <= bx_7(1,1)
box_7 = -2;
    elseif Move_8(1,2) >= bx_6 (2,1) && Move_8(1,1) <= bx_6(1,1)
box_6 = -2;
    elseif Move_8(1,2) >= bx_5 (2,1) && Move_8(1,1) <= bx_5(1,1)
box_5 = -2;
    elseif Move_8(1,2) >= bx_4 (2,1) && Move_8(1,1) <= bx_4(1,1)
box_4 = -2;
    elseif Move_8(1,2) >= bx_3 (2,1) && Move_8(1,1) <= bx_3(1,1)
box_3 = -2;
    elseif Move_8(1,2) >= bx_2 (2,1) && Move_8(1,1) <= bx_2(1,1)
box_2 = -2;
    elseif Move_8(1,2) >= bx_1 (2,1) && Move_8(1,1) <= bx_1(1,1)
box_1 = -2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for Winner
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if sum(C1_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!'); 
break
    elseif sum(C2_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!'); 
break
    elseif sum(C3_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!','I winnn','warn'); 
break
    elseif sum(R1_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!','I winnn','warn'); 
break
    elseif sum(R2_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!', 'I winnn', 'warn'); 
break
    elseif sum(R3_Player2) ==3
msgbox ('Guess I couldnt take it that easy on you!','I winnn','warn'); 
break
    elseif sum(box_1 + box_5 + box_9) == -6
msgbox ('Guess I couldnt take it that easy on you!','I winnn','warn'); 
break
    elseif sum(box_3 + box_5 + box_7) == -6
msgbox ('Guess I couldnt take it that easy on you!', 'I winnn','warn'); 
continue
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE NINE(9) Human: Player 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Move_9 = ginput(1);
scatter (Move_9(1,1),Move_9(1,2),400,[0 0 1],'X'); %scatter formula

%Determine Column (MOVE 9)

if (Move_9(1,1) >= bx_1(2,1)) && (Move_9(1,1) <= bx_1(2,2))
C1_Player1 = C1_Player1 + 1;
    elseif (Move_9(1,1) >= bx_2(2,1)) && (Move_9(1,1) <= bx_2 (2,2))
C2_Player1 = C2_Player1 + 1;
    elseif (Move_9(1,1) >= bx_3(2,1)) && (Move_9(1,1) <= bx_3 (2,2))
C3_Player1 = C3_Player1 + 1;
end

%Determine Row (MOVE 9)
if (Move_9(1,2) >= bx_7(1,2)) && (Move_9(1,2) <= bx_7(1,1))
R3_Player1 = R3_Player1 + 1;
    elseif (Move_9(1,2) >= bx_4(1,2)) && (Move_9(1,2) <= bx_4(1,1))
R2_Player1 = R2_Player1 + 1;
    elseif (Move_9(1,2) >= bx_1(1,2)) && (Move_9(1,2) <= bx_1(1,1))
R1_Player1 = R1_Player1 + 1;
end


%Tic Tac Toe Box (square) description/placement (MOVE 9):
if Move_9(1,1) >= bx_9 (2,1) && Move_9(1,2) <= bx_9(1,1)
box_9 = -1;
    elseif Move_9(1,1) >= bx_8 (2,1) && Move_9(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_9(1,1) >= bx_7 (2,1) && Move_9(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_9(1,1) >= bx_6 (2,1) && Move_9(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_9(1,1) >= bx_5 (2,1) && Move_9(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_9(1,1) >= bx_4 (2,1) && Move_9(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_9(1,1) >= bx_3 (2,1) && Move_9(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_9(1,1) >= bx_2 (2,1) && Move_9(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_9(1,1) >= bx_1 (2,1) && Move_9(1,2) <= bx_1(1,1)
box_1 = -1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Is there finally a winner? (sure hope so)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if sum(C1_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(C2_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(C3_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(R1_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(R2_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(R3_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
 elseif sum(R3_Player1) ~= 3 % No 3 Xs or Os in a row
msgbox('Looks like our skills are matched this time around','Draw','error');
 break
elseif sum(box_1 + box_5 + box_9) == -3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(box_3 + box_5 + box_7) == -3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
continue

 
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% At the end of the game.... would the user like to play again? if user answers
% yes the game will continue to  a new game, if the user selects no a
% dialog box will pop up saying game is over and figure will close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause(3)
promptmessage=sprintf('would you like to play another game of Tic-Tac-Toe?');
Note= 'Yes or No'; %prompts user to select one of two options
player=1;
select= zeros(1,player);
for userNum= 1: player
    button=questdlg(promptmessage, Note, 'Yes','No','yes');
    if strcmpi(button, 'Yes')
        DecisionMaker=1;
    else, strcmpi(button,'No')
       N= msgbox('GAME OVER, Play again soon!');
       grid off
       pause (1)
       close
        return
    end
end
%~~~~~~~ END OF FIRST GAME ~~~~~~~~~~~
while DecisionMaker == 1
    close all
    clc
    % Begin new prompt messsage for new game: repeat all steps from the
    % first game
promptmessage = sprintf('Would you like to play the game of Tic-Tac-Toe?');
    Note= 'Yes or No'; %prompts user to select one of two options
     player=1;
    select= zeros(1,player);
    for userNum= 1: player
    button=questdlg(promptmessage, Note, 'Yes','No','yes');
    if strcmpi(button, 'Yes')
        Yes = 1;
    else, strcmpi(button,'No')
        No = 0;
       return  %If user selects No, messagebox will terminate & game won't cont. 
    end
    end
    
% Prompt Message box 2: Instructions 
  promptmessage =sprintf('Welcome back! Glad you decided to play again. You should be familiar with the rules by now. GOOD LUCK!');
    Note= 'OK or Cancel'; %prompts user to select OK
     player=1;
     select= zeros(1,player);
    for userNum= 1: player
    button=questdlg(promptmessage, Note, 'OK','Cancel', 'OK');
    if strcmpi(button, 'OK')
      OK = 1;
    else, strcmpi(button,'Cancel')
       Cancel = 0;
       return
    end
    end 
   
%Prompt Message Box 2: Who is first
promptmessage =sprintf('Ready to go first?');
    Note= 'yes'; %prompts user to select one of two options
     player=1;
     select= zeros(1,player);
    for userNum= 1: player
    button=questdlg(promptmessage, Note, 'yes','no' ,'yes');
    if strcmpi(button, 'yes')
      yes = 1;
    else, strcmpi(button,'no')
        no = 0;
        return
    end
    end 


    % Next creating the gameboard:
   axis([0 3 0 3]);                           % Sets the dimensions of axis on board
   ax = gca;
   set(ax, 'xTick', 0:3)                       % Sets the Tick marks for x axis on grid
   set(ax, 'yTick', 0:3)                       % Sets the Tick marks for y axis on grid
   set(ax,'XColor','b','linewidth',5)          % Changes the X axis color
   set(ax,'YColor','b','linewidth',5)          % Changes the Y axis color
   xlabel('Let the games begin!')              % Labels the bottom of the grid 
   set(ax,'color','m')
   grid on
   hold on
 
   
   %Place holders of the Tic Tac Toe board
   % Represents each box on the grid
   % Column 1 - 
   box_1 = 5; % square on top left (1,1)
   box_2 = 5; % square on middle left (1,2)
   box_3 = 5; % square on bottom left (1,3)
   % Column 2 -
   box_4 = 5; % square on top middle (2,1)
   box_5 = 5; % square on middle middle (2,2)
   box_6 = 5; % square on bottom middle (2,3)
   % Column 3 - 
   box_7 = 5; % square on top right (3,1)
   box_8 = 5; % square on middle right (3,2)
   box_9 = 5; % square on bottom right (3,3)

%Ranges provided for points of axis inside of the Tic Tac Toe Board: Point
%of reference (0,0) is the top left of the Grid
bx_1 = [3.0 2.0;0.0 1.0];   %coordinates for box 1
bx_2 = [3.0 2.0;1.0 2.0];   %coordinates for box 2
bx_3 = [3.0 2.0;2.0 3.0];   %coordinates for box 3

bx_4 = [2.0 1.0;0.0 1.0];  %coordinates for box 4
bx_5 = [2.0 1.0;1.0 2.0];  %coordinates for box 5
bx_6 = [2.0 1.0;2.0 3.0];  %coordinates for box 6

bx_7 = [1.0 0.0;0.0 1.0];   %coordinates for box 7
bx_8 = [1.0 0.0;1.0 2.0];   %coordinates for box 8
bx_9 = [1.0 0.0;2.0 3.0];   %coordinates for box 9

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main Game Loop Continue until the game ends with a winner or tie.
% Row/Column counter for Player 1 (human)

% Rows of Tic Tac Toe board
R1_Player1 = 0;         % Row One = [3 2];
R2_Player1 = 0;         % Row Two = [2 1];
R3_Player1 = 0;         % Row Three = [1 0];
% Columns of Tic Tac Toe board 
C1_Player1 = 0;         % Column One = [0 1];
C2_Player1 = 0;         % Column Two= [1 2];
C3_Player1 = 0;         % Column Three [2 3];

% Row/column counter for Player 2 (computer)

% Rows of Tic Tac Toe board
R1_Player2 = 0;               % Row One = [3 2];
R2_Player2 = 0;               % Row Two = [2 1];
R3_Player2 = 0;               % Row Three = [1 0];
% Columns of Tic Tac Toe board 
C1_Player2 = 0;               % Column One = [0 1];
C2_Player2 = 0;               % Column Two = [1 2];
C3_Player2 = 0;               % Column Three = [2 3];


% BEGIN THE BEAUTIFUL GAME OF TIC TAC TOE 

% %%%%%%%%%%%%% DISCLAIMER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - THIS CODE DEFINITELY DOESN'T GO WITHOUT FLAWS
% - THERE ARE DEFINITELY A FEW BUMPS - FAMILY AND FRIENDS HELPED MAKE THIS
%   POSSIBLE ... AKA GOOGLE AND FELLOW CLASSMATES .. FAMILY AND FRIENDS 
%   COULDN'T UNDERSTAND THIS EVEN IF THEY WANTED TO...
% - ALSO, AFTER THIS ASSIGNMENT, I FULLY UNDERSTAND THAT I HAVE TAKEN
%   FOR GRANTED THE SIMPLICITY OF THIS GAME SINCE I WAS 4 YEARS OLD. 
% - HOWEVER, I FULLY RESPECT THIS GAME TO THE FULLEST EXTENT NOW...NO DOUBT


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST MOVE of the Game: Human Player
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Move_1 = ginput(1);  % ginput replaces mouse with cross hairs to allow
                     % better accuracy in making a move.
scatter (Move_1(1,1), Move_1(1,2),400,[0 0 1], 'X');
% Scatter formula= scatter(x,y sz, [], 'point on grid')

% Determine the row (move with ranges) (MOVE 1):
if (Move_1(1,2) >= bx_1(2,1)) && (Move_1(1,2) <= bx_7(1,1))
 % AKA if move 1 in row 1, col. 2 is greater than the coordinates of row 2, column 1) 
R3_Player1 = R3_Player1 + 1;
    elseif (Move_1(1,2)>= bx_4(1,2)) && (Move_1(1,2) <= bx_4(1,1))
    elseif (Move_1(1,2) >= bx_1(1,2)) && (Move_1(1,2) <= bx_1(1,1))
R1_Player1 = R1_Player1 + 1;

end 

% Determine the column (move with ranges) (MOVE 1):
if (Move_1(1,1) >= bx_1(2,1)) && (Move_1(1,1) <= bx_1(2,2))
C1_Player1 = C1_Player1 + 1;
    elseif (Move_1(1,1) >= bx_2(2,1)) && (Move_1(1,1) <= bx_2 (2,2))
C2_Player1 = C2_Player1 + 1;
    elseif (Move_1(1,1) >= bx_3(2,1)) && (Move_1(1,1) <= bx_3 (2,2))
C3_Player1 = C3_Player1 + 1;
end
 
% Tic Tac Toe Box (square) description/placement (MOVE 1):
% Helps to show the computer not to move in that particular square that
% the player just made their move to
if Move_1(1,1) >= bx_9(2,1) && Move_1(1,2) <= bx_9(1,1) 
box_9 = -1;
    elseif Move_1(1,1) >= bx_8 (2,1) && Move_1(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_1(1,1) >= bx_7 (2,1) && Move_1(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_1(1,1) >= bx_6 (2,1) && Move_1(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_1(1,1) >= bx_5 (2,1) && Move_1(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_1(1,1) >= bx_4 (2,1) && Move_1(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_1(1,1) >= bx_3 (2,1) && Move_1(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_1(1,1) >= bx_2 (2,1) && Move_1(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_1(1,1) >= bx_1 (2,1) && Move_1(1,2) <= bx_1(1,1)
box_1 = -1;
end 
pause(1) % pause so that the computer's play isn't instantaneous

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE TWO (2): Computer: Player 2
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pretty much repeat all steps from first move except replace player(human)
% with computer model as well as take the mean of the ranges provided

if box_1 > 0 %If square 1 is greater than zero 
Move_2_row = mean(bx_1(1,:));     %Taking the mean(average) of ranges of rows
Move_2_col = mean(bx_1(2,:));     %Taking the mean (average) of ranges of columns
Move_2 = [Move_2_row Move_2_col]; % Move 2 -> row, col.
scatter (Move_2(1,2),Move_2(1,1),400,[0 0 0],'O'); %scatter formula
    elseif box_2 > 0
     Move_2_row = mean(bx_2(1,:));
     Move_2_col = mean(bx_2(2,:));
     Move_2 = [Move_2_row Move_2_col];
     scatter (Move_2(1,2),Move_2(1,1),400,[0 0 0],'O'); %scatter formula
end

%Determine Column (MOVE 2)
if (Move_2(1,2) >= bx_1(2,1)) && (Move_2(1,2) <= bx_1(2,2))  
C1_Comptuer = C1_Player2 + 1;
%AKA if move two in (1,2) is greater than (2,1)
    elseif (Move_2(1,2) >= bx_2(2,1)) && (Move_2(1,2) <= bx_2 (2,2)) %row2
C2_Player2 = C2_Player2 + 1;
    elseif (Move_2(1,2) >= bx_3(2,1)) && (Move_2(1,2) <= bx_3 (2,2)) %row3
C3_Player2 = C3_Player2 + 1;
end

%Determine Row (MOVE 2):
if (Move_2(1,1) <= bx_1(1,1)) && (Move_2(1,1) >= bx_1(1,2))
R1_Player2 = R1_Player2 + 1;
    elseif(Move_2(1,1) <= bx_4(1,2)) && (Move_2(1,1) >= bx_4(1,2))
R2_Player2 = R2_Player2 + 1;
    elseif(Move_2(1,1) <= bx_7(1,2)) && (Move_2(1,1) >= bx_7(1,2))
R3_Player2 = R3_Player2 + 1;
end


%%% Tic Tac Toe Box (square) description/placement (MOVE 2):

if Move_2(1,2) >= bx_9 (2,1) && Move_2(1,1) <= bx_9(1,1)
box_9 = -2;
    elseif Move_2(1,2) >= bx_8 (2,1) && Move_2(1,1) <= bx_8(1,1)
box_8 = -2;
    elseif Move_2(1,2) >= bx_7 (2,1) && Move_2(1,1) <= bx_7(1,1)
box_7 = -2;
    elseif Move_2(1,2) >= bx_6 (2,1) && Move_2(1,1) <= bx_6(1,1)
box_6 = -2;
    elseif Move_2(1,2) >= bx_5 (2,1) && Move_2(1,1) <= bx_5(1,1)
box_5 = -2;
    elseif Move_2(1,2) >= bx_4 (2,1) && Move_2(1,1) <= bx_4(1,1)
box_4 = -2;
    elseif Move_2(1,2) >= bx_3 (2,1) && Move_2(1,1) <= bx_3(1,1)
box_3 = -2;
    elseif Move_2(1,2) >= bx_2 (2,1) && Move_2(1,1) <= bx_2(1,1)
box_2 = -2;
    elseif Move_2(1,2) >= bx_1 (2,1) && Move_2(1,1) <= bx_1(1,1)
box_1 = -2;
end 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE THREE(3): Human: player 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Move_3 = ginput(1);
scatter (Move_3(1,1),Move_3(1,2),400,[0 0 1],'X'); %scatter formula

%Determine Column (MOVE 3)
if (Move_3(1,1) >= bx_1(2,1)) && (Move_3(1,1) <= bx_1(2,2)) 
C1_Player1 = C1_Player1 + 1;
    elseif (Move_3(1,1) >= bx_2(2,1)) && (Move_3(1,1) <= bx_2 (2,2)) 
C2_Player1 = C2_Player1 + 1;
    elseif (Move_3(1,1) >= bx_3(2,1)) && (Move_3(1,1) <= bx_3 (2,2)) 
C3_Player1 = C3_Player1 + 1;
end

%Determine Row (MOVE 3)
if (Move_3(1,2) >= bx_7(1,2)) && (Move_3(1,2) <= bx_7(1,1))
R3_Player1 = R3_Player1 + 1;
    elseif (Move_3(1,2) >= bx_4(1,2)) && (Move_3(1,2) <= bx_4(1,1))
R2_Player1 = R2_Player1 + 1;
    elseif (Move_3(1,2) >= bx_1(1,2)) && (Move_3(1,2) <= bx_1(1,1))
R1_Player1 = R1_Player1 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 3)
if Move_3(1,1) >= bx_9 (2,1) && Move_3(1,2) <= bx_9(1,1)
box_9 = -1;
    elseif Move_3(1,1) >= bx_8 (2,1) && Move_3(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_3(1,1) >= bx_7 (2,1) && Move_3(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_3(1,1) >= bx_6 (2,1) && Move_3(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_3(1,1) >= bx_5 (2,1) && Move_3(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_3(1,1) >= bx_4 (2,1) && Move_3(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_3(1,1) >= bx_3 (2,1) && Move_3(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_3(1,1) >= bx_2 (2,1) && Move_3(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_3(1,1) >= bx_1 (2,1) && Move_3(1,2) <= bx_1(1,1)
box_1 = -1;
end

pause (1) %pause so that the computer's play isn't instantaneous

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  MOVE FOUR(4) Computer: Player 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if box_1 > 0
Move_4_row = mean(bx_1(1,:));
Move_4_col = mean(bx_1(2,:));
Move_4 = [Move_4_row Move_4_col];
scatter (Move_4(1,2),Move_4(1,1),400,[0 0 0],'O');
    elseif box_2 > 0
Move_4_row = mean(bx_2(1,:));
Move_4_col = mean(bx_2(2,:));
Move_4 = [Move_4_row Move_4_col];
scatter (Move_4(1,2),Move_4(1,1),400,[0 0 0],'O');
    elseif box_3 > 0
Move_4_row = mean(bx_3(1,:));
Move_4_col = mean(bx_3(2,:));
Move_4 = [Move_4_row Move_4_col];
scatter (Move_4(1,2),Move_4(1,1),400,[0 0 0],'O');
    elseif box_4 > 0
Move_4_row = mean(bx_4(1,:));
Move_4_col = mean(bx_4(2,:));
Move_4 = [Move_4_row Move_4_col];
scatter (Move_4(1,2),Move_4(1,1),400,[0 0 0],'O');
end

%Determine Column (MOVE 4)
if (Move_4(1,2) >= bx_1(2,1)) && (Move_4(1,2) <= bx_1(2,2)) % row 1 & col. 2
C1_Player2 = C1_Player2 + 1;
    elseif (Move_4(1,2) >= bx_2(2,1)) && (Move_4(1,2) <= bx_2 (2,2)) %row 2 & row col. 2
C2_Player2 = C2_Player2 + 1;
    elseif (Move_4(1,2) >= bx_3(2,1)) && (Move_4(1,2) <= bx_3 (2,2)) %row 3 & col. 2
C3_Player2 = C3_Player2 + 1;
end

%Determine Row (MOVE 4)
if (Move_4(1,1) <= bx_1(1,1)) && (Move_4(1,1) >= bx_1(1,2))
R1_Player2 = R1_Player2 + 1;
    elseif(Move_4(1,1) <= bx_4(1,2)) && (Move_4(1,1) >= bx_4(1,2))
R2_Player2 = R2_Player2 + 1;
    elseif(Move_4(1,1) <= bx_7(1,2)) && (Move_4(1,1) >= bx_7(1,2))
R3_Player2 = R3_Player2 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 4):
if Move_4(1,2) >= bx_9 (2,1) && Move_4(1,1) <= bx_9(1,1)
box_9 = -2;
    elseif Move_4(1,2) >= bx_8 (2,1) && Move_4(1,1) <= bx_8(1,1)
box_8 = -2;
    elseif Move_4(1,2) >= bx_7 (2,1) && Move_4(1,1) <= bx_7(1,1)
box_7 = -2;
    elseif Move_4(1,2) >= bx_6 (2,1) && Move_4(1,1) <= bx_6(1,1)
box_6 = -2;
    elseif Move_4(1,2) >= bx_5 (2,1) && Move_4(1,1) <= bx_5(1,1)
box_5 = -2;
    elseif Move_4(1,2) >= bx_4 (2,1) && Move_4(1,1) <= bx_4(1,1)
box_4 = -2;
    elseif Move_4(1,2) >= bx_3 (2,1) && Move_4(1,1) <= bx_3(1,1)
box_3 = -2;
    elseif Move_4(1,2) >= bx_2 (2,1) && Move_4(1,1) <= bx_2(1,1)
box_2 = -2;
    elseif Move_4(1,2) >= bx_1 (2,1) && Move_4(1,1) <= bx_1(1,1)
box_1 = -2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE FIVE (5) Human: Player 1 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Move_5 = ginput(1);
scatter (Move_5(1,1),Move_5(1,2),400,[0 0 1],'X'); %scatter formula 

%Determine Column (MOVE 5)
if (Move_5(1,1) >= bx_1(2,1)) && (Move_5(1,1) <= bx_1(2,2))%row1
C1_Player1 = C1_Player1 + 1;
    elseif (Move_5(1,1) >= bx_2(2,1)) && (Move_5(1,1) <= bx_2 (2,2)) %row2
C2_Player1 = C2_Player1 + 1;
    elseif (Move_5(1,1) >= bx_3(2,1)) && (Move_5(1,1) <= bx_3 (2,2)) %row3
C3_Player1 = C3_Player1 + 1;
end

%Determine Row (MOVE 5)
if (Move_5(1,2) >= bx_7(1,2)) && (Move_5(1,2) <= bx_7(1,1))
R3_Player1 = R3_Player1 + 1;
    elseif (Move_5(1,2) >= bx_4(1,2)) && (Move_5(1,2) <= bx_4(1,1))
R2_Player1 = R2_Player1 + 1;
    elseif (Move_5(1,2) >= bx_1(1,2)) && (Move_5(1,2) <= bx_1(1,1))
R1_Player1 = R1_Player1 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 5):
if Move_5(1,1) >= bx_9 (2,1) && Move_5(1,2) <= bx_9(1,1)
box_9 = -1;
    elseif Move_5(1,1) >= bx_8 (2,1) && Move_5(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_5(1,1) >= bx_7 (2,1) && Move_5(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_5(1,1) >= bx_6 (2,1) && Move_5(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_5(1,1) >= bx_5 (2,1) && Move_5(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_5(1,1) >= bx_4 (2,1) && Move_5(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_5(1,1) >= bx_3 (2,1) && Move_5(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_5(1,1) >= bx_2 (2,1) && Move_5(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_5(1,1) >= bx_1 (2,1) && Move_5(1,2) <= bx_1(1,1)
box_1 = -1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% After five moves check conditions for a winner 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clarificaton of winner of the game

win_1 = {'You got lucky this time! Congrats on the win!','You Winnn','warn'};
win_2 = {'Guess I couldnt take it that easy on you!'}; 
win_3 = {'Looks like our skills are matched this time around. We Tied'};

Player1wins= win_1;
Player2wins= win_2;
Tie = win_3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for a Winner?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:2:9
if sum(C1_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(C2_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(C3_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(R1_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(R2_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(R3_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(box_1 + box_5 + box_9) == -3
msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(box_3 + box_5 + box_7) == -3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
end


% No Winner? Game will continue on to a move 6

pause(1) %pause so that the computer's play isn't instantaneous

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE SIX(6): Computer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if box_1 > 0
Move_6_row = mean(bx_1(1,:));
Move_6_col = mean(bx_1(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O');
    elseif box_2 > 0
Move_6_row = mean(bx_2(1,:));
Move_6_col = mean(bx_2(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O');
    elseif box_3 > 0
Move_6_row = mean(bx_3(1,:));
Move_6_col = mean(bx_3(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O');
    elseif box_4 > 0
Move_6_row = mean(bx_4(1,:));
Move_6_col = mean(bx_4(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O');
    elseif box_5 > 0
Move_6_row = mean(bx_5(1,:));
Move_6_col = mean(bx_5(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O');
    elseif box_6 > 0
Move_6_row = mean(bx_6(1,:));
Move_6_col = mean(bx_6(2,:));
Move_6 = [Move_6_row Move_6_col];
scatter (Move_6(1,2),Move_6(1,1),400,[0 0 0],'O');
end

%Determine Column (MOVE 6)

if (Move_6(1,2) >= bx_1(2,1)) && (Move_6(1,2) <= bx_1(2,2))
C1_Player2 = C1_Player2 + 1;
    elseif (Move_6(1,2) >= bx_2(2,1)) && (Move_6(1,2) <= bx_2 (2,2))
C2_Player2 = C2_Player2 + 1;
    elseif (Move_6(1,2) >= bx_3(2,1)) && (Move_6(1,2) <= bx_3 (2,2))
C3_Player2 = C3_Player2 + 1;
end

%Determine Row (MOVE 6)
if (Move_6(1,1) <= bx_1(1,1)) && (Move_6(1,1) >= bx_1(1,2))
R1_Player2 = R1_Player2 + 1;
    elseif(Move_6(1,1) <= bx_4(1,1)) && (Move_6(1,1) >= bx_4(1,2))
R2_Player2 = R2_Player2 + 1;
    elseif(Move_6(1,1) <= bx_7(1,1)) && (Move_6(1,1) >= bx_7(1,2))
R3_Player2 = R3_Player2 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 6):
if Move_6(1,2) >= bx_9 (2,1) && Move_6(1,1) <= bx_9(1,1)
box_9 = -2;
    elseif Move_6(1,2) >= bx_8 (2,1) && Move_6(1,1) <= bx_8(1,1)
box_8 = -2;
    elseif Move_6(1,2) >= bx_7 (2,1) && Move_6(1,1) <= bx_7(1,1)
box_7 = -2;
    elseif Move_6(1,2) >= bx_6 (2,1) && Move_6(1,1) <= bx_6(1,1)
box_6 = -2;
    elseif Move_6(1,2) >= bx_5 (2,1) && Move_6(1,1) <= bx_5(1,1)
box_5 = -2;
    elseif Move_6(1,2) >= bx_4 (2,1) && Move_6(1,1) <= bx_4(1,1)
box_4 = -2;
    elseif Move_6(1,2) >= bx_3 (2,1) && Move_6(1,1) <= bx_3(1,1)
box_3 = -2;
    elseif Move_6(1,2) >= bx_2 (2,1) && Move_6(1,1) <= bx_2(1,1)
box_2 = -2;
    elseif Move_6(1,2) >= bx_1 (2,1) && Move_6(1,1) <= bx_1(1,1)
box_1 = -2;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for a Winner: Computer: Player 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if sum(C1_Player2) == 3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(C2_Player2) == 3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(C3_Player2) == 3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(R1_Player2) == 3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(R2_Player2) ==3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(R3_Player2) ==3
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
break
    elseif sum(box_1 + box_5 + box_9) == -6
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');   
break
    elseif sum(box_3 + box_5 + box_7) == -6
    msgbox('Guess I couldnt take it that easy on you!','I win','warn');
continue
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE SEVEN(7): Human: Player 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Move_7 = ginput(1);
scatter (Move_7(1,1),Move_7(1,2),400,[0 0 1],'X'); %scatter formula

%Determine Column (MOVE 7)
if (Move_7(1,1) >= bx_1(2,1)) && (Move_7(1,1) <= bx_1(2,2)) %row1
C1_Player1 = C1_Player1 + 1;
    elseif (Move_7(1,1) >= bx_2(2,1)) && (Move_7(1,1) <= bx_2 (2,2)) %row2
C2_Player1 = C2_Player1 + 1;
    elseif (Move_7(1,1) >= bx_3(2,1)) && (Move_7(1,1) <= bx_3 (2,2)) %row3
C3_Player1 = C3_Player1 + 1;
end
%Determine Row (MOVE 7)
if (Move_7(1,2) >= bx_7(1,2)) && (Move_7(1,2) <= bx_7(1,1))
R3_Player1 = R3_Player1 + 1;
    elseif (Move_7(1,2) >= bx_4(1,2)) && (Move_7(1,2) <= bx_4(1,1))
R2_Player1 = R2_Player1 + 1;
    elseif (Move_7(1,2) >= bx_1(1,2)) && (Move_7(1,2) <= bx_1(1,1))
R1_Player1= R1_Player1 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 7):
if Move_7(1,1) >= bx_9 (2,1) && Move_7(1,2) <= bx_9(1,1)
box_9 = -1;
    elseif Move_7(1,1) >= bx_8 (2,1) && Move_7(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_7(1,1) >= bx_7 (2,1) && Move_7(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_7(1,1) >= bx_6 (2,1) && Move_7(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_7(1,1) >= bx_5 (2,1) && Move_7(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_7(1,1) >= bx_4 (2,1) && Move_7(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_7(1,1) >= bx_3 (2,1) && Move_7(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_7(1,1) >= bx_2 (2,1) && Move_7(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_7(1,1) >= bx_1 (2,1) && Move_7(1,2) <= bx_1(1,1)
box_1 = -1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for Winner? Player 1 (Human)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if sum(C1_Player1) == 3
 msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
    elseif sum(C2_Player1) == 3
  msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');   
break
    elseif sum(C3_Player1) == 3
   msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(R1_Player1) == 3
 msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(R2_Player1) ==3
 msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(R3_Player1) ==3
 msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(box_1 + box_5 + box_9) == -3
  msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');  
break
    elseif sum(box_3 + box_5 + box_7) == -3
msgbox('You got lucky this time! Congrats on the win!','You Winnn','warn');
continue
end

pause (1) %pause so that the computer's play isn't instantaneous

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE EIGHT(8): Computer: Player 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if box_1 > 0
Move_8_row = mean(bx_1(1,:));
Move_8_col = mean(bx_1(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_2 > 0
Move_8_row = mean(bx_2(1,:));
Move_8_col = mean(bx_2(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_3 > 0
Move_8_row = mean(bx_3(1,:));
Move_8_col = mean(bx_3(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');

    elseif box_4 > 0
Move_8_row = mean(bx_4(1,:));
Move_8_col = mean(bx_4(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_5 > 0
Move_8_row = mean(bx_5(1,:));
Move_8_col = mean(bx_5(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_6 > 0
Move_8_row = mean(bx_6(1,:));
Move_8_col = mean(bx_6(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');

    elseif box_7 > 0
Move_8_row = mean(bx_7(1,:));
Move_8_col = mean(bx_7(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
    elseif box_8 > 0
Move_8_row = mean(bx_8(1,:));
Move_8_col = mean(bx_8(2,:));
Move_8 = [Move_8_row Move_8_col];
scatter (Move_8(1,2),Move_8(1,1),400,[0 0 0],'O');
end
%Determine Column (MOVE 8)
if (Move_8(1,2) >= bx_1(2,1)) && (Move_8(1,2) <= bx_1(2,2))
C1_Player2 = C1_Player2 + 1;
    elseif (Move_8(1,2) >= bx_2(2,1)) && (Move_8(1,2) <= bx_2 (2,2))
C2_Player2 = C2_Player2 + 1;
    elseif (Move_8(1,2) >= bx_3(2,1)) && (Move_8(1,2) <= bx_3 (2,2))
C3_Player2 = C3_Player2 + 1;
end
%Determine Row (MOVE 8)
if (Move_8(1,1) <= bx_1(1,1)) && (Move_8(1,1) >= bx_1(1,2))
R1_Player2 = R1_Player2 + 1;
    elseif(Move_8(1,1) <= bx_4(1,1)) && (Move_8(1,1) >= bx_4(1,2))
R2_Player2 = R2_Player2 + 1;
    elseif(Move_8(1,1) <= bx_7(1,1)) && (Move_8(1,1) >= bx_7(1,2))
R3_Player2 = R3_Player2 + 1;
end

%Tic Tac Toe Box (square) description/placement (MOVE 8):
if Move_8(1,2) >= bx_9 (2,1) && Move_8(1,1) <= bx_9(1,1)
box_9 = -2;
    elseif Move_8(1,2) >= bx_8 (2,1) && Move_8(1,1) <= bx_8(1,1)
box_8 = -2;
    elseif Move_8(1,2) >= bx_7 (2,1) && Move_8(1,1) <= bx_7(1,1)
box_7 = -2;
    elseif Move_8(1,2) >= bx_6 (2,1) && Move_8(1,1) <= bx_6(1,1)
box_6 = -2;
    elseif Move_8(1,2) >= bx_5 (2,1) && Move_8(1,1) <= bx_5(1,1)
box_5 = -2;
    elseif Move_8(1,2) >= bx_4 (2,1) && Move_8(1,1) <= bx_4(1,1)
box_4 = -2;
    elseif Move_8(1,2) >= bx_3 (2,1) && Move_8(1,1) <= bx_3(1,1)
box_3 = -2;
    elseif Move_8(1,2) >= bx_2 (2,1) && Move_8(1,1) <= bx_2(1,1)
box_2 = -2;
    elseif Move_8(1,2) >= bx_1 (2,1) && Move_8(1,1) <= bx_1(1,1)
box_1 = -2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check for Winner
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if sum(C1_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!'); 
break
    elseif sum(C2_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!'); 
break
    elseif sum(C3_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!','I winnn','warn'); 
break
    elseif sum(R1_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!','I winnn','warn'); 
break
    elseif sum(R2_Player2) == 3
msgbox ('Guess I couldnt take it that easy on you!', 'I winnn', 'warn'); 
break
    elseif sum(R3_Player2) ==3
msgbox ('Guess I couldnt take it that easy on you!','I winnn','warn'); 
break
    elseif sum(box_1 + box_5 + box_9) == -6
msgbox ('Guess I couldnt take it that easy on you!','I winnn','warn'); 
break
    elseif sum(box_3 + box_5 + box_7) == -6
msgbox ('Guess I couldnt take it that easy on you!', 'I winnn','warn'); 
continue
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVE NINE(9) Human: Player 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Move_9 = ginput(1);
scatter (Move_9(1,1),Move_9(1,2),400,[0 0 1],'X'); %scatter formula

%Determine Column
if (Move_9(1,1) >= bx_1(2,1)) && (Move_9(1,1) <= bx_1(2,2))
C1_Player1 = C1_Player1 + 1;
    elseif (Move_9(1,1) >= bx_2(2,1)) && (Move_9(1,1) <= bx_2 (2,2))
C2_Player1 = C2_Player1 + 1;
    elseif (Move_9(1,1) >= bx_3(2,1)) && (Move_9(1,1) <= bx_3 (2,2))
C3_Player1 = C3_Player1 + 1;
end
%Determine Row (MOVE 9)
if (Move_9(1,2) >= bx_7(1,2)) && (Move_9(1,2) <= bx_7(1,1))
R3_Player1 = R3_Player1 + 1;
    elseif (Move_9(1,2) >= bx_4(1,2)) && (Move_9(1,2) <= bx_4(1,1))
R2_Player1 = R2_Player1 + 1;
    elseif (Move_9(1,2) >= bx_1(1,2)) && (Move_9(1,2) <= bx_1(1,1))
R1_Player1 = R1_Player1 + 1;
end


%Tic Tac Toe Box (square) description/placement (MOVE 9):
if Move_9(1,1) >= bx_9 (2,1) && Move_9(1,2) <= bx_9(1,1)
box_9 = -1;
    elseif Move_9(1,1) >= bx_8 (2,1) && Move_9(1,2) <= bx_8(1,1)
box_8 = -1;
    elseif Move_9(1,1) >= bx_7 (2,1) && Move_9(1,2) <= bx_7(1,1)
box_7 = -1;
    elseif Move_9(1,1) >= bx_6 (2,1) && Move_9(1,2) <= bx_6(1,1)
box_6 = -1;
    elseif Move_9(1,1) >= bx_5 (2,1) && Move_9(1,2) <= bx_5(1,1)
box_5 = -1;
    elseif Move_9(1,1) >= bx_4 (2,1) && Move_9(1,2) <= bx_4(1,1)
box_4 = -1;
    elseif Move_9(1,1) >= bx_3 (2,1) && Move_9(1,2) <= bx_3(1,1)
box_3 = -1;
    elseif Move_9(1,1) >= bx_2 (2,1) && Move_9(1,2) <= bx_2(1,1)
box_2 = -1;
    elseif Move_9(1,1) >= bx_1 (2,1) && Move_9(1,2) <= bx_1(1,1)
box_1 = -1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Is there finally a winner? (sure hope so)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if sum(C1_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(C2_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(C3_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(R1_Player1) == 3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(R2_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(R3_Player1) ==3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
 elseif sum(R3_Player1) ~= 3 % No 3 Xs or Os in a row
msgbox('Looks like our skills are matched this time around','Draw','error');
 break
elseif sum(box_1 + box_5 + box_9) == -3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
break
elseif sum(box_3 + box_5 + box_7) == -3
msgbox ('You got lucky this time! Congrats on the win!','You Winnn','warn');
continue

 
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% At the end of the game.... would the user like to play again? if user answers
% yes the game will continue to  a new game, if the user selects no a
% dialog box will pop up saying game is over and figure will close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause(3)
promptmessage=sprintf('would you like to play another game of Tic-Tac-Toe?');
Note= 'Yes or No'; %prompts user to select one of two options
player=1;
select= zeros(1,player);
for userNum= 1: player
    button=questdlg(promptmessage, Note, 'Yes','No','yes');
    if strcmpi(button, 'Yes')
        select(player)=1;
    else, strcmpi(button,'No')
       N= msgbox('GAME OVER, Play again soon!');
       grid off
       pause (1)
       close
        return
    end
end


end
