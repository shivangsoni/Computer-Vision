clc; close all; clear all;
addpath('./provided_code/')
framesdir = 'frames';
siftdir = 'sift';
K = 1700;
nPatches = 20;
Frames = 40;
fnames = dir([siftdir '/*.mat']);
fprintf('reading %d total files...\n', length(fnames));
N = 100;  
featuresa = [];
scalesa = [];
orientationsa = [];
positionsa = [];
frameID = [];
im = [];
for i=1:Frames
    fprintf('reading frame %d \n', i);
    fname = [siftdir '/' fnames(i).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1); 
    fprintf('imname = %s \n', imname);
    randinds = randperm(numfeats);
    nFeatures = min([N,numfeats]);
    featuresa = [featuresa; descriptors(randinds(1:numfeats),:)];
    im = vertcat(im,[framesdir '/' imname]);
    positionsa = [positionsa; positions(randinds(1:numfeats),:)];
    scalesa= [scalesa; scales(randinds(1:numfeats),:)];
    orientationsa = [orientationsa; orients(randinds(1:numfeats),:)];
end
load('kmeans.mat');
%[membership,means,rms] = kmeansML(K,featuresa');
mean = means';

a = [];
b = [];
for i=1:size(membership,1)
    if(membership(i,1) == 1)
        a = vertcat(a,i);
    elseif(membership(i,1) == 2)
        b = vertcat(b,i) ;
    end
end

features1 = [];
scales1 = [];
orientations1 = [];
positions1 = [];
frameID1 = [];
im1 = [];
for i=1:25
scales1 = vertcat(scales1,scalesa(a(i,1),:));
orientations1 = vertcat(orientations1,orientationsa(a(i,1),:));
positions1 = vertcat(positions1,positionsa(a(i,1),:));
im1 = vertcat(im1,im(a(i,1),:));
end

features2 = [];
scales2 = [];
orientations2 = [];
positions2 = [];
frameID2 = [];
im2 = [];
for i=1:25 
scales2 = vertcat(scales2,scalesa(b(i,1),:));
orientations2 = vertcat(orientations2,orientationsa(b(i,1),:));
positions2 = vertcat(positions2,positionsa(b(i,1),:));
im2 = vertcat(im2,im(b(i,1),:));
end

figure;
for i = 1:25
    ima =imread(im1(i,:));
    ima = rgb2gray(ima);
    subplot(5,5,i);   
    patch = getPatchFromSIFTParameters(positions1(i,:), scales1(i,:), orientations1(i,:), ima);
    imshow(patch);
end
pause;  
saveas(1,'PatchesKequal1','png');
figure;
for i = 1:25
    imb =imread(im2(i,:));clc; close all; clear all;
addpath('./provided_code/')
framesdir = 'frames';
siftdir = 'sift';
K = 1700;
nPatches = 20;
Frames = 40;
fnames = dir([siftdir '/*.mat']);
fprintf('reading %d total files...\n', length(fnames));
N = 100;  
featuresa = [];
scalesa = [];
orientationsa = [];
positionsa = [];
frameID = [];
im = [];
for i=1:Frames
    fprintf('reading frame %d \n', i);
    fname = [siftdir '/' fnames(i).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1); 
    fprintf('imname = %s \n', imname);
    randinds = randperm(numfeats);
    nFeatures = min([N,numfeats]);
    featuresa = [featuresa; descriptors(randinds(1:numfeats),:)];
    im = vertcat(im,[framesdir '/' imname]);
    positionsa = [positionsa; positions(randinds(1:numfeats),:)];
    scalesa= [scalesa; scales(randinds(1:numfeats),:)];
    orientationsa = [orientationsa; orients(randinds(1:numfeats),:)];
end
load('kmeans.mat');
%[membership,means,rms] = kmeansML(K,featuresa');
mean = means';

a = [];
b = [];
for i=1:size(membership,1)
    if(membership(i,1) == 1)
        a = vertcat(a,i);
    elseif(membership(i,1) == 2)
        b = vertcat(b,i) ;
    end
end

features1 = [];
scales1 = [];
orientations1 = [];
positions1 = [];
frameID1 = [];
im1 = [];
for i=1:25
scales1 = vertcat(scales1,scalesa(a(i,1),:));
orientations1 = vertcat(orientations1,orientationsa(a(i,1),:));
positions1 = vertcat(positions1,positionsa(a(i,1),:));
im1 = vertcat(im1,im(a(i,1),:));
end

features2 = [];
scales2 = [];
orientations2 = [];
positions2 = [];
frameID2 = [];
im2 = [];
for i=1:25 
scales2 = vertcat(scales2,scalesa(b(i,1),:));
orientations2 = vertcat(orientations2,orientationsa(b(i,1),:));
positions2 = vertcat(positions2,positionsa(b(i,1),:));
im2 = vertcat(im2,im(b(i,1),:));
end

figure;
for i = 1:25
    ima =imread(im1(i,:));
    ima = rgb2gray(ima);
    subplot(5,5,i);   
    patch = getPatchFromSIFTParameters(positions1(i,:), scales1(i,:), orientations1(i,:), ima);
    imshow(patch);
end
pause;  
saveas(1,'PatchesKequal1','png');
figure;
for i = 1:25
    imb =imread(im2(i,:));
    imb = rgb2gray(imb);
    subplot(5,5,i);
    patch = getPatchFromSIFTParameters(positions2(i,:), scales2(i,:), orientations2(i,:), imb);
    imshow(patch)
end
saveas(2,'PatchesKequal2','png');
pause;
clc;clear;
    imb = rgb2gray(imb);
    subplot(5,5,i);
    patch = getPatchFromSIFTParameters(positions2(i,:), scales2(i,:), orientations2(i,:), imb);
    imshow(patch)
end
saveas(2,'PatchesKequal2','png');
pause;
clc;clear;