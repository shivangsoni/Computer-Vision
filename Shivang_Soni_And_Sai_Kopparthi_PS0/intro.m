A = [1,2;3,4];
A;
v = 1:0.5:3;
v = pi*[-4:4]/4;

g = rand(3,1);
h = randn(3,1);

m = zeros(3);

v = [1 2 3];
v(3);

a = [1 3 2; 6 5 4; 7 8 9];
[B,V] = eig(a);
B;
V;



a = [1,2; 3,4; 5,6];
b = a(:);

for i=1:2:7
    i;
end


ab = [1 2 3 4];
b = myfunction(2 * ab);

x = [0 1 2 3 4 5];


plot(x,2*x);
axis([0 8 0 8]);


pause;

figure;
x = pi*[-24:24]/24;
plot(x, sin(x));
axis square;
xlabel('radians');
ylabel('sin value');
title('dummy');

pause;
figure;
subplot(1, 2, 1);
plot(x, sin(x));
axis square;
subplot(1, 2, 2);
plot(x, 2*cos(x));
axis square;




pause;
figure;
plot(x,sin(x));
hold on;
plot(x,cos(x),'--');
legend('sin','cos');
hold off;

pause;
figure;
m = rand(64,64);
mesh(m);
colormap gray;
axis image;
axis off;
pause;
figure;
imagesc(m);
colormap gray;
axis image;
axis off;
pause;

I = imread('cit.png');
figure
imagesc(I)
colormap gray;
colorbar
truesize

truesize(2*size(I))

I2 = imresize(I, 0.5, 'bil');
pause;
figure;
imagesc(I2);
colormap gray;
colorbar
truesize


I3 = imrotate(I2, 45, 'bil', 'crop');
pause;
figure;
imagesc(I2);
colormap gray;
colorbar
truesize

pause;
figure;
I3 = double(I2);
imagesc(I3.^2)
pause;
figure;
imagesc(log(I3))
I3 = uint8(I3);
imwrite(I3, 'test.png')


function a = myfunction(p)
 a = p;
end

