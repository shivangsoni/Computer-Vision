%Que 3 part a

p = roll_die();
p

%Que 3 part b
y = [1 2 3 4 5 6]';
Z = reshape(y,2,3);

%Que3 part c
%set min value to x and row and column to some value.
minValue = min(Z(:));
[row, column] = find(Z == minValue);


%Que3 part d
 v = [1 8 3 2 1 8 1 8];
  count=sum(v==8);

function a = roll_die()
   a = ceil(rand(1,1)*6);
end