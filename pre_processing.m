clear all;
close all;
clc;

 [file,path] = uigetfile('*.jpg',...
               'Select an image file','E:\HAWK\Database\dataset_organized\healthy')
              
imagefilename = imgfile(file,path);
c = imread(imagefilename);

figure;
imshow(c);

