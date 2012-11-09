function BLI = bilinear(I)
theta = 30.0;
RI = rotation(I);
rotMat = [cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1];
rotMatInv = inv(rotMat);
BLI = zeros(size(RI,1), size(RI, 2));

for i=1:size(RI,1)
    for j = 1:size(RI, 2)
        posMat = [i j 1];
        reversePosMat = rotMatInv * posMat';
        x = reversePosMat(1, 1);
        y = reversePosMat(2,1);
        x1 = floor(abs(x));
        y1 = floor(abs(y));
        x2 = ceil(abs(x));
        y2 = ceil(abs(y));
        if(x > 0 && y > 0 && x < size(I,1) && y < size(I, 2) && x1>0 && y1>0 && x2>0 && y2>0)
            interpolatedValue = (1/((x2-x1) * (y2-y1))) * (I(x1, y1) * (x2-x)*(y2-y) + I(x2, y1) * (x-x1) * (y2-y) + I(x1, y2) * (x2 - x) * (y-y1) + I(x2, y2) * (x-x1)*(y-y1));
            BLI(i, j) = interpolatedValue;
        end
    end
end

