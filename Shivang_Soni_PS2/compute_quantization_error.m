function [error] = compute_quantization_error(origImg,quantizedImg)
% Min square error.  
origImg = im2double(origImg);
quantizedImg = im2double(quantizedImg);
sub = (origImg - quantizedImg);
sub = sub .* sub;
[h,w,c] = size(origImg);
totalSum = sum(sub(:));
error = totalSum;
end