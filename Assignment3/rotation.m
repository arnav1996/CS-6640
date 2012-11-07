function RI = rotation(I)
theta = 60.0;
rotMat = [cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1];
prodMat = zeros(3, 1);
posMat = zeros(1, 3);
RI = zeros(ceil(size(I, 1) * cosd(theta) + size(I, 2)*sind(theta)), ceil(-size(I,1) * sind(theta) + size(I, 2) * cosd(theta)));
for i = 1:size(I,1)
    for j = 1:size(I, 2)
        posMat = [i j 1];
        prodMat = rotMat * posMat';
        prodMat = floor(prodMat);
        if(prodMat(1,1) > 0 && prodMat(2,1) > 0)
            RI(prodMat(1, 1), prodMat(2, 1)) = I(i,j);
        end
    end
end

RI = uint8(RI);