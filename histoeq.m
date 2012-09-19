function EI = histoeq(I, n, min, max)

IM = zeros(n, 1);
cdf = zeros(n ,1);
H = zeros(n, 1);
EI = uint8(zeros(size(I, 1), size(I, 2)));

for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        for k = 0:n-1
            if (I(i, j) == k)
                IM(k+1) = IM(k+1) + 1;
            end
        end
    end
end

minCDF = 0;

 for i=1:n
     for j=1:i
        cdf(i) = cdf(i) + IM(j);
     end
 end
 
 for i=1:n
        minCDF = cdf(i);
        break;
end

 sz = size(I, 1) * size(I, 2);
 
 for i=1:n
    H(i) = floor(((cdf(i) - minCDF)/(sz - minCDF)) * (n-1));
 end
%  disp(H);

 for i=1:size(I, 1)
     for j=1:size(I, 2)
         for k=1:n
             if (I(i, j) == k)
                 EI(i, j) = H(k);
             end
         end
     end
 end



 

    
    
        