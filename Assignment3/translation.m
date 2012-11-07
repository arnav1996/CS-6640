function TI = translation(I)
tx = 100;
ty = 200;
transMat = [1 0 tx; 0 1 ty; 0 0 1];
posMat = zeros(1, 3);
prodMat = zeros(3, 1);
TI = zeros(size(I, 1), size(I, 2));
for i = 1:size(I, 1)
    for j=1:size(I, 2)
        posMat = [i, j, 1];
        prodMat = transMat * posMat';
        TI(prodMat(1,1), prodMat(2,1)) = I(i, j);
    end
end

TI = uint8(TI);