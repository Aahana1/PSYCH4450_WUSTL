% Author: Aahana Bajracharya
% Date: 11/10/2020
% This code plots Framewise Displacement using the realignment parameters

sub_folder = 'young'; % change this to young or older
subID = 'sub-01'; % change this to your desired subject
session = 'LISTEN01'; % change this to the specific session (LISTEN01, LISTEN02, REPEAT01, REPEAT02)

filename = "\Users\aahan\Desktop\Psych4450\ds002382_fMRI_data_partial\" + sub_folder+"\" + subID + "\func\rp_" + subID + "_task-" + session + "_bold.txt";

fileID = fopen(filename); % opening the file
rp = textscan(fileID,'%f %f %f %f %f %f'); % extracting the 6 columns of data from the file you specified above
fclose(fileID); % closing the file

xTrans = rp{1}; % extracting and storing the 1st column of rp (x translation)
yTrans = rp{2}; % extracting and storing the 2nd column of rp (y translation)
zTrans = rp{3}; % extracting and storing the 3rd column of rp (z translation)
xRot = rp{4}; % extracting and storing the 4th column of rp (x rotation)
yRot = rp{5}; % extracting and storing the 5th column of rp (y rotation)
zRot = rp{6}; % extracting and storing the 6th column of rp (z rotation)

frames = 185; % max number of timepoints in fMRI sessions for this dataset

FD = zeros(frames,1); % initializing the FD variable to the length of one of the rp, all the columns have the same length

for i=2:length(FD) 
    % Compute the current timepoint minus the previous timepoint for each parameter and add all of the parameters together.
    % Mutiplying by 50 on the rotation parameters to convert it to mm.
    % Refer to MATLAB Basics guide -Part 3 for explanation
    FD(i) = abs(xTrans(i)-xTrans(i-1)) + abs(yTrans(i)-yTrans(i-1)) + abs(zTrans(i)-zTrans(i-1)) + abs(50*(xRot(i)-xRot(i-1))) + abs(50*(yRot(i)-yRot(i-1))) + abs(50*(zRot(i)-zRot(i-1))); 
end

figure;
plot(FD)
ylabel('Framewise Displacement (mm)') 
xlabel('Frame Number') 