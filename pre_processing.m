clear all;
close all;
clc;
           
filename= 'E:\HAWK\Database\dataset_original\c5yvn32dzg-2\Photos\C4P29H2.jpg'; 
rgb = imread(filename);

% 
%  [filename,path] = uigetfile('*.jpg',...
%                'Select an image file','E:\HAWK\Database\dataset_organized\healthy')
%            
% c = imread([path filesep filename]);


[w,h]=size(rgb,1,2);
figure;
imshow(rgb,[]);
 hsv=rgb2hsv(rgb);

% figure;
% hi=histogram(hsv(:,:,3));

for i=1:w
    for k=1:h
        
        if((hsv(i,k,1)>0.5)||(hsv(i,k,1)<0.09)||(hsv(i,k,2)<0.2)||(hsv(i,k,3)>0.8))
            hsv(i,k,1)=0;
            hsv(i,k,2)=0;
            hsv(i,k,3)=0;
        end
        
        
    end
end

rgb = hsv2rgb(hsv);
figure;
imshow(rgb,[]);


 rgb(:,:,2) = bwareaopen(rgb(:,:,2), 200);
g=rgb2gray(rgb);

%  g = edge(g,'Prewitt');

% se = strel('disk',20);
% g=imclose(g,se);
figure;
imshow(g,[]);




 