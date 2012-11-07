function EI = separableboxfilter(I, dim)
a = (1/ dim) * ones(dim, 1);
 
b = (1/dim) * ones(1, dim);
X = zeros(size(I,1), size(I, 2));
EI = zeros(size(I,1), size(I, 2));
% EI = uint8(conv2(b, (conv2(a, I))));
count = 0.0;
I = double(I);
 for i=1:size(I, 1)
     for j=dim - 1:size(I, 2)-(dim - 2)
         for k = dim:-1:1
             if (j+k-1 <= size(I, 2))
                count = double (count + double(b(dim - k+1) * I(i, j+k-1)));
             end
         end
         X(i, j+1) = count;
         count = 0;
     end
 end

 count = 0;
  for i=1:size(X, 1)
     for j=2:size(X, 2)-1
         for k = dim:-1:1
             if (j + k - 1 <= size(I, 1))
                count = count + double(a(dim - k + 1) * X(j+ k - 1, i));   
             end
         end
         EI(j+1, i) = count;
         count = 0;
     end
  end
  
  EI = uint8(EI);
 