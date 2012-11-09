function AINN = affineNN(I)
tx = 100;
ty = 200;
sx = 2;
sy = 2;
shx = 3;
shy = 3;
theta = 45.0;

transMat = [1 0 tx; 0 1 ty; 0 0 1];
rotMat = [cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1];
scaMat = [sx 0 0; 0 sy 0; 0 0 1];
shearMatX = [1 shx 0; 0 1 0; 0 0 1];
shearMatY = [1 0 0; shy 1 0; 0 0 1];

affMat = transMat*rotMat*scaMat*shearMatX*shearMatY;
invAffMat = inv(affMat);

AINN = zeros(size(I,1), size(I,2));
limitsMat = [1, 1, 1];

limitsMat = affMat * limitsMat';
display(limitsMat);




