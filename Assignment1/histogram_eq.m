function I = histoeq(I, n, min, max)
    h = histogram(I, n, min, max);
    s = zeros(n, 1);
    for i=1:size(h,1)
        for j=1:i
            s(i) = s(i) + h(j);
        end
        s(i) = s(i) * n;
        s(i) = floor(s(i));
        display(s(i));
    end
    
    
    
        