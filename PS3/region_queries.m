clc; close all; clear all;
addpath('./provided_code/')
framesdir = 'frames';
siftdir = 'sift';

K = 300;
frameOfInterest = [32:35];
nFrames = 40;

fnames = dir([siftdir '/*.mat']);

fprintf('reading %d total files...\n', length(fnames));

N = 100;  % to visualize a sparser set of the features

disc = [];

% Loop through all the features and accumulate values 
for i=1:nFrames

    fprintf('reading frame %d\n', i);
    
    % load that file
    fname = [siftdir, '/friends_0000000', num2str(100+i), '.jpeg.mat'];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    
    % read in the associated image
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
    randinds = randperm(numfeats);
    nFeatures = min([N,numfeats]);
    disc = [disc; descriptors];
    
    % This is created to access the feature for a particular frame
    % Creation like this allows subsetting the features per frame when
    % necessary
    feature(i).features = descriptors;
    feature(i).positions = positions;
    feature(i).scales = scales;
    feature(i).orientations = orients;
    feature(i).nFeatures = numfeats;   
    feature(i).imname = cellstr(imname);
    clear descriptors positions scales orients im    
end

%% Cluster
[membership,means,rms] = kmeansML(K,disc');


%% Create Bag-of-words-histogram
HistogramPerFrame = zeros(nFrames,K);


%Map an image’s features into its bag-of-words histogram. 
%The histogram for image I j is a k-dimensional
%vector:

for i=1:nFrames
    
    %Assign cluster values to an array used for computing histogram
    idx = membership(1:feature(i).nFeatures);
    
    for j=1:K
        HistogramPerFrame(i, j) = HistogramPerFrame(i, j) + sum(idx == j);
    end
    
end


%% Select Region

particularFramesWord = zeros(1,K);

% Frame of interst required for the image retrival.
for i=32:32+length(frameOfInterest)-1
    figure;
 %read the image frame by frame
    im = imread(char(feature(i).imname));
 %select the region 
    oninds = selectRegion(im, feature(i).positions(1:feature(i).nFeatures,:));

 % Increasing the word count if been assigned to cluster in consideration
    for j=1:K
        particularFramesWord(j) = particularFramesWord(j) + sum(membership(oninds) == j);
    end
 % display the patch keeping into consideration the polygon drawn by user
    displaySIFTPatches(feature(i).positions(oninds,:), feature(i).scales(oninds), feature(i).orientations(oninds), im); 
   % saveas(i-31,['patchForSelectedRegion',num2str(i-31)],'png');
end
%%






% Compare two bag-of-words histograms using the normalized scalar product:
% In turn computing the similarity score
normFramesHistogram = zeros(nFrames,1);
nominator = zeros(1,nFrames);
denominator = zeros(1,nFrames);
score = zeros(1,nFrames);

%%Calculate norm for the Histogram Per frame
for i=1:nFrames
   normFramesHistogram(i) = norm(HistogramPerFrame(i,:));
end
% Computation of the similarity score done using cosine distance
% Formulae for computing cosine distance
% normalization of wordList obtained from frame in consideration
% normalization of all the Histograms 
size(particularFramesWord)
denominator = norm(particularFramesWord)*normFramesHistogram';
nominator = particularFramesWord*HistogramPerFrame';
score = nominator./denominator;

%%Sort the similarity scores between a query histogram and the histograms 
%associated with the rest of
%the images in the video.
%Pull up the images associated with the M most similar examples

%Remove the scores outputting nan value by replacing those scores with 0
idx = isnan(score);
score(idx) = 0;

% sort the similarity score between the query histogram 
[~, index] = sort(score, 'descend');  


%Pull up the image with some of the selected best similarity score

index(1:10)
figure;


%% Find the corrosponding image based on the ID assigned
for i=1:10
    similarImg = imread(char(feature(index(i)).imname));
    %plot the corrosponding image in a subplot
    subplot(2,5,i);
    imshow(similarImg);
end
saveas(5,'FinalSimilarImagesBasedOnFourFrames','png')