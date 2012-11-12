function AI = landmark(I, TI)

MPS = mouseposition(I, TI);


ORGCOORDS = MPS(1:5, 1:2);
TRANSCOORDS = MPS(6:10, 1:2);

mat1 = [ORGCOORDS(1,1) ORGCOORDS(2,1) ORGCOORDS(3,1) ORGCOORDS(4, 1) ORGCOORDS(5, 1); ORGCOORDS(1,2) ORGCOORDS(2,2) ORGCOORDS(3,2) ORGCOORDS(4,2) ORGCOORDS(5, 2); 1 1 1 1 1];

mat2 = [TRANSCOORDS(1,1) TRANSCOORDS(2,1) TRANSCOORDS(3,1) TRANSCOORDS(4, 1) TRANSCOORDS(5, 1) ; TRANSCOORDS(1,2) TRANSCOORDS(2,2) TRANSCOORDS(3,2) TRANSCOORDS(4,2) TRANSCOORDS(5, 2); 1 1 1 1 1];

affMat = mat1 * pinv(mat2);


AI = zeros(500, 500);

for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        posMat = [i j 1];
        newPos = affMat * posMat';
        x = newPos(1, 1);
        y = newPos(2, 1);  
        x1 = floor(abs(x));
        y1 = floor(abs(y));
        x2 = ceil(abs(x));
        y2 = ceil(abs(y));
        if(x > 0 && y > 0 && x < size(I,1) && y < size(I, 2) && x1>0 && y1>0 && x2>0 && y2>0)
            interpolatedValue = (1/((x2-x1) * (y2-y1))) * (I(x1, y1) * (x2-x)*(y2-y) + I(x2, y1) * (x-x1) * (y2-y) + I(x1, y2) * (x2 - x) * (y-y1) + I(x2, y2) * (x-x1)*(y-y1));
            AI(i, j) = interpolatedValue;
        end        
    end
end

