function TI = threshold(I, n, threshold)
% h = zeros(n, 1);
% TI = uint8(zeros(size(I, 1), size(I, 2)));
TI = zeros(size(I, 1), size(I, 2));
for i=1:size(I,1)
    for j=1:size(I, 2)
        for k=1:n
            if(I(i, j) > threshold)
                TI(i,j) = I(i,j);
            end 
        end
    end
end



