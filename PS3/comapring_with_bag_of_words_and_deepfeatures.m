load('count.mat')
fprintf('reading frame %d of %d\n', 1, length(fnames));

fname = [siftdir '/' fnames(335).name];
load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
numfeats = size(descriptors,5);

imname = [framesdir '/' imname]; % add the full path
im = imread(imname);
imshow(im);
d = count(:,335);
g= zeros(length(fnames),1);

for i=1:length(fnames)
    fprintf('reading frame %d of %d\n', i, length(fnames));
    e = count(:,i);
    f = norm(d)*norm(e);
    g(i,1) = (dot(d,e)/f);
end

pause;

for i = 1:10
    [~,Ind]= max(g);
    g(Ind,1) = 0;
    fname = [siftdir '/' fnames(Ind).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    subplot(2,5,i);
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
    imshow(im) 
end
pause;
clc; close all;

fprintf('reading frame %d of %d\n', 1, length(fnames));

fname = [siftdir '/' fnames(4444).name];
load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
numfeats = size(descriptors,5);

imname = [framesdir '/' imname]; % add the full path
im = imread(imname);
imshow(im);
d = count(:,4444);
g= zeros(length(fnames),1);

for i=1:length(fnames)
    fprintf('reading frame %d of %d\n', i, length(fnames));
    e = count(:,i);
    f = norm(d)*norm(e);
    g(i,1) = (dot(d,e)/f);
end

pause;

for i = 1:10
    [~,Ind]= max(g);
    g(Ind,1) = 0;
    fname = [siftdir '/' fnames(Ind).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    subplot(2,5,i);
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
    imshow(im) 
  
end

pause;
clc; close all;


fprintf('reading frame %d of %d\n', 1, length(fnames));

fname = [siftdir '/' fnames(335).name];
load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients','deepFC7');
numfeats = size(descriptors,5);
cara = deepFC7;
imname = [framesdir '/' imname]; % add the full path
im = imread(imname);
imshow(im);
d = count(:,335);
g= zeros(length(fnames),1);


for i=1:length(fnames)
    fname = [siftdir '/' fnames(i).name];
    fprintf('reading frame %d of %d\n', i, length(fnames));
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients','deepFC7');
    f = norm(cara)*norm(deepFC7);
    g(i,1) = (dot(cara,deepFC7)/f);
end

pause;

for i = 1:10
    [~,Ind]= max(g);
    g(Ind,1) = 0;
    fname = [siftdir '/' fnames(Ind).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    subplot(2,5,i);
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
    imshow(im) 
  
end

pause;
clc; close all;


fprintf('reading frame %d of %d\n', 1, length(fnames));

fname = [siftdir '/' fnames(4444).name];
load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients','deepFC7');
numfeats = size(descriptors,5);
cara = deepFC7;
imname = [framesdir '/' imname]; % add the full path
im = imread(imname);
imshow(im);
d = count(:,4444);
g= zeros(length(fnames),1);


for i=1:length(fnames)
    fname = [siftdir '/' fnames(i).name];
    fprintf('reading frame %d of %d\n', i, length(fnames));
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients','deepFC7');
    f = norm(cara)*norm(deepFC7);
    g(i,1) = (dot(cara,deepFC7)/f);
end

pause;

for i = 1:10
    [~,Ind]= max(g);
    g(Ind,1) = 0;
    fname = [siftdir '/' fnames(Ind).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    subplot(2,5,i);
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
    imshow(im) 
  
end

pause;




s