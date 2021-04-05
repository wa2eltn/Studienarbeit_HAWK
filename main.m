%% initialization

%clening
clear all;
close all;
clc ; 

%setting path ( directories and subdirectories )
folder=fileparts(which(mfilename));
addpath(genpath(folder));

<<<<<<< HEAD
%%

if ~isdir('dataset_organized')
    mkdir('dataset_organized');
end
=======

>>>>>>> data_organisation
