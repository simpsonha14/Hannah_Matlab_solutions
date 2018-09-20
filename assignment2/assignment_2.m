% Hannah Simpson
% 9/13/18
% Kine 6803: Assignment 2


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Chapter 1 Exercises
% Complete exercises 1-6, 11-15, 22, 24-27. Use the following format
% (example shown for exercise 1)
cd '/Users/HannahSimpson/MATLAB-Drive'

%1.)Create a variable to store the atomic weight of copper (63.55).
Copper = 63.55

%2)Create a variable myage and store your age in it. Subtract two from the
%value of the variable. Add one to the value of the variable. Observe 
%the Workspace Window and command History Window as you do this.
myage = 21
myage = myage-2
myage = myage+1


%3)Use the built-in function namelengthmax to find out the maximum number of
%characters that you can have in an identifier name under your version of
%MATLAB.

namelengthmax

%4)Create two variables to store a weight in pounds and ounces. Use who and whos
%to see the variables. Clear one of them and then use who and whos again.

pounds=6;
ounces=80;



%5)Use intmin and intmax to determine the range of values that can be stored in the
%types uint32 and uint64.
intmin('uint32')
intmax('uint32')

intmin('uint64')
intmax('uint64')

%6)Store a number with a decimal place in a double variable (the default).
%Convert the variable to the type int32 and store the result in a new variable.
num=6+6
numi=int32(num);



%11)Create a variable pounds to store a weight in pounds. 
% Convert this to kilograms and assign the result to a variable kilos.
% The conversion factor is 1 kilogram = 2.2 pounds.
pounds=175
pounds/2.2
kilos=pounds/2.2

%12 Create a variable ftemp to store a temperature in degrees Fahrenheit
% (F). Convert this to degrees Celsius (C) and store the result in a 
% variable ctemp. The conversion factor is C = (F - 32) * 5/9.
ftemp=98
F=ftemp
ctemp=(F-32)*5/9




%13 Find another quantity to convert from one system of units to another.
speedmph = 80
speedmeterssec= speedmph*.44704

%14 The function sin calculates and returns the sine of an angle in radians, 
% and the function sind returns the sine of an angle in degrees. Verify 
% that calling the sind function and passing 90 degrees to it results in 1.
% What argument would you pass to sin to obtain the result of 1?
sind(90)
asin(1)
sin(1.5708)



%15 The combined resistance RT of three resistors R1, R2, and R3 in
% parallel is given by 
%                        RT=        1?
%                            1/R1 + 1/R2 + 1/R3
%Create variables for the three resistors and store values in each, and 
%then calculate the combined resistance.
R1= 1;
R2= 2;
R3= 3;
1/((1/R1)+(1/R2)+(1/R3))

%22 In the ASCII character encoding, the letters of the alphabet are, in
% order: ?a? comes before ?b? and also ?A? comes before ?B?. However, which
% comes first e lower or uppercase letters?

'E'&&'e'
%in other words upper case 'E' is equal to lower case 'e', and logical = 1 
% so this is a true statement
% meaning that it does not matter if the letter is uppercase or lower case


%24. What would be the results of the following expressions
'b' >= 'c' - 1
%logical = 1 (True)

 3 == 2 + 1
 %logical = 1 (True)
 
 (3 == 2) + 1
 %ans = 1
 
 xor(5 < 6, 8 > 4 )

%logical= 0 (False)

%25. Create two variables x and y and store numbers in them. Write an 
%expression that would be true if the value of x is greater than 5 or
%if the value of y is less than 10, but not if both of those are true.
x=6
y=9
xor(5<10,'x'>'y')
% or
x>5&&y<10

%26.
(3*10^5)==3e5

%27.
log10(10000)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Chapter 2 Exercises
%complete exercises 1-4, 6-10, 12, 23, 26, 30, 31

%1.Using the colon operator, create the following row vectors:
% 2         3     4      5      6    7 
% 1.1000        1.3000      1.5000   1.7000
% 8         6     4      2 

2:7
1.1:0.2:1.7 
8:-2:1

%2. Give the MATLAB expression that would create a vector (in a variable
% called vec) of 50 elements that range, equally spaced, from 0 to 2p:
linspace(0,2*pi,50)


%3. Write an expression using linspace that will result in the same as 2:
%   0.2: 3.
linspace(2,3,6)


%4. Using the colon operator and also the linspace function, create the
%following row vectors:
%  -5   -4   -3   -2   -1
%   5    7    9
%   8    6    4
mat=[-5:-1]
linspace(-5,-1,5)
mat=[5:2:9]
linspace(5,9,3)
mat=[8:-2:4]
linspace(8,4,3)


%6. Using the colon operator and the transpose operator, create a column 
%  vector that has the values -1 to 1 in steps of 0.5.
mat= [-1:.5:1]'


%7. Write an expression that refers to only the odd-numbered elements in a 
% vector, regardless of the length of the vector. Test your expression on 
% vectors that have both an odd and an even number of elements.
a = [1:100]
a(1:2:end)
a(2:2:end)

%8.Find an efficient way to generate the following matrix:
%    mat=
%        7    8    9   10
%       12    10   8    6

mat= [7:10; 12:-2:6]

%Then, give expressions that will, for the matrix mat,
% refer to the element in the first row, third column
mat(1,3)
% refer to the entire second row
mat(2,:)
% refer to the first two columns.
mat(:,1:2)

%9.Generate a 2 x 4 matrix variable mat. Verify that the number of 
% elements is the product of the number of rows and columns.

mat= [1 2 3 4; 5 6 7 8]

%10.Generate a 2 x 4 matrix variable mat. Replace the first row with
% 1:4. Replace the third column (you decide with which values).

mat= [1:4;2:5]

%12.Create a variable rows that is a random integer in the inclusive range
% from 1 to 5. Create a variable cols that is a random integer in the 
% inclusive range from 1 to 5. Create a matrix of all zeros with the 
% dimensions given by the values of rows and cols. 

rows= randi([1,5],1)
cols= randi([1,5],1)
zeros(rows,cols)

%23. Find the sum 3 + 5 + 7 + 9 + 11.
sum(3+5+7+9+11)


%26.Find the following sum by first creating vectors for the numerators 
% and denominators:
%
%                  3/1 + 5/2 + 7/3 + 9/4
%
nvec=3:2:9
dvec=1:4
sum(nvec./dvec)

%30.Create a vector of five random integers, each in the inclusive range 
% from -10 to 10. Perform each of the following:
%
% Subtract 3 from each element
% Count how many are positive
% Get the absolute valueof each element 
% Find the maximum

k=randi([-10,10],1,5)
z= k-3
sum(k>0)
A=abs(z)
M=max(A)

%31. Create a 3 x 5 matrix . Perform each of the following:
%
% Find the maximum value in each column 
% Find the maximum value in each row 
% Find the maximum value in the entire matrix 
%
newmatrix = randi([1,20],3,5)
max(newmatrix)
max(rot90(newmatrix))
max(max(newmatrix))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Chapter 3 Exercises
%1,4,6,8,13
%


%1. Write a simple script that will calculate the volume of a hollow sphere

% This script calculates the volume of a hollow sphere
% First the radius is assigned
r= 12
R= 15
% The volume is calculated based on the radius, where r is inner radius and 
% R is outer radius
Volsphere= ([4*pi]/3)*([R^3-r^3])


%4. The input function can be used to enter a vector, such as:

vec = input('Enter a vector: ')


%6 Experiment, in the Command Window, with using the fprintf function for 
%realnumbers. Make a note of what happens for each. Use fprintf to print 
%the real number 12345.6789

fprintf('12345.6789\n')
%This prints the number on a new line 
fprintf('%10.4f\n', 12345.6789)
%This prints up to 10 numbers with 4 decimals places 
fprintf('%10.2f\n', 12345.6789)
%This prints up to 10 numbers with 2 decimal places
fprintf('%6.4f\n', 12345.6789)
%This prints up to 6 numbers with 4 decimal places 
fprintf('%2.4f\n', 12345.6789)
%This prints up to 2 numbers with 4 decimal places


%8. In the metric system, fluid flow is measured in cubic meters per second 
% (m3/s). A cubic foot per second (ft3/s) is equivalent to 0.028 m3/s. 
% Write a script titled flowrate that will prompt the user for flow in 
% cubic meters per second and will print the equivalent flow rate in cubic 
% feet per second. Here is an example of running the script. Your script
% must produce output in exactly the same format as this:

%          >> flowrate
%               Enter the flow in m^3/s: 15.2
%               A flow rate of 15.200 meters per sec
%               is equivalent to 542.857 feet per sec
%
%Flowrate
frinms= input('Enter the flow rate in m^3/3:')
fprintf('A flow rate of %.3f cubic meters per second\n', frinms)
fprintf ('is equivalent to %3f cubic feet per second\n', frinms/.028)

%
% 13.In engineering mechanics, a vector is a set of numbers that 
% indicate both magnitude and direction. Units such as velocity and 
% force are vector quantities. An example of a vector could be <2.34, 
% 4.244, 5.323> meters/second. This vector describes the velocity of 
% a particle at a certain point in three-dimensional space, <x,y,z>. 
% In solving problems related to vectors, it?s handy to know the unit 
% vector of a certain measurement. A unit vector is a vector that has 
% a certain direction, but a magnitude of 1. The equation for a unit
% vector in three-dimensional space is:
%
%
x= input ('Enter a value for x:')
y= input ('Enter a value for y:')
z= input ('Enter a value for z:')
vector = [x y z]
u= (vector)/sqrt((x^2)+(y^2)+(z^2))

