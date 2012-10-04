function TI = threshold(I, threshold)
TI = zeros(size(I, 1), size(I, 2));
for i=1:size(I,1)
    for j=1:size(I, 2)
            if(I(i, j) > threshold)
                TI(i,j) = I(i,j);
            end
    end
end

