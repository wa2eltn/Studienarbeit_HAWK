%% initialization
tic 
%clening
clear all;
close all;
clc ; 

%setting path ( directories and subdirectories )
folder=fileparts(which(mfilename));
addpath(genpath(folder));

disp('Initialization time');
toc
%% image pre processing

%get photos path
photos_path = uigetdir('dataset_original\c5yvn32dzg-2\Photos','Please select the photos folder');

filelist = dir(fullfile(photos_path, '**\*.*'));  %get list of files and folders in any subfolder
filelist = filelist(~[filelist.isdir]); 

photos_out = uigetdir('dataset_trated\c5yvn32dzg-2\Photos','Please select the photos folder');

for i=1:size(filelist,1)
    
 filename=[ filelist(1).folder filesep filelist(i).name];
 rgb=imread(filename);
 rgb=single_image_pre_processing(rgb);
 
 filename=[ photos_out filesep filelist(i).name];
 imwrite(rgb,filename)
   
 disp(strjoin(["Photo " string(i) "/" string(size(filelist,1)) " Photo name : "  filelist(i).name],...
        ''))
      
end

