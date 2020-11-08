% Author: Aahana Bajracharya
% Date: 10/06/2020
% Reading in nifti files to plot desired brain slices

% The path below is pointing to the location of the folder containing the subject of interest.
% Change it to the path in YOUR computer.
% If you have a mac, it'll probably look something like this:
%%% /Users/aahana/Documents/MATLAB/etc.%%%
yourPath = 'C:\Users\aahan\Desktop\Psych4450\ds002382_fMRI_data_partial\young\';

% We will be using the nifti command to load the image file into MATLAB.
% nifti.m is built into SPM, so you need to have SPM in your path. 
% Refer to Psych 4450 MATLAB basics guide part 1 for this.

sub01_T1 = nifti([yourPath 'sub-01\anat\sub-01_T1w.nii']); % change this to match the folder structure in your computer.

% The information from our nifti file is now in the variable sub01_T1
% But we need to extract the data from the nifti format to a matrix
% Structural MRI data is 3 dimensional 
sub01_data = sub01_T1.dat(:,:,:); % the colons inside the parenthesis represents the 3 dimensions of the data

% Let's check what's in voxel (20,20,1)
sub01_data(20,20,1) % the output is the voxel intensity
sub01_data(200,250,20) % the output is the voxel intensity

% imagesc is used to display images with scaled colors
% We have to use the squeeze() function to get imagesc() to work properly
% squeeze () function changes the size of the multidimensional array to one
% you specify

% Let's check what's in plane x =150 (aka a brain slice with x fixed at 150)
figure; % Coronal slice
imagesc(squeeze(sub01_data(150,:,:)))
axis image; % this makes sure MATLAB doesn't stretch the figure
set(gca,'YDir','normal');% this sets the coordinate plane to start at bottomleft

% Let's check what's in plane y =150 (aka a brain slice with y fixed at 150)
figure; % Axial/Horizontal/Transverse slice
imagesc(squeeze(sub01_data(:,150,:)))
axis image; 
% set(gca,'YDir','normal');% Commenting it out to match SPM output

% Let's check what's in plane z =98 (aka a brain slice with z fixed at 98)
figure; % Sagittal slice
imagesc(squeeze(sub01_data(:,:,98))') % notice the transpose sign. This was done to match the SPM output.
axis image; 
set(gca,'YDir','normal');

%% We can also plot all these in the same figure
% subplot(m,n,p) command helps us do this
% The figure is divided into a mxn grid and p denotes the position of the plot

figure;
% Coronal slice
subplot(3,1,1) % Figure is divided into 3 rows and 1 column and the image will be placed in the top position
imagesc(squeeze(sub01_data(150,:,:)))
axis image; 
set(gca,'YDir','normal');

% Axial/Horizontal/Transverse slice
subplot(3,1,2)
imagesc(squeeze(sub01_data(:,150,:)))
axis image;     
set(gca, 'XAxisLocation', 'top');

% Sagittal slice
subplot(3,1,3)
imagesc(squeeze(sub01_data(:,:,98))')
axis image; 
set(gca,'YDir','normal');

%% Let's plot a montage of slices using a loop
figure;
num_slices= 50:20:250; % Choosing slices that start at 50 and end at 250 with intervals of 20
for i= 1:numel(num_slices) % numel counts the number of elements in the array num_slices
    subplot(4,3,i);
    imagesc(squeeze(sub01_data(num_slices(i),:,:))); % by doing num_slices(i) , we are indexing over each of the elements of the num_slices array
    axis image; 
    set(gca,'YDir','normal');
end
