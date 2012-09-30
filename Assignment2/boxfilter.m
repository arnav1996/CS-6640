function EI = boxfilter(I, dim)

bfilter = (1/(dim*dim)) * ones(dim, dim);
a = (dim - 1)/2;
b = (dim - 1)/2;
acc = 0;
EI = zeros(size(I,1), size(I, 2));
offset = (dim + 1)/2;
for i=0:size(I,1) - offset
    for j=0:size(I, 2) - offset
        for m=-a:a
            for n=-b:b
                if ( (j + n + offset <= size(I, 1)) && (i + m + offset <= size(I, 2)))
                    acc = acc + I(i + (m + offset), j + (n + offset)) * bfilter(m + offset, n + offset);
                end
            end
        end
        EI(i + offset, j + offset) = acc;
        acc = 0;
        
    end
end