function [h] = histogram(I, n, min, max)
    for i=1:size(I, 1)
        for j=1:size(I, 2)
            a = I(i, j);
            print a;
        end
    end



    