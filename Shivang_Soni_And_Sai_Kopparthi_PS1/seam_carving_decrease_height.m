I = imread('inputSeamCarvingPrague.jpg');
energyMap = energy_img(I);
for i=1:50
    i
    [a,b] = decrease_height(I,energyMap);
    I=a;
    energyMap=b;
end
imshow(I);
[row,col] = size(I);
saveas(1, 'outputReduceHeightPrague','png');