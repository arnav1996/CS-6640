function SHYI = sheary(I)
shy = 3;

shearMat = [1 0 0; shy 1 0; 0 0 1];
prodMat = zeros(3, 1);
posMat = zeros(1, 3);

SHYI = zeros(size(I, 1),  size(I, 1) * shy + size(I,2));

for i = 1:size(I,1)
    for j = 1:size(I,2)
        posMat = [i j 1];
        prodMat = shearMat * posMat';
        SHYI(prodMat(1,1), prodMat(2,1)) = I(i, j);
    end
end