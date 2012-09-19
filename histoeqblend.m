function EI = histoeqblend(I, n, min, max, alpha)
EQI = (uint8(zeros(size(I, 1), size(I, 2))));
EQI = histoeq(I, n, min, max);
EI = (uint8(zeros(size(I, 1), size(I, 2))));
for i=1:size(I, 1)
    for j=1:size(I, 2)
        EI(i, j) = alpha * EQI(i, j) + (1 - alpha) * I(i, j);
    end
end