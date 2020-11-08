% Author: Aahana Bajracharya
% Date: 10/23/2020
% This code uses the rp file that you get as an output from realignment and 
% plots the movement paramters(ps- No more screenshots!)

sub_folder = 'young'; % change this to young or older
subject = 'sub-01'; % change this to your desired subject
taskname = 'LISTEN01'; % change this to the specific task (LISTEN01, LISTEN02, REPEAT01, REPEAT02)

% Line below is creating a concatenated version of a filename based on the
% sub_folder, subject and taskname you specify above

% You can directly type in the path instead of using concatenation
% Example: filename = '\Users\aahan\Desktop\Psych4450\ds002382_fMRI_data_partial\young\sub-01\func\rp_sub-01_task-LISTEN01_bold.txt';

filename = "\Users\aahan\Desktop\Psych4450\ds002382_fMRI_data_partial\" + sub_folder+"\" + subject + "\func\rp_" + subject + "_task-" + taskname + "_bold.txt";

fileID = fopen(filename); % opening the file
rp = textscan(fileID,'%f %f %f %f %f %f'); % extracting the 6 columns of data from the file you specified above
fclose(fileID); % closing the file

figure ('Name',subject);
sgtitle(subject + " "+ taskname, 'Fontsize',12); % adds a title with the subject number and taskname 

subplot(2,1,1);
title('Translation');
xlabel('image');
ylabel('mm');

hold on; % making sure all the translation plots are on the same subplot
plot(rp{1},'b'); % extracting the 1st column of rp (x translation) and plotting in blue
plot(rp{2},'g'); % extracting the 2nd column of rp (y translation) and plotting in green
plot(rp{3},'r'); % extracting the 3rd column of rp (z translation) and plotting in red
legend ({'x translation', 'y translation', 'z translation'},'Location','Northwest'); % adds legend and specifies location of the legend box

hold off; % preventing any other plot from being plotted on this subplot

subplot(2,1,2);
title('Rotation');
xlabel('image');
ylabel('degrees');

hold on; 
% multiplying by 180/pi converts the rotation values to degrees from radian
plot(rp{4}*(180/pi),'b'); % x rotation
plot(rp{5}*(180/pi),'g'); % y rotation
plot(rp{6}*(180/pi),'r'); % z rotation
legend ({'pitch', 'roll', 'yaw'},'Location','Northwest'); 

hold off;

