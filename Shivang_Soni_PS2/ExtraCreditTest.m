clc; clear all; close all; profile on;
im = imread('egg.jpg');
[h, w, ~] = size(im);
radius = 20;
useGradient = 1;

%[y,x] = ind2sub(size(centers.centers), centers.centers(1));
figure;
imagesc(im);
for i=1:radius
    i
    center1 = ExtraCredit(im, i, 1);
    hold on;
    viscircles(center1,i,'LineWidth',1);
end
pause;
saveas(1,'ExtraCreditEgg','png');
clc;close all;