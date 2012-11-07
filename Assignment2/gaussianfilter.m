function GI = gaussianfilter(I)
Wdx = -6:6;
gx = zeros(size(Wdx, 2), 1);
gx = (1/sqrt(2 * pi * 4)) * exp(-.5 * power(( Wdx/2),2 ));
Wdy = -6:6;
Wdy = Wdy';
gy = zeros(size(Wdy, 1),1);
gy = (1/sqrt(2 * pi * 4)) * exp(-.5 * power(( Wdy/2),2 ));
dim = 13;
count =0.0;
X = I;
 for i=1:size(I, 1)
     for j=dim - 1:size(I, 2)-(dim - 2)
         for k = dim:-1:1
             if (j+k-1 <= size(I, 2))
                count = double (count + double(gx(dim - k+1) * I(i, j+k-1)));
             end
         end
         X(i, j+1) = count;
         count = 0.0;
     end
 end

 count = 0.0;
  for i=1:size(X, 1)
     for j=2:size(X, 2)-1
         for k = dim:-1:1
             if (j + k - 1 <= size(I, 1) && i <= size(I, 2))
                count = count + double(gy(dim - k + 1) * X(j+ k - 1, i));   
             end
         end
         GI(j+1, i) = count;
         count = 0.0;
     end
  end


