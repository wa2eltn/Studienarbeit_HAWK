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

err_log=[];
for i=1:size(filelist,1)
    try
 filename=[ filelist(i).folder filesep filelist(i).name];
 rgb=imread(filename);
 rgb=single_image_pre_processing(rgb);
 
 imwrite(rgb,filename)
   
 disp(strjoin(["Photo " string(i) "/" string(size(filelist,1)) " Photo name : "  filelist(i).name],...
        ''))
    catch
 
        
        err_log=[err_log ; strjoin(["Photo " string(i) "/" string(size(filelist,1)) " Photo name : "  filelist(i).name],...
        '')];
    
    end
end

