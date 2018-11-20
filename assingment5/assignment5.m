function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber()
%
%        NAME: HANNAH LAEL SIMPSON
%
%         DUE: November 
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 10 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

while level ~= beginner && level ~= moderate && level ~= advanced 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    % BUG 1: || wouldn't let the user into the loop, everytime a correct input
    % was inputted in an invalid reponse would occur. The user would be
    % unable to get any further than invalid answer. 
    % FIXED: changing || to &&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
fprintf('Sorry, that is not a valid level selection.\n');
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
    % BUG #2: found by running script Incorrect use of '='
    % operator. To assign a value to a variable, use '='. To
    % compare values for equality, use '=='.                    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
highest = beginnerHighest;

elseif level == moderate

highest = moderateHighest;

else
highest = advancedHighest;          
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%     BUG #3: lower cased h of highest needed to be uppercase H = Highest
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% randomly select secret number between 1 and highest for level of play

secretNumber = floor(randi([1, highest]));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BUG #4 random number has to be set from rand to randi, putting bracket
% around 1 & highest, in order to cause a random selection to occur this had
% to be changed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialize number of guesses and User_guess

numOfTries = 1;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly


while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');


while userGuess < 1 || userGuess > highest
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% BUG #5: take the equals sign away from the equality sign [10 was not being
% seen as a valid input]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct

if userGuess < secretNumber 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    % BUG #6: changed the greater than sign to less
    % than to represent the number being lower.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Sorry, %d is too low.\n', userGuess);
elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);
elseif numOfTries == 1
fprintf('\nLucky You!  You got it on your first try!\n\n');
else
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
secretNumber, numOfTries);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      BUG #7: numOftries was added behind secretNumber to count the actual
%      number of tries. Before this was added the game would display for 
%      example: Congratulations! You got 7 in 7 tries. It would just repeat
%      secret number twice. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

end  % of guessing while loop

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%     BUG #8: "end" was missing preventing the code to continue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% end of game