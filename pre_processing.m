clewr all;
close all;
clc;


filename= 'E:\HAWK\Database\dataset_original\c5yvn32dzg-2\Photos\C2P23E2.jpg'; 
rgb = imread(filename);

figure;
imshow(rgb);

rgb=pre_processing(rgb);