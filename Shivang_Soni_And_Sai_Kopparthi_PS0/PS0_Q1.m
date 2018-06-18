
%%PartA
A = rand(100,100);
save PS0_A.mat
load('PS0_A.mat');
figure;
V = A(:);
P = sort(V,'descend');
plot(P);
xlabel('Vector Index');
ylabel('Intensities');
pause;


%%Part B
figure;
histogram(A,20);
pause;
%%Part C
figure;
Z = A(51:end,1:50);
imagesc(Z);
pause;
%%Part D
figure;
P = mean(A);
W = A - repmat(P,100,1);
imagesc(W);
pause;
%%Part E
figure;
for i=1:size(W,1)
    for j=1:size(W,2)
        if(W(i,j)>0)
            W(i,j,1)=255;
            W(i,j,2)=0;
            W(i,j,3)=0;
        else
            W(i,j,1)=0;
            W(i,j,2)=0;
            W(i,j,3)=0;
        end
    end
end
imagesc(W);