clear all;
close all;
clc;
           
filename= 'E:\HAWK\Database\dataset_organized\healthy\C1P14E1.jpg'; 
rgb = imread(filename);

% 
%  [filename,path] = uigetfile('*.jpg',...
%                'Select an image file','E:\HAWK\Database\dataset_organized\healthy')
%            
% c = imread([path filesep filename]);


[w,h]=size(rgb,1,2);
figure;
imshow(rgb); 
% impixelregion;

r=rgb(:,:,1);
g=rgb(:,:,2);
b=rgb(:,:,3);

%reverse green chroma key
for i=1:w
    for k=1:h
          if (g(i,k)<(min(r(i,k),b(i,k))*2))
            g(i,k)=0;
            r(i,k)=0;
            b(i,k)=0;
          end
    end
end

% figure;
% imshow(g,[]);

gf = medfilt2(g,[6 6]);
figure;
imshow(gf,[]);

%%
gfro = bwareaopen(gf, 200);
figure;
imshow(gfro,[]);

%%
rgb(:,:,1)=r;
rgb(:,:,2)=gfro*255;
rgb(:,:,3)=b;

% figure;
% imshow(rgb,[]);




 