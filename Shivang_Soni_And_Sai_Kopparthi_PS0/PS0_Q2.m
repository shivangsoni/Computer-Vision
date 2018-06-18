I = imread('Img10.jpg');
%Convert the input image to grayscale image
figure
subplot(3, 2, 1)
%imshow(I);
I6 = my_rgb2gray(I);
imshow(I6);
colorbar
axis square;
title('Gray Scale');
%Part B
%Convert the grayscale image to its “negative image”, in which the lightest values appear
%dark and vice versa (i.e., 0 is mapped to 255, 255 is mapped to 0, etc.)
%
subplot(3,2,2)
I2 = my_imcomplement(I6);
imshow(I2)

%colormap gray;
colorbar
%truesize
title('negative Image')
axis square;

%Part C
% Map the input color image to its “mirror image”, i.e., flipping it left to right.
subplot(3,2,3)
I3 = rev_flipdim(I); 
imshow(I3)
colormap gray;
colorbar
%truesize
title('mirror Image')
axis square;
%Part D
%Swap the red and blue color channels of the input color image.
subplot(3,2,4)
%imshow(I)
newII(:,:,3)=I(:,:,1);
newII(:,:,1)=I(:,:,3);
newII(:,:,2)=I(:,:,2);
imshow(newII);
colorbar
axis square;
title('Swap red and blue')
%Part E
%Average the input color image with its mirror image (use typecasting!)
RevertImage = flipdim(I,2);

J = im2double(I);
O = im2double(RevertImage);
subplot(3,2,5)
%FinalImage = (J+O) ./ 2;
FinalImage = (O+J)/2;
imshow(FinalImage);
colorbar
axis square;
title('Average image')
%Part F
%Add or subtract a different random value between [0,255] to every pixel in the grayscale
%image, then threshold the resulting image to have a minimum value of 0 and a maximum value
%of 255.

newImage = add_or_sub(I);
newImage = im2uint8(newImage);
imshow(newImage);
colorbar;
axis square;
title('Add or subtract random value')

function h=my_rgb2gray(I)
h=rgb2gray(I);
end
 
function p1 = my_imcomplement(I6)
 p1 = imcomplement(I6);
end

function p = add_or_sub(I)
newImage1 = rgb2gray(I);
newImage = im2double(newImage1);
subplot(3,2,6);
noisematrix = ceil(rand(size(newImage,1),size(newImage,2))*1);
newImage = newImage + noisematrix;
newImage = mod(newImage,1);
p = newImage;
end

function f= rev_flipdim(I)
 f = flipdim(I , 2);
end