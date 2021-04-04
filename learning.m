% clear all;
% close all;
% clc;

net=googlenet();

%run deep network to modify layers 142 and 144
deepNetworkDesigner;

pause;
%tap any to continue

hawk=lgraph_1;  % exported (modified) network from deepNetworkDesigner. 

load('hawk.mat');

imagepath=fullfile('C:\Users\chihi\OneDrive\Bureau\Wael\Programm','dataset_organized');
imds=imageDatastore(imagepath,'IncludeSubfolders',true,'LabelSource','foldernames');

imds.ReadFcn=@(loc)imresize(imread(loc),[224,224]);
[TrainingData,ValidationData]=splitEachLabel(imds,0.8,0.2,'randomized');

opt=trainingOptions('sgdm','InitialLearnRate',0.001,...
    'ValidationData',ValidationData,...
    'Plots','training-progress',...
    'MiniBatchSize',64,...
    'ValidationPatience',3,...
    'ValidationFrequency',10,...
    'ExecutionEnvironment','cpu');
hawk=trainNetwork(TrainingData,hawk,opt);











