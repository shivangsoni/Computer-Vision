clc; clear all; close all; profile on;
im = imread('egg.jpg');
[h, w, ~] = size(im);
%radius = 100;
%useGradient = 0;
radius = 8;
useGradient = 0;
center = detect_circles(im, radius, 0)
%[y,x] = ind2sub(size(centers.centers), centers.centers(1));
figure;
imagesc(im);
hold on;
viscircles(center,radius,'LineWidth',1);
saveas(3,'DetectedCircleWithRadius8EggUseGradientEquals0','png');
clc;close all;