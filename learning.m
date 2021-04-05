clear all;
close all;
clc;

% net=googlenet();
% 
% run deep network to modify layers 142 and 144
% deepNetworkDesigner;
% 
% pause;
% tap any to continue

 

load('hawk.mat');
hawk=lgraph_1;  % exported (modified) network from deepNetworkDesigner.


imagepath=fullfile('C:\Users\chihi\OneDrive\Bureau\Wael\Programm','dataset_organized');
imds=imageDatastore(imagepath,'IncludeSubfolders',true,'LabelSource','foldernames');

imds.ReadFcn=@(loc)imresize(imread(loc),[224,224]);
[TrainingData,ValidationData]=splitEachLabel(imds,0.8,0.2,'randomized');

% opt=trainingOptions('sgdm',...
%     'InitialLearnRate',3e-4,...
%     'ValidationData',ValidationData,...
%     'MaxEpochs',30,...
%     'Plots','training-progress',...
%     'MiniBatchSize',5,...
%     'ValidationFrequency',10,...
%     'ExecutionEnvironment','gpu',...
%     'Shuffle','every-epoch');


opt = trainingOptions('sgdm',...
'MiniBatchSize',5,...
'MaxEpochs',6,...
'InitialLearnRate',3e-4,...
'Shuffle','every-epoch',...
'ValidationData',ValidationData,...
'ValidationFrequency',10,...
'Verbose',false,...
'Plots','training-progress');


hawk=trainNetwork(TrainingData,hawk,opt);








