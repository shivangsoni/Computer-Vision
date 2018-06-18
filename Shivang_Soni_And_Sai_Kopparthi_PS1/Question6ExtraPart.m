I = imread('mona.jpg');
I3 = imread('friends.jpg');
figure
title ('original image');
imshow(I)

figure
title ('Horizontal and the vertical seam');
b = energy_img(I3);
a = cumilativeener(b,"Horizonatal");
a = hseamer(a);
A = applyseamx(I3,a);
title ('Horizontal and the vertical seam')
imshow(A);
hold on;
a = cumilativeener(b,"vertical");
d = vseamer(a);
A = applyseamv(A,d);
imshow(A);
pause(5)


%display thwe vertical and horizontal seam for any given particular image
figure
title ('Horizontal and the vertical seam');
b = energy_img(I);
a = cumilativeener(b,"Horizonatal");
a = hseamer(a);
A = applyseamx(I,a);
title ('Horizontal and the vertical seam')
imshow(A);
hold on;
a = cumilativeener(b,"vertical");
d = vseamer(a);
A = applyseamv(A,d);
imshow(A);
pause(5)

figure
title("Friends image")
I1 = imread('friends.jpg');
imread('download.jpg');
imshow(I1);
pause(4);

figure 
title("after resize");
C = imresize(I1,0.8)
imshow(C);
pause(5);

figure 
title("Seam carving of reducing the width")
[img,cu] = toreducewidth(400,I1)
imshow(img);
pause(12)
 
figure
title("Friends image")
I1 = imread('mona.jpg');
imread('mona.jpg');
imshow(I1);
pause(4);

figure 
title("after resize");
C = imresize(I1,0.8)
imshow(C);
pause(5);

figure 
title("Seam carving of reducing the width")
[img,cu] = toreducewidth(200,I1)
imshow(img);

pause(12)

figure
function energyImg = energy_img(im)
   im1 = rgb2gray(im);
   [Gx,Gy] = imgradientxy(im1);
   energyImg = sqrt(Gx .^ 2 + Gy .^ 2);
end
 
function m = cv(energyImg)
   m = zeros(size(energyImg,1),size(energyImg,2));
      % fr the first row to assign the corrresponding intensities
      for j = 1:size(energyImg,2)
          m(1,j) = energyImg(1,j);
      end
       for i  = 2:size(energyImg)
           for j = 1:size(energyImg,2)
               if(j == 1)
                    m(i,j)=energyImg(i,j)+min([m(i-1,j),m(i-1,j+1)]);
               elseif (j == size(energyImg,2))
                    m(i,j)=energyImg(i,j)+min([m(i-1,j),m(i-1,j-1)]);
               else
                   m(i,j)=energyImg(i,j)+min([m(i-1,j-1),m(i-1,j),m(i-1,j+1)]);
               end
           end
       end 
end

function m = ch(energyImg)
m = zeros(size(energyImg,1),size(energyImg,2));
for i = 1:size(energyImg,1)
    m(i,1) =  energyImg(i,1);
end
for  j = 2:size(energyImg,2)
    for i = 1:size(energyImg,1)
        if (i==1)
             m(i,j) = energyImg(i,j)+min([m(i,j-1),m(i+1,j-1)]);
        elseif (i == size(energyImg,1))
            m(i,j) = energyImg(i,j)+min([m(i,j-1),m(i-1,j-1)]);
        else
            m(i,j) = energyImg(i,j)+min([m(i,j-1),m(i-1,j-1),m(i+1,j-1)]);      
        end
    end
end
end

function m = cumilativeener(energyImg,seamdirection)
if(seamdirection == "Horizonatal")
     m = ch(energyImg);
else
     m = cv(energyImg);
end
end

function vseam = vseamer(img)
w = size(img,2);
h = size(img,1);
%To store the indices of the vertical seam column values
vseam = zeros(size(img,1),1);
[value,index]=min(img(h,:));
vseam(h) = index;
for i = h-1:-1:1
    if(vseam(i+1) == 1)
        a = vseam(i+1);
        b = vseam(i+1)+1;
        [value,index] = min(img(i,a:b));
        if(index == 2)
            vseam(i)=vseam(i+1)+1;
        elseif(index == 1)
            vseam(i)=vseam(i+1);
        end
    elseif(vseam(i+1)== w)
        a = vseam(i+1)-1;
        b = vseam(i+1);
        [value,index] = min(img(i,a:b));
        if(index == 2)
            vseam(i)=vseam(i+1);
        elseif(index == 1)
            vseam(i)=vseam(i+1)-1;
        end
    else
        a = vseam(i+1)-1;
        b = vseam(i+1)+1;
        [value,index] = min(img(i,a:b));
        if(index == 3)
            vseam(i)=vseam(i+1)+1;
        elseif(index == 2)
            vseam(i)=vseam(i+1);
        else
            vseam(i)=vseam(i+1)-1;
        end
                
    end
end
end

function I = applyseamx(I,a)
for i = 1:size(I,2)
     I(a(i,1),i,1)=255;
     I(a(i,1),i,2)=0;
     I(a(i,1),i,3)=0;
   
end
end

function hseam = hseamer(img)
w = size(img,2);
h = size(img,1);
%To store the indices of the vertical seam column values
hseam = zeros(size(img,2),1);
[value,index]=min(img(:,w));
hseam(w) = index;
for i = w-1:-1:1
    if(hseam(i+1) == 1)
        a = hseam(i+1);
        b = hseam(i+1)+1;
        [value,index] = min(img(a:b,i));
        if(index == 2)
            hseam(i)=hseam(i+1)+1;
        elseif(index == 1)
            hseam(i)=hseam(i+1);
        end
    elseif (hseam(i+1)== h)
        a = hseam(i+1)-1;
        b = hseam(i+1);
        [value,index] = min(img(a:b,i));
        if(index == 2)
            hseam(i)=hseam(i+1);
        elseif(index == 1)
            hseam(i)=hseam(i+1)-1;
        end
    else
        a = hseam(i+1)-1;
        b = hseam(i+1)+1;
        [value,index] = min(img(a:b,i));
        if(index == 3)
            hseam(i)=hseam(i+1)+1;
        elseif(index == 2)
            hseam(i)=hseam(i+1);
        else
            hseam(i)=hseam(i+1)-1;
        end
    end
end            
end

function I = applyseamv(I,a)
for i = 1:size(I,1)
     I(i,a(i,1),1)=255;
     I(i,a(i,1),2)=0;
     I(i,a(i,1),3)=0;
   
end
 
end

function [nimg,energy] = reducewidthx(img)
b = energy_img(img);
a = cumilativeener(b,"vertical");
a = vseamer(a);
x = size(img,2);
nimg = zeros(size(img,1),size(img,2)-1,size(img,3),'uint8');
energy = zeros(size(img,1),size(img,2)-1,size(img,3),'uint8');
for i = 1:size(img,1)
        nimg(i,:,:)=[img(i,1:a(i)-1,:),img(i,(a(i)+1):size(img,2),:)];     
end
nimg = nimg; 
energy = energy_img(nimg);
end

function [img,cu] = toreducewidth(n,img)
for i = 1:n
    [img,cu] = reducewidthx(img);
    img = img;
end
end

function [nimg,energy] = reduceheight(img)
b = energy_img(img );
a = cumilativeener(b,"Horizonatal");
a = hseamer(a); 
x = size(img,1);
nimg = zeros(size(img,1)-1,size(img,2),size(img,3),'uint8');
energy = zeros(size(img,1)-1,size(img,2),size(img,3),'uint8');
for j  = 1:size(img,2)
    nimg(:,j,:)=[img(1:a(j)-1,j,:),img((a(j)+1):size(img,1),j,:)];
end
nimg = nimg; 
energy = energy_img(nimg);
end

function [img,cu] = toreduceheight(n,img)
for i = 1:n
    [img,cu] = reduceheight(img);
    img = img;
end
end
