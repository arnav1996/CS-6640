function SHXI = shearx(I)
shx = 3;

shearMat = [1 shx 0; 0 1 0; 0 0 1];
prodMat = zeros(3, 1);
posMat = zeros(1, 3);

SHXI = zeros(size(I, 1) * shx + size(I,2), size(I, 2));

for i = 1:size(I,1)
    for j = 1:size(I,2)
        posMat = [i j 1];
        prodMat = shearMat * posMat';
        SHXI(prodMat(1,1), prodMat(2,1)) = I(i, j);
    end
end