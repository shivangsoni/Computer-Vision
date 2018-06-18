function [outputImg, meanHues] = quantize_HSV(origImg, k)
 row = size(origImg,1);
 col = size(origImg,2);
 B = double(reshape(origImg(:,:,1),row*col,1));
 [index,meanHues] = kmeans(B,k);
%%Reshape the indices
 index = reshape(index,row,col);
 %Only change the pixel corrosponding to hue.
 outputImg = origImg;
 for i = 1:row
     for j = 1:col
        outputImg(i,j,1) = meanHues(index(i,j));
     end
 end
end
