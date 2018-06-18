clc; close all; clear all;
%% load two images properties into the script
load('twoFrameData.mat');
%%Select the polygon
oninds = selectRegion(im1, positions1);
%% select the descriptors based on region of the polygon
descriptor = descriptors1(oninds,:);
size(descriptor);
%% Display SIFT patches for the chosen polygon region.
displaySIFTPatches(positions1(oninds,:), scales1(oninds), orients1(oninds), im1); 
size(descriptors2);
%%Compute the distance between the descriptor choosen from image 1 and 2nd
%%image all descriptors and select the minimum descripto location in image2.
bestdescriptor = dist2(descriptor,descriptors2);
%% Based on the output produced from the dist2 function 2nd descriptor is transposed before computing eucledian dist
%%so transpose the output to fit in the dimensions
[~, oninds2] = min(bestdescriptor');
%%
figure(2); imshow(im2);
displaySIFTPatches(positions2(oninds2,:), scales2(oninds2,:), orients2(oninds2,:), im2); 
%%