% Author: Aahana Bajracharya
% Date: 11/10/2020
% This code plots timeseries of a voxel of your choice

subID = 'sub-03';  %change this as you need

% change the path below
func_path= ['C:\Users\aahan\Desktop\Psych4450\ds002382_fMRI_data_partial\older\' subID '\func'];

session = 'LISTEN01';  %change this as you need
funcData = nifti([func_path '\' subID '_task-' session '_bold.nii']);
funcData = funcData.dat(:,:,:,:);

% Type size(funcData) on the command line to check the dimension
% change the X,Y,Z within the dimension of data
X = 48;
Y = 52;
Z = 35;

figure;
plot(squeeze(funcData(X,Y,Z,:)));
ylabel('BOLD Signal');
xlabel('Frame Number');

