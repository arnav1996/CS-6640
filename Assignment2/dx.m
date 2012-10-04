function X = dx(I)
Wdx = int32([-1, 0, 1]);
% Wdy = Wdx';
I = int32(I);
X = I;

 for i=1:size(I, 1)
     for j=2:size(I, 2)-1
 %          if (j - 1 >= 1 && j + 1<=size(I, 2))
%              disp(Wdx(1) * I(i, j+1) + Wdx(2) * I(i, j) * Wdx(3) * I(i, j - 1)  );
            X(i, j+1) = int32(Wdx(1) * I(i, j+1) + Wdx(2) * I(i, j) + Wdx(3) * I(i, j - 1));   
     end
 end
 
 X = abs(X);
X = uint8(X);


