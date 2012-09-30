function EI = histoeq1(I, n, min, max)
    h = histogram(I, n, min, max);
%     display(h);
%     count = 0;
    s = zeros(n, 1);
    e = zeros(n, 1);
    temp = zeros(n, 3);
    eq = zeros(n, 1);
    anotherTemp = zeros(size(I, 1) * size(I, 2), 2)
    EI = zeros(size(I, 1), size(I, 2));

    for i=1:n
        temp(i, 1) = i;
        temp(i, 3) = h(i);
        for j=1:i
            s(i) = s(i) + h(j);
            
        end
        s(i) = s(i) * n;
        e(i) = floor(s(i));
    end

    
    
    
    for i=1:size(I, 1)
        for j=1:size(I, 2)
            for k=1:n
                if (I(i,j) == k)
                    temp(k, 2) = temp(k, 2) + 1;
                end
            end            
        end
    end
        
    for i=1:n
        if(e(i) ~= 0)
            eq(e(i)) = eq(e(i)) + temp(i, 2);
        end
    end
 x = 0:.00390625:1
 plot(x,eq);
   
    

             

    
    
        