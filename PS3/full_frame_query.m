clc; close all; clear all;
load('kmeans.mat')
addpath('./provided_code/');
framesdir = './frames/';
siftdir = './sift/';
% Get a list of all the .mat files in that directory.
% There is one .mat file per image.
fnames = dir([siftdir '/*.mat']);
fprintf('reading %d total files...\n', length(fnames));
N = 100;  % to visualize a sparser set of the features
count = zeros(K,length(fnames));
% Here I am running across all the frames to get the histogram count for
% each frame
for i=1:length(fnames) 
    fprintf('reading frame %d of %d\n', i, length(fnames));
    % load that file
    fname = [siftdir '/' fnames(i).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    % read in the associated image
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
    %this will help in getting a distance matrix between the mean and the
    %descriptor of this particular frame
    bestdescriptor = dist2(mean,descriptors);
    % then I am getting the an arry(i,e., matrix) which gives cluster value it
    % belongs to the descriptors 
    [~,matrix] =  min(bestdescriptor);
    matrix = matrix';
    % This part will create a matrix called count for every fram(along
    % column frame number) and row the cluster number
    for a = 1:K
       for j = 1:size(matrix,1)
           if(a == matrix(j,1))
               count(a,i) = count(a,i) + 1;
           end
       end
    end  
end
save('count.mat');

clc; close all; clear all;

load('count.mat')
fprintf('reading frame %d of %d\n', 1, length(fnames));

fname = [siftdir '/' fnames(6000).name];
load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
numfeats = size(descriptors,5);

imname = [framesdir '/' imname]; % add the full path
im = imread(imname);

d = count(:,6000);
g= zeros(length(fnames),1);

for i=1:length(fnames)
    fprintf('reading frame %d of %d\n', i, length(fnames));
    e = count(:,i);
    f = norm(d)*norm(e);
    g(i,1) = (dot(d,e)/f);
end
imshow(im);
pause;
figure;
for i = 1:5
    [~,Ind]= max(g);
    g(Ind,1) = 0;
    fname = [siftdir '/' fnames(Ind).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    subplot(1,5,i);
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
    imshow(im) 
     
end
saveas(1,'Image retrival for image 1','png');
clc; close all;   
load('count.mat')
fprintf('reading frame %d of %d\n', 1, length(fnames));

fname = [siftdir '/' fnames(1000).name];
load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
numfeats = size(descriptors,5);

imname = [framesdir '/' imname]; % add the full path
im = imread(imname);

d = count(:,1000);
g= zeros(length(fnames),1);

for i=1:length(fnames)
    fprintf('reading frame %d of %d\n', i, length(fnames));
    e = count(:,i);
    f = norm(d)*norm(e);
    g(i,1) = (dot(d,e)/f);
end
imshow(im);
pause;
figure;
for i = 1:5
    [~,Ind]= max(g);
    g(Ind,1) = 0;
    fname = [siftdir '/' fnames(Ind).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    subplot(1,5,i);
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
    imshow(im) 
    
end
saveas(2,'Image retrival for image 2','png');  
clc; close all;   
load('count.mat')
fprintf('reading frame %d of %d\n', 1, length(fnames));

fname = [siftdir '/' fnames(645).name];
load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
numfeats = size(descriptors,5);

imname = [framesdir '/' imname]; % add the full path
im = imread(imname);

d = count(:,645 );
g= zeros(length(fnames),1);

for i=1:length(fnames)
    fprintf('reading frame %d of %d\n', i, length(fnames));
    e = count(:,i);
    f = norm(d)*norm(e);
    g(i,1) = (dot(d,e)/f);
end
imshow(im);
pause;

figure;
for i = 1:5
    [~,Ind]= max(g);
    g(Ind,1) = 0;
    fname = [siftdir '/' fnames(Ind).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    subplot(1,5,i);
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
    imshow(im) 
end
saveas(3,'Image retrival for image 3','png');
clc; close all; clear all;
