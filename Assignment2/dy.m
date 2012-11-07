function Y = dy(I)
Wdx = int32([-1, 0, 1]);
Wdy = Wdx';
I = double(I);
Y = I;

 for i=1:size(I, 1)
     for j=2:size(I, 2)-1
         if (i <= size(I, 2))
            Y(j+1, i) = double(Wdy(1) * I(j+1, i) + Wdy(2) * I(j, i) + Wdy(3) * I(j - 1, i));   
         end
     end
 end
 
Y = abs(Y);
Y = uint8(Y);

