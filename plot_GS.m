% Author: Aahana Bajracharya
% Date: 11/10/2020
% This code plots global signal of a the session of your choice

subID = 'sub-03';  %change this as you need

% change the path below
func_path= ['C:\Users\aahan\Desktop\Psych4450\ds002382_fMRI_data_partial\older\' subID '\func'];

session = 'LISTEN01'; %change this as you need
funcData = nifti([func_path '\' subID '_task-' session '_bold.nii']);
funcData = funcData.dat(:,:,:,:);

frames = 185; % max number of timepoints in fMRI sessions for this dataset

% some of the sessions don't have all 185 sessions, so we are filling in the 
% missing frames with the mean value so that the number of frames is consistent for plotting
if size(funcData,4)<frames
    funcData(:,:,:,size(funcData,4):frames) = squeeze(mean(mean(mean(mean(funcData)))));
end

globalSig = squeeze(mean(mean(mean(funcData))))';

figure;
plot(globalSig);
ylabel('Mean BOLD Signal');
xlabel('Frame Number');

figure;
histogram(globalSig);
xlabel('Mean BOLD Signal Values');
ylabel('Number of Instances');

globalSigMean = mean(globalSig);
globalSigStd = std(globalSig);
summary = ['Mean Global Signal is ',num2str(globalSigMean) ,' with standard deviation ', num2str(globalSigStd)];
disp(summary);

