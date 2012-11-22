function WI = warping(I)

MPS = mouseposition(I, I);

xComp = [MPS(1,1) MPS(2,1) MPS(3,1) MPS(4,1) MPS(5,1)];
yComp = [MPS(1,2) MPS(2,2) MPS(3,2) MPS(4,2) MPS(5,2)];

disp('xComp');
disp(xComp);
disp('yComp');
disp(yComp);
targXComp = [MPS(6,1) MPS(7,1) MPS(8,1) MPS(9,1) MPS(10,1)];
targYComp = [MPS(6,2) MPS(7,2) MPS(8,2) MPS(9,2) MPS(10,2)];

kIX = zeros(1,5);
kIY = zeros(1,5);

WI = zeros(size(I,1), size(I,2));

targetMatrix = vertcat(targXComp', targYComp');

inputMatrix = vertcat(xComp', yComp');


X1 = [xComp(1,1); yComp(1,1)];
X2 = [xComp(1,2); yComp(1,2)];
X3 = [xComp(1,3); yComp(1,3)];
X4 = [xComp(1,4); yComp(1,4)];
X5 = [xComp(1,5); yComp(1,5)];

Xs = [X1 X2 X3 X4 X5];

Y1 = [targXComp(1,1); targYComp(1,2)];
Y2 = [targXComp(1,2); targYComp(1,2)];
Y3 = [targXComp(1,3); targYComp(1,3)];
Y4 = [targXComp(1,4); targYComp(1,4)];
Y5 = [targXComp(1,5); targYComp(1,5)];


RBF = [1 rbf(X1, X2) rbf(X1, X3) rbf(X1, X4) rbf(X1, X5); 
        rbf(X2, X1) 1 rbf(X2, X3) rbf(X2, X4) rbf(X2, X5); 
        rbf(X3, X1) rbf(X3, X2) 1 rbf(X3, X4) rbf(X3, X5); 
        rbf(X4, X1) rbf(X4, X2) rbf(X4, X3) 1 rbf(X4, X5); 
        rbf(X5, X1) rbf(X5, X2) rbf(X5, X3) rbf(X5, X4) 1];

zeroMat = zeros(5, 5); 
B = [RBF zeroMat; zeroMat RBF];
kMat = pinv(B) * (targetMatrix - inputMatrix);

x = 0.0;
y = 0.0;

for i=1:size(I,1)
     for j=1:size(I, 2)
        X = [i j];
        x = X(1,1) - (rbf(X', Y1) * kMat(1,1) + rbf(X', Y2) * kMat(2,1) + rbf(X', Y3) * kMat(3,1) + rbf(X', Y4) * kMat(4,1) + rbf(X', Y5) * kMat(5,1));
        y = X(1,2) - (rbf(X', Y1) * kMat(6,1) + rbf(X', Y2) * kMat(7,1) + rbf(X', Y3) * kMat(8,1) + rbf(X', Y4) * kMat(9,1) + rbf(X', Y5) * kMat(10,1));
        x1 = floor(abs(x));
        y1 = floor(abs(y));
        x2 = ceil(abs(x));
        y2 = ceil(abs(y));
        if(x > 0 && y > 0 && x < size(I,1) && y < size(I, 2) && x1>0 && y1>0 && x2>0 && y2>0)
            interpolatedValue = (1/((x2-x1) * (y2-y1))) * (I(x1, y1) * (x2-x)*(y2-y) + I(x2, y1) * (x-x1) * (y2-y) + I(x1, y2) * (x2 - x) * (y-y1) + I(x2, y2) * (x-x1)*(y-y1));
            WI(i, j) = interpolatedValue;
        end        
     end
end