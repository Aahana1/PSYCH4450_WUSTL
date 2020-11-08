%Date:10/01/2020 , Aahana , Pscyh 4450
%Unzips the .gz files in the dataset

%You will only need to run this code once each for the older and young folders
%Remember to change the path to YOUR PATH!
%This code loops through the anat and func folders to unzip nii.gz
%It retains the original gz files

%This code is not the most efficient so it might take you about 4-5 mins if
%you run it all at once. If your files are in a cloud location, that might
%take longer too. Also, please make sure that you have enough storage in
%your computer. 

%% Change the path in the 'folder' variable to the dataset location in your computer
% I downloaded the entire dataset but if you only have a subset of the
% subjects, point the path to the folder that contains your subjects. 

% Example: If you have a folder called Dataset with sub01, sub04, sub61,
% then the path would be something like C:\Dataset not the individual
% subject. The code will look through each subject folder autimatically.

folder = 'C:\Users\aahan\Desktop\Psych4450\ds002382_fMRI_data_partial\young'; %change this to older and run the code again
filePattern = fullfile(folder, 'sub*');
fileList = dir(filePattern);

%Structurals 
for i=1:length(fileList)
    subfolder=fileList(i).name;
    subfolder_anat=fullfile(folder,subfolder,'anat');
    cd (subfolder_anat);
    gunzip('*.gz');
   
end

%Functionals
for i=1:length(fileList)
    subfolder=fileList(i).name;
    subfolder_func=fullfile(folder,subfolder,'func');
    cd (subfolder_func);
    gunzip('*.gz');
end