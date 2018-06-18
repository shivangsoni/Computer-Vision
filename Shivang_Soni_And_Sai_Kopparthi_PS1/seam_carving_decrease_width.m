I = imread('inputSeamCarvingPrague.jpg');
[row,col] = size(I);
energyMap = energy_img(I);
for i=1:100
    i
    [a,b] = decrease_width(I,energyMap);
    I=a;
    energyMap=b;
end
imshow(I);
[row,col] = size(I);
saveas(1, 'outputReduceWidthPrague','png');
