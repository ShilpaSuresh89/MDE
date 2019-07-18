%% THIS IS A DEMO FOR IMAGE ENHANCEMENT USING MDE ALGORITHM 
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%Modified differential evolution algorithm for contrast and brightness enhancement of satellite images
%ShilpaSureshShyamLal
%https://doi.org/10.1016/j.asoc.2017.08.019


%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
clc;
close all;
clear all;
%% Read images 


 i = imread('2.png');
 image = im2double(i);

figure
imshow(image);
title('Truecolor Composite (Un-enhanced)')
text(size(image,2), size(image,1) + 15,...
  'Image courtesy of Space Imaging, LLC',...
  'FontSize', 7, 'HorizontalAlignment', 'right')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Rchannel
R=image(:,:,1);
global_meanR = mean(R(:));
BR = mean_n(R);
CR = std_n(R,BR);
im_sizeR = size(R);
%% Gchannel
G=image(:,:,2);
global_meanG = mean(G(:));
BG = mean_n(G);
CG = std_n(G,BG);
im_sizeG = size(G);
%% Bchannel
B=image(:,:,3);
global_meanB = mean(B(:));
BB = mean_n(B);
CB = std_n(B,BB);
im_sizeB = size(B);
%CALL FUNCTION 
parametersR = modified_de(R,global_meanR,BR,CR,im_sizeR);
parametersG = modified_de(G,global_meanG,BG,CG,im_sizeG);
parametersB = modified_de(B,global_meanB,BB,CB,im_sizeB);
enhR = trans(R,parametersR(1),parametersR(2),parametersR(3),parametersR(4),ii,1 );
enhG = trans(G,parametersG(1),parametersG(2),parametersG(3),parametersG(4),ii,2 );
enhB = trans(B,parametersB(1),parametersB(2),parametersB(3),parametersB(4),ii,3 );
enh(:,:,1)=im2uint8(enhR);
enh(:,:,2)=im2uint8(enhG);
enh(:,:,3)=im2uint8(enhB);
subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imshow(enh);

      
    

