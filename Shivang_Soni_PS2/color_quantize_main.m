clc;clear;close all;

I = imread('fish.jpg');
figure;
imagesc(I);
pause;

[a,b] = quantize_RGB(I,25);
figure;
imshow(a);
title('quantized RGB for k=25')
pause;
saveas(2,'QuantizedRGBForKequal25','png');
im = rgb2hsv(I);
[outputImage, meanHues] = quantize_HSV(im,25);
figure;
imshow(hsv2rgb(outputImage));
title('quantized HSV for k=25')
pause;
saveas(3,'QuantizedHSVForKequal25','png');

figure;
subplot(3, 2, 1);
imshow(I);
title('Original image');
subplot(3,2,2);
imshow(a);
title('Quantized RGB for k=25');
subplot(3,2,3);
imshow(hsv2rgb(outputImage));
title('Quantized HSV for k=25');



%

[o,i] = get_hue_hists(I,25);
subplot(3,2,4)
hist(o,25);
title('histEqual for k=25');
%saveas(5,'HistogramhistEqualforkEqual5','png');
subplot(3,2,5);
hist(i,25);
title('histClustered for k=25')
saveas(4,'SubplotImageForKequal25','png');
pause;

figure;
hist(o,25);
title('Histogram histEqual for k=25');
saveas(5,'HistogramhistEqualforkEqual25','png');
pause;
figure;
hist(i,25);
title('Histogram histCluster for k=25');
saveas(6,'HistogramhistClusterforkEqual25','png');



error = compute_quantization_error(I,a)

[a,b] = quantize_RGB(I,5);
error = compute_quantization_error(I,a)
im = rgb2hsv(I);
[outputImage, meanHues] = quantize_HSV(im,25);
error1 = compute_quantization_error(I,hsv2rgb(outputImage))

im = rgb2hsv(I);
[outputImage, meanHues] = quantize_HSV(im,5);
error2 = compute_quantization_error(I,hsv2rgb(outputImage))