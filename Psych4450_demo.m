% Author: Aahana Bajracharya
% Date: 08/10/2020
% Psych 4450 code demo for MATLAB basics
% Try executing the following one section at a time
% Put cursor on the section of choice and click Run Section from the Editor tab

%% Basic Arithmetic
a = 10;
b = 20;
c = a + b
d = a - b
e = a * b
f = a / b 
g = a \ b
x = 7;
y = 3;
z = x ^ y

% adding a semicolon at the end of a command suppresses the variable from 
% being displayed in the command window upon execution

%% Vectors
x = [1:2:10]; %Row vector
y = [1:2:10]'; %Column vector
z = [10:-2:0]; %Row vector with a list of even numbers in decreasing order

%% For Loop
total = 0;
for x = 0:2:6
    total = total + x^2;
end 
total; %To check the final value along with the variable
disp (total); %Only displays the value in the variable

%% Reading/Writing data
% clear; % clears the workspace entirely 

% change the following path to where you have downloaded slp_data.csv
filename = 'C:\Users\aahan\Desktop\Psych4450\slp_data.csv'; 

% xlsread is relatively faster when the data is in csv format
D = xlsread(filename); % Note: xlsread is not recommended starting MATLAB version 2019a

% Alternative to xlsread could be readtable or importdata
T = readtable('patients.xls'); % best for data that is in a table format and has column headers
% patients.xls is a built-in MATLAB dataset
% click on the variable names in the workspace to explore your data

%% Plot Demo
load polydata.mat %loads the built-in dataset
figure; % generates a new figure
plot (x,y,'r'); % plots the variable x against y, line color red
hold on % holds the most recent plot and enables another plot to be overlayed
plot (x1,y1,'b') % plots the variable x1 against y1, line color blue

title ('Example polynomial fitting');legend ('Data','Polynomial Fit');
xlabel ('x');
ylabel ('y');
hold off


