function EI = edgescale(I)
GI = double(zeros(size(I, 1), size(I, 2)));
GI = gaussianfilter(I);
EI = edgemap(GI);
% EI = abs(EI);