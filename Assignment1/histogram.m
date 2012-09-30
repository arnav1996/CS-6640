function h = histogram(I, n, min, max)
    diff = max - min;
    binSize = diff/n;
    h = zeros(n+1, 1);
    for i=1:size(I, 1)
        for j=1:size(I, 2)
            a = I(i, j);
            bin = (a - min) * (1 / binSize);
            if (bin == 0)
                bin = 1;
            end
            h(bin) = (h(bin) + 1);
        end
    end
    h = h / (size(I, 1) * size(I, 2));
        
%     x = 0:.00390625:1
%     plot(x,h);



    