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
%% Files organisation. 

%make output directory
if ~isdir('dataset_organized')
    mkdir('dataset_organized');
end
output_path = [pwd filesep 'dataset_organized\'];

%get photos path
photos_path = uigetdir('dataset_original\c5yvn32dzg-2\Photos','Please select the pshotos folder');

%make it easier for the user.. we try to guess the annotation folder
p=split(photos_path,filesep) ;
p(end)={'Annotations'};
p=join(p,filesep);

%get annotation_file labels file
[file,path] = uigetfile({'*.xlsx'},'Please select the annotation_file .xlsx file',char(p));
annotation_filepath=[path filesep file];
annotation_file=table2cell(readtable(annotation_filepath));

%You can here choose between binary labeling or multiclass labeling

label_position = 2; % 2 for binary labeling
                    % 3 for muulticlass labeling

err_copy_photo=[];

tic
for i=1:size(annotation_file,1)
    
    %define file source and destination path
    source_filename=strjoin([string(photos_path) filesep string(annotation_file(i,1))],'');
    destination_filename=strjoin([output_path annotation_file(i,label_position) filesep],'');
    
    %make new label directory, skip if folder exist
    if ~isdir(strjoin([output_path annotation_file(i,label_position)],''))
         mkdir(strjoin(string(['dataset_organized\' annotation_file(i,label_position)]),''));
    end
    try
        %copy the file to the new label folder
        str= "copyfile "+ source_filename + " "+destination_filename;
        eval(str);
    catch Me
        err_copy_photo=[err_copy_photo ; string(i) string(annotation_file(i,1)) Me.message ];
    end
    disp(strjoin(["Photo " string(i) "/" string(size(annotation_file,1)) " Photo name : "  annotation_file(i,1)],...
        ''))
    
   end

disp('copying photos time');
toc

