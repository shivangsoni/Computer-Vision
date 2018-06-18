function [outputImg, meanColors] = quantize_RGB(origImg, k)

 A = im2double(origImg);
 %A = double(origImg);
 
 row = size(A,1);
 col = size(A,2);
 color = size(A,3);
 
 %Reshape the 3 dim matrix into 2 dim matrix.
 B = reshape(A,row*col,color);
 [index,centers] = kmeans(B,k);
 
 %reshape the output obtained
 index = reshape(index,row,col);
 outputImg = zeros(row,col,color);
 for i = 1:row
     for j = 1:col
         outputImg(i,j,:) = centers(index(i,j),:);
     end
 end
 meanColors = centers;
end
















