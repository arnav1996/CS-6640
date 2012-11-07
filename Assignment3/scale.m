function SI = scale(I)
sx = 2;
sy = 2;

scaMat = [sx 0 0; 0 sy 0; 0 0 1];
prodMat = zeros(3, 1);
posMat = zeros(1, 3);

SI = zeros(size(I,1) * sx, size(I,2) * sy);

for i = 1:size(I,1)
    for j = 1:size(I,2)
        posMat = [i j 1];
        prodMat = scaMat * posMat';
        SI(prodMat(1, 1), prodMat(2,1)) = I(i, j);
    end
end
